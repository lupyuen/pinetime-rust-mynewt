/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
//! Mynewt Macro that infers the types in a Rust function or struct
extern crate proc_macro;
use proc_macro::{
    TokenStream,
};
use proc_macro2::{
    Span,
};
use std::{
    collections::HashMap,
    fs::File,
    io::prelude::*,
    path::Path,
};
use rustc_serialize::json;
use quote::{
    quote, 
    //quote_spanned,
    //ToTokens,
};
use syn::{
    parse_macro_input,
    Block,
    Expr,
    spanned::Spanned,
};

/// Mynewt API Declarations
const MYNEWT_DECL_JSON: &str = r#"{
    "sensor::set_poll_rate_ms"          : [ ["devname", "&Strn"],            ["poll_rate",   "u32"]             ],
    "sensor::mgr_find_next_bydevname"   : [ ["devname", "&Strn"],            ["prev_cursor", "*mut sensor"]     ],
    "sensor::register_listener"         : [ ["sensor",  "*mut sensor"],      ["listener",    "sensor_listener"] ],
    "sensor::new_sensor_listener"       : [ ["sensor_key", "&'static Strn"], ["sensor_type", "sensor_type_t"],  ["listener_func", "SensorValueFunc"] ],
    "on_my_label_show"                  : [ ["state", "&State"],             ["env", "&Env"] ],
    "on_my_button_press"                : [ ["ctx", "&mut EventCtx<State>"], ["state", "&mut State"],           ["env", "&Env"] ]
}"#;  //  TODO: Generalise `on_..._show` and `on_..._press`

/// File for storing type inference across builds
const INFER_FILE: &str = "infer.json";

/// Given a Rust function or struct definition, infer the placeholder types in the function or struct
pub fn infer_type_internal(_attr: TokenStream, item: TokenStream) -> TokenStream {
    //  println!("attr: {:#?}", attr); println!("item: {:#?}", item);

    //  Parse the macro input.
    let input = parse_macro_input!(item as syn::Item);
    //  println!("input: {:#?}", input);    
    match input {
        //  If it's a function, infer the types in the function declaration.
        syn::Item::Fn(item_fn) => infer_function_types(item_fn),
        //  If it's a struct, infer the types inside the struct.
        syn::Item::Struct(item_struct) => infer_struct_types(item_struct),
        _ => { 
            assert!(false, "infer_type may be used for functions and structs only");
            TokenStream::new()
        },
    }
}

/// Given a Rust function definition, infer the placeholder types in the function
fn infer_function_types(input: syn::ItemFn) -> TokenStream {
    //  Process the Function Declaration
    //  e.g. `fn start_sensor_listener(sensor: _, sensor_type: _, poll_time: _) -> MynewtResult<()>`
    let sig = &input.sig;
    //  println!("sig: {:#?}", sig);

    //  `fname` is function name e.g. `start_sensor_listener`
    let fname = sig.ident.to_string();
    unsafe { CURRENT_FUNC = Some(Box::new(fname.clone())); }
    //  println!("fname: {:#?}", fname);

    //  If this is a known function prototype e.g. `on_my_button_press`, get the prototype para types and apply later.
    let mut known_paras = get_decl(&fname).clone();

    //  For each parameter e.g. `sensor`, `sensor_type`, `poll_time`...
    let mut all_para: ParaMap = HashMap::new();
    for input in &sig.inputs {
        //  Mark each parameter for Type Inference.
        //  println!("input: {:#?}", input);
        match input {
            syn::FnArg::Typed(arg_captured) => {
                //  println!("arg_captured: {:#?}", arg_captured);
                let pat = &arg_captured.pat;
                //  println!("pat: {:#?}", pat);
                //  `para` is the name of the parameter e.g. `sensor`
                let para = quote!{ #pat }.to_string();
                //  println!("para: {:#?}", para);

                //  If this is a known function prototype e.g. `on_my_button_press`, apply the prototype para type.
                let mut para_type = "_".to_string();
                if known_paras.len() > 0 {
                    para_type = known_paras[0][1].to_string();
                    known_paras = known_paras[1..].to_vec();
                }
                all_para.insert(Box::new(para), Box::new(para_type));
                s(pat.span());
            }
            _ => { assert!(false, "Unknown input"); }
        }
    }
    //  println!("all_para: {:#?}", all_para);

    //  Add the Application State fields for type inference, e.g. `struct State { count: _, }` which becomes `state.count`
    //  TODO: Is this needed?
    let state = get_decl("State");
    //  println!("state: {:#?}", state);
    for field in state {
        let field_name = field[0].to_string();
        let field_type = field[1].to_string();
        if field_type != "_" { continue; }  //  Skip if already inferred
        all_para.insert(Box::new("state.".to_string() + &field_name), Box::new("_".to_string()));
        //  all_para.insert(Box::new(field_name), Box::new("_".to_string()));
    }

    //  Infer the types from the Block of code inside the function.
    let block = input.block;
    infer_from_block(&mut all_para, &block);

    //  Now that the types have been inferred, generate the Rust function declaration with the inferred types.
    let mut new_inputs = sig.inputs.clone();
    let mut all_para_types: ParaTypeList = Vec::new();
    //  For each parameter e.g. `sensor`, `sensor_type`, `poll_time`...
    for input in &mut new_inputs {
        //  Set the inferred type of each parameter.
        //  println!("input: {:#?}", input);
        match input {
            syn::FnArg::Typed(arg_captured) => {
                //  `para` is the name of the parameter e.g. `sensor`
                //  Change the type of the argument.
                let pat = &arg_captured.pat;
                let para = quote!{ #pat }.to_string();
                let type_str = match all_para.get(&para) {
                    //  Return the type if it exists.
                    Some(type_str) => type_str,
                    //  If we can't infer the type, leave as `_` for now. Maybe another function will infer this type.
                    None => "_"
                };
                if type_str != "_" {
                    //  If the type exists, remember it.
                    let tokens = type_str.parse().unwrap();
                    arg_captured.ty = Box::new(parse_macro_input!(tokens as syn::Type));
                }
                //  Remember the parameter type globally e.g. `[sensor, &Strn]`
                let para_type: ParaType = vec![Box::new(para), Box::new(type_str.to_string())];
                all_para_types.push(para_type);                
            }
            _ => { assert!(false, "Unknown input"); }
        }
    }

    //  Populate the types in the Application State.
    let mut state: ParaTypeList = Vec::new();
    for (field_name, field_type) in &all_para {
        //  State variables begin with `state.`
        if !field_name.starts_with("state.") { continue; }
        if field_type.to_string() == "_" { continue; }  //  No inferred type

        //  Remember the state type globally e.g. `[count, i32]`
        let state_item: ParaType = vec![
            Box::new(field_name.get(6..).unwrap().to_string()),  //  Remove `state.`
            Box::new(field_type.to_string())
        ];
        state.push(state_item);                        
    }
    
    //  Add this function to the global declaration list. Must reload because another process may have updated the file.
    let mut new_func_map = load_decls();
    new_func_map.insert(Box::new(fname.clone()), all_para_types);
    if state.len() > 0 {
        new_func_map.insert(Box::new("State".to_string()), state);
    }
    save_decls(&new_func_map);

    //  Combine the new Rust function definition with the old function body.
    let mut new_sig = syn::Signature {
        inputs: new_inputs,
        ..sig.clone()
    };
    //  Set the return type, if known.
    let return_type = get_return_type(&fname);  //  e.g. `MynewtResult<ArgValue>`
    if return_type != "_" {
        let arrow_return_type = 
            if return_type == "" { "".to_string() }    //  No return value
            else { "-> ".to_string() + &return_type };  //  e.g. `-> MynewtResult<ArgValue>`
        let tokens = arrow_return_type.parse().unwrap();
        new_sig.output = parse_macro_input!(tokens as syn::ReturnType);
    }
    let output = syn::ItemFn {
        sig:    new_sig,
        block:  block,
        ..input
    };
    //  Return the new Rust function definition to the Rust Compiler.
    let expanded = quote! {        
        #output
    };
    expanded.into()
}

/// Given a Rust struct definition, infer the placeholder types in the struct
fn infer_struct_types(input: syn::ItemStruct) -> TokenStream {
    //  Process the Struct Definition
    //  e.g. `struct State { count: _, }`

    //  `struct_name` is struct name e.g. `Struct`
    let struct_name = input.ident.to_string();
    unsafe { CURRENT_FUNC = Some(Box::new(struct_name.clone())); }
    //  println!("struct_name: {:#?}", struct_name);

    //  Get the list of fields and their inferred types
    //  let mut all_para: ParaMap = HashMap::new();
    if let syn::Fields::Named(fields) = &input.fields {
        //  Clone the fields for updating.
        let mut new_fields = fields.named.clone();
        //  For each field e.g. `count: _`
        for field in &mut new_fields {
            //  println!("field: {:#?}", field);
            if let Some(ident) = &field.ident {  //  e.g. `count`
                //  all_para.insert(Box::new(ident.to_string()), Box::new("_".to_string()));
                //  s(field.span());
                //  Fetch the inferred type.
                let type_str = get_inferred_type(&struct_name, &ident.to_string());
                //  Populate the inferred type into the struct definition.
                if type_str != "_" {
                    let tokens = type_str.parse().unwrap();
                    field.ty = parse_macro_input!(tokens as syn::Type);
                }
                /*
                //  Remember the field type globally e.g. `[count, i32]`
                let para_type: ParaType = vec![Box::new(ident.to_string()), Box::new(type_str.to_string())];
                all_para_types.push(para_type);                
                */
            }
        }
        //  Populate the inferred types into the old struct definition.
        let new_fields_named = syn::FieldsNamed {
            named: new_fields,
            ..fields.clone()
        };
        let output = syn::ItemStruct {
            fields: syn::Fields::Named(new_fields_named),
            ..input
        };
        //  Return the new Rust struct definition to the Rust Compiler.
        let expanded = quote! {        
            #output
        };
        return expanded.into()
    }
    TokenStream::new()  //  TODO: Return the previous struct
}

/// Return the previously inferred type for the function/struct and parameter/variable name
fn get_inferred_type(function_name: &str, para_name: &str) -> String {
    //  Populate the previously inferred types into the old struct definition.
    let state = get_decl(function_name);
    //  println!("state: {:#?}", state);
    for field in state {
        let field_name = field[0].to_string();  //  e.g. `count`
        let field_type = field[1].to_string();  //  e.g. `i32`
        if field_name == para_name { return field_type; }
    }
    "_".to_string()  //  Field not found
}

/// Infer the types of the parameters in `all_para` recursively from the function call `call`
fn infer_from_call(all_para: &mut ParaMap, call: &syn::ExprCall) {
    //  println!("call: {:#?}", call);
    s(call.span());
    //  For each function call `ExprCall`...    
    //  If this function call `ExprCall.func` is for a Mynewt API...
    //  e.g. `sensor::set_poll_rate_ms(sensor, poll_time) ? ;`
    let func = &call.func;
    //  println!("func: {:#?}", quote!{ #func }.to_string());

    //  `fname` looks like `sensor::set_poll_rate_ms`
    let fname = quote!{ #func }.to_string().replace(" ", "");
    //  println!("fname: {:#?}", fname);

    //  Fetch the Mynewt API function declaration
    //  e.g. `fn sensor::set_poll_rate_ms(&Strn, u32)`
    let decl_list = get_decl(&fname);
    if decl_list.len() == 0 { return };  //  Function declaration not found.
    m(&fname, call.span());

    //  For each argument `arg` in function call `ExprCall.args` e.g. `sensor`, `poll_time`, ...
    let args = &call.args;
    s(args.span());
    for pos in 0 .. args.len() {
        //  Match the identifier `ident` in `arg` (e.g. `sensor`) with the corresponding Mynewt API 
        //  parameter type `decl_type` (e.g. `&Strn`).
        //  TODO: If argument `arg` is not in our list of parameters `all_para`, skip.
        let arg = &args[pos];
        let arg_str = quote!{ #arg }.to_string().replace(" ", "");
        let decl_type = &decl_list[pos][1];
        //  println!("arg: {:#?}", arg);

        //  Remember the inferred type of the identifier...
        //  `sensor` has inferred type `&Strn`
        //  `poll_time` has inferred type `u32`
        all_para.insert(Box::new(arg_str.clone()), Box::new(decl_type.to_string()));

        println!("{}: {} has inferred type {}", get_current_function(), arg_str, decl_type);
        s(arg.span());

        #[cfg(procmacro2_semver_exempt)]  //  For replay log
        {
            let decl_name = &decl_list[pos][0];
            println!("#i {} | {} | {} | {} | {}", get_current_function(), arg_str, fname, decl_name, decl_type);
        }

        /* `arg` looks like:
            Path(
            ExprPath {
                attrs: [],
                qself: None,
                path: Path {
                    leading_colon: None,
                    segments: [
                        PathSegment {
                            ident: Ident {
                                ident: "sensor",
                                span: #0 bytes(0..0),
                            },
                            arguments: None, ...
        */
    }
    s(args.span());
    s(call.span());
}

///  For macro call `coap!( ..., sensor_data )`, infer `sensor_data` as `&SensorValue`
fn infer_from_macro(all_para: &mut ParaMap, macro_expr: &syn::ExprMacro) {
    //  println!("macro: {:#?}", macro_expr);
    s(macro_expr.span());
    let mac = &macro_expr.mac;
    let path = &mac.path;
    let path_str = quote!{ #path }.to_string();
    //  println!("mac: {:#?}", mac);
    let tts = &mac.tokens;
    let tts_str = quote!{ #tts }.to_string();
    //  `path_str` looks like `coap`
    //  `tts_str` looks like `@ json { \"device\" : & device_id , sensor_data , }`
    //  println!("path: {:#?}", quote!{ #path }.to_string());
    //  println!("tts: {:#?}",  quote!{ #tts }.to_string());
    //  If macro is not `coap`, quit.
    if path_str != "coap" { return }
    m(&path_str, macro_expr.span());

    //  We will parse `tts_str` the simplistic way, by spltting strings. Look for singleton fields like `sensor_data`.
    let tts_split: Vec<&str> = tts_str.splitn(2, "{").collect();
    if tts_split.len() < 2 { return }
    let tts_str = tts_split[1];

    let tts_split: Vec<&str> = tts_str.splitn(2, "}").collect();
    if tts_split.len() < 2 { return }
    let tts_str = tts_split[0];

    //  `tts_str` contains `\"device\" : & device_id , sensor_data ,`
    let tts_split: Vec<&str> = tts_str.split(",").collect();
    for field in tts_split {
        let field = field.trim();
        if field == "" { continue }          //  Skip empty fields
        if field.contains(":") { continue }  //  Skip `key:val` fields
        //  Field must be a singleton like `sensor_data`. Infer as type `&SensorValue`.
        let decl_type = "&SensorValue";
        println!("{}: {} has inferred type {}", get_current_function(), field, decl_type);
        #[cfg(procmacro2_semver_exempt)]  //  For replay log
        println!("#i {} | {} | {} | {} | {}", get_current_function(), field, path_str, "singleton", decl_type);
        all_para.insert(Box::new(field.to_string()), Box::new(decl_type.to_string()));
    }
    s(macro_expr.span());
}

/// Infer the types of the parameters in `all_para` recursively from the code block `block`
fn infer_from_block(all_para: &mut ParaMap, block: &Block) {
    s(block.span());
    //  For each statement in the block...
    //  e.g. `sensor::set_poll_rate_ms(sensor, poll_time) ?`
    for stmt in &block.stmts {
        //  Look for the expression inside the statement and infer the types from the expression.
        //  println!("stmt: {:#?}", stmt);
        match stmt {
            //  `let x = ...`
            syn::Stmt::Local(local) => {
                s(stmt.span());
                if let Some((_eq, expr)) = &local.init {
                    infer_from_expr(all_para, &expr);
                }
            }
            //  `fname( ... )`
            syn::Stmt::Expr(expr) => { 
                s(stmt.span());
                infer_from_expr(all_para, &expr); 
            }
            //  `fname( ... );`
            syn::Stmt::Semi(expr, _semi) => { 
                s(stmt.span());
                infer_from_expr(all_para, &expr); 
            }
            //  Not interested in item definitions: `fn fname( ... ) { ... }`
            syn::Stmt::Item(_item) => {}
        };
        /* `stmt` looks like:
                Semi(
                    Try(
                        ExprTry {
                            attrs: [],
                            expr: Call(
                                ExprCall {
                                    attrs: [],
                                    func: Path(
                                        ExprPath {
                                            attrs: [],
                                            qself: None,
                                            path: Path {
                                                leading_colon: None,
                                                segments: [
                                                    PathSegment {
                                                        ident: Ident {
                                                            ident: "sensor",
                                                            span: #0 bytes(0..0),
                                                        },
                                                        arguments: None,
                                                    },
                                                    Colon2,
                                                    PathSegment {
                                                        ident: Ident {
                                                            ident: "set_poll_rate_ms",
                                                            span: #0 bytes(0..0),
                                                        },
                                                        arguments: None, ...
        */        
    }
    s(block.span());
}

/// Infer the types of the parameters in `all_para` from the assignment `assign`, e.g. `state.count = 0`
fn infer_from_assign(all_para: &mut ParaMap, assign: &syn::ExprAssign) {
    //  println!("infer_from_assign: {:#?}", assign);
    let syn::ExprAssign{ left, right, .. } = assign;
    let var_name = quote!{ #left }.to_string().replace(" ", "");  //  e.g. `state.count`
    //  println!("var_name: {:#?}", var_name);
    let value = quote!{ #right }.to_string();  //  e.g. `0`
    //  println!("value: {:#?}", value);

    if value.parse::<i32>().is_ok() {
        //  If value is an integer, the variable must be i32.
        all_para.insert(Box::new(var_name.clone()), Box::new("i32".to_string()));
    } else if value.parse::<f32>().is_ok() {
        //  If value is a float, the variable must be f32.
        all_para.insert(Box::new(var_name.clone()), Box::new("f32".to_string()));
    } else if value.as_str().chars().nth(0) == Some('"') {
        //  If value is a string, the variable must be &str.
        all_para.insert(Box::new(var_name.clone()), Box::new("&str".to_string()));
    }
    //  TODO: Handle function calls for value.
    //  println!("infer_from_assign: {:#?}", all_para);
}

/// Infer the types of the parameters in `all_para` recursively from the expression `expr`
fn infer_from_expr(all_para: &mut ParaMap, expr: &Expr) {
    //  println!("expr: {:#?}", expr);
    s(expr.span());
    match expr {
        //  `fname( ... )`
        Expr::Call(expr) => { 
            infer_from_call(all_para, &expr); 
        }
        //  `... + ...`
        Expr::Binary(expr) => {
            infer_from_expr(all_para, &expr.left);
            infer_from_expr(all_para, &expr.right);
        }
        //  `- ...`
        Expr::Unary(expr) => {
            infer_from_expr(all_para, &expr.expr);            
        }
        //  `let x = ...`
        Expr::Let(expr) => {
            infer_from_expr(all_para, &expr.expr);            
        }
        //  State Creation: `state.count = 0`
        Expr::Assign(expr) => {            
            infer_from_assign(all_para, &expr); 
        }
        //  `if cond { ... } else { ... }`
        Expr::If(expr) => {
            infer_from_expr(all_para, &expr.cond);
            infer_from_block(all_para, &expr.then_branch);
            if let Some((_else, expr)) = &expr.else_branch {
                infer_from_expr(all_para, &expr);
            }
        }
        //  `while cond { ... }`
        Expr::While(expr) => {
            infer_from_expr(all_para, &expr.cond);
            infer_from_block(all_para, &expr.body);
        }
        //  `for i in ... { ... }`
        Expr::ForLoop(expr) => {
            infer_from_expr(all_para, &expr.expr);
            infer_from_block(all_para, &expr.body);
        }
        //  `loop { ... }`
        Expr::Loop(expr) => {
            infer_from_block(all_para, &expr.body);

        }
        //  `( ... )`
        Expr::Paren(expr) => {
            infer_from_expr(all_para, &expr.expr);
        }
        //  `...`
        Expr::Group(expr) => {
            infer_from_expr(all_para, &expr.expr);
        }
        //  `fname( ... ) ?`
        Expr::Try(expr) => { 
            infer_from_expr(all_para, &expr.expr); 
        }
        //  For macro call `coap!( ..., sensor_data )`, infer `sensor_data` as `&SensorValue`
        Expr::Macro(expr) => {
            infer_from_macro(all_para, &expr);
        }
        //  TODO: Box, Array, MethodCall, Tuple, Match, Closure, Unsafe, Block, AssignOp

        //  Not interested: InPlace, Field, Index, Range, Path, Reference, Break, Continue, Return, Struct, Repeat, Async, TryBlock, Yield, Verbatim
        _ => {}
    };
    s(expr.span());
}

//  Init the globals lazily because Rust doesn't allow `::new()` to be called during init
lazy_static::lazy_static! {
    ///  Mynewt function declarations
    static ref MYNEWT_DECL: FuncTypeMap = json::decode(&MYNEWT_DECL_JSON.to_string()).unwrap();
    ///  Source function declarations loaded from JSON file
    static ref SOURCE_DECL: FuncTypeMap = load_decls();
    static ref EMPTY_PARA_TYPE_LIST: ParaTypeList = Vec::new();    
}

/// Return the Mynewt API function declaration or previously-inferred parameter types for the function named `fname`
fn get_decl(fname: &str) -> &ParaTypeList {
    //  TODO: Generalise for UI events `on_..._show` and `on_..._press`
    if fname.starts_with("on_") {
        if fname.ends_with("_show") {
            return MYNEWT_DECL.get(&"on_my_label_show".to_string()).unwrap();
        }
        if fname.ends_with("_press") {
            return MYNEWT_DECL.get(&"on_my_button_press".to_string()).unwrap();
        }
    }
    if let Some(para_type_list) = MYNEWT_DECL.get(&fname.to_string()) { return &para_type_list }
    if let Some(para_type_list) = SOURCE_DECL.get(&fname.to_string()) { return &para_type_list }
    &EMPTY_PARA_TYPE_LIST
}

/// Return the return type for the function named `fname`
fn get_return_type(fname: &str) -> String {
    //  TODO: Generalise for UI events `on_..._show` and `on_..._press`
    if fname.starts_with("on_") {
        if fname.ends_with("_show") {
            return "ArgValue".to_string();
        }
        if fname.ends_with("_press") {
            return "".to_string();
        }
    }
    match fname {
        //  "on_my_label_show"   => "ArgValue".to_string(),  //  "MynewtResult<ArgValue>".to_string(),
        //  "on_my_button_press" => "".to_string(),  //  "MynewtResult".to_string(),
        "ui_builder" => "impl Widget<State>".to_string(),
        _ => "_".to_string()
    }
}

/// Load the function declarations from a JSON file.
fn load_decls() -> FuncTypeMap {
    // Create a path to the desired file
    let path = Path::new(INFER_FILE);
    let _display = path.display();

    // Open the path in read-only mode, returns `io::Result<File>`
    let mut file = match File::open(&path) {
        // The `description` method of `io::Error` returns a string that describes the error
        Err(_why) => return HashMap::new(),
        Ok(file) => file
    };
    // Read the file contents into a string, returns `io::Result<usize>`
    let mut s = String::new();
    match file.read_to_string(&mut s) {
        Err(_why) => return HashMap::new(),
        Ok(_) => {}
    };
    // println!("load_decls: {}, {:#?}", display, s);
    let all_funcs: FuncTypeMap = json::decode(&s).unwrap();
    return all_funcs;
}

/// Save the function declarations to a JSON file.
fn save_decls(all_funcs: &FuncTypeMap) {
    let encoded = json::encode(&all_funcs).unwrap();
    let path = Path::new(INFER_FILE);
    let display = path.display();
    // println!("save_decls: {}, {:#?}", display, encoded);
    // Open a file in write-only mode, returns `io::Result<File>`
    let mut file = match File::create(&path) {
        Err(why) => panic!("couldn't create {}: {}", display, why.to_string()),
        Ok(file) => file,
    };
    match file.write_all(encoded.as_bytes()) {
        Err(why) => panic!("couldn't write to {}: {}", display, why.to_string()),
        Ok(_) => println!("{}: updated {}", get_current_function(), display),
    };
}

/// Display the span. The following must be set in `.cargo/config`:
/// ```yml
/// [build]
/// rustflags = [ "--cfg",  "procmacro2_semver_exempt" ]
/// ```
#[cfg(procmacro2_semver_exempt)]  //  For replay log
fn s(span: Span) {
    let file = span.source_file();
    let start = span.start();
    let end = span.end();
    println!("#s {} | {} | {} | {} | {}", file.path().to_str().unwrap(), start.line, start.column, end.line, end.column);
}

/// If spans not enabled, do nothing
#[cfg(not(procmacro2_semver_exempt))]
fn s(_span: Span) {}

/// Display the function being matched and the span
#[cfg(procmacro2_semver_exempt)]  //  For replay log
fn m(fname: &str, span: Span) {
    let file = span.source_file();
    let start = span.start();
    let end = span.end();
    println!("#m {} | {} | {} | {} | {} | {}", fname, file.path().to_str().unwrap(), start.line, start.column, end.line, end.column);
}

/// If spans not enabled, do nothing
#[cfg(not(procmacro2_semver_exempt))]
fn m(_fname: &str, _span: Span) {}

/// Return the name of current function being processed.
fn get_current_function() -> Box<String> {
    let s = unsafe { format!("{:?}", CURRENT_FUNC) };
    let s2: Vec<&str> = s.splitn(3, "\"").collect();
    return Box::new(s2[1].to_string());
}

/// Name of current function being processed
static mut CURRENT_FUNC: Option<Box<String>> = None;

/// Represents a map of parameter names indexed to the parameter type.
type ParaMap = HashMap<Box<String>, Box<String>>;
/// Represents the name and type of a parameter e.g. `[sensor, &Strn]`
type ParaType = Vec<Box<String>>;
/// Represents a list of parameter names and types
type ParaTypeList = Vec<ParaType>;
/// Represents a function name indexed to the function's parameters
type FuncTypeMap = HashMap<Box<String>, ParaTypeList>;
