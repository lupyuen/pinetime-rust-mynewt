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
//! Mynewt Macro that infers the types in a Rust function
extern crate proc_macro;
use proc_macro::TokenStream;
//use proc_macro2::Span;
use quote::{
    quote, 
    //quote_spanned,
};
use syn::{
    parse_macro_input,
    Expr,
};

/// Given a Rust function definition, infer the placeholder types in the function
pub fn infer_type_internal(_attr: TokenStream, item: TokenStream) -> TokenStream {
    //  println!("attr: {:#?}", attr); println!("item: {:#?}", item);
    //  Parse the macro input as Rust function definition.
    let input: syn::ItemFn = parse_macro_input!(item as syn::ItemFn);
    //  println!("input: {:#?}", input);

    //  Process the Function Declaration
    //  e.g. `fn start_sensor_listener(sensor: _, sensor_type: _, poll_time: _) -> MynewtResult<()>`
    let decl = input.decl;
    //  println!("decl: {:#?}", decl);

    //  `fname` is function name e.g. `start_sensor_listener`
    let fname = input.ident.to_string();
    println!("fname: {:#?}", fname);

    //  For each parameter e.g. `sensor`, `sensor_type`, `poll_time`...
    let mut all_para: Vec<Box<String>> = Vec::new();
    for input in decl.inputs {
        //  Mark each parameter for Type Inference.
        //  println!("input: {:#?}", input);
        match input {
            syn::FnArg::Captured(arg_captured) => {
                //  println!("arg_captured: {:#?}", arg_captured);
                let pat = arg_captured.pat;
                //  println!("pat: {:#?}", pat);
                //  `para` is the name of the parameter e.g. `sensor`
                let para = quote!{ #pat }.to_string();
                println!("para: {:#?}", para);
                all_para.push(Box::new(para));
            }
            _ => { assert!(false, "Unknown input"); }
        }
    }

    //  Process the Block of code inside the function.
    let block = input.block;
    //  For each statement...
    //  e.g. `sensor::set_poll_rate_ms(sensor, poll_time) ?`
    for stmt in block.stmts {
        //  Look for the expression inside the statement and infer the types from the expression.
        //  println!("stmt: {:#?}", stmt);
        match stmt {
            //  `let x = fname( ... )`
            syn::Stmt::Local(local) => {
                let init: Option<(syn::token::Eq, Box<syn::Expr>)> = local.init;
                match init {
                    Some((_eq, expr)) => { infer_from_expr(&all_para, &expr); }
                    _ => {}
                };
            }
            //  `fname( ... )`
            syn::Stmt::Expr(expr) => { infer_from_expr(&all_para, &expr); }
            //  `fname( ... );`
            syn::Stmt::Semi(expr, _semi) => { infer_from_expr(&all_para, &expr); }
            //  Not interested in item definitions: `fn fname( ... ) { ... }`
            syn::Stmt::Item(_item) => {}
        };
        break; ////
        /*
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

    "// Should not come here".parse().unwrap()
}

/// Infer the types of the parameters in `all_para` recursively from the expression `expr`
fn infer_from_expr(all_para: &Vec<Box<String>>, expr: &Expr) {
    //  println!("expr: {:#?}", expr);
    match expr {
        //  `fname( ... )`
        Expr::Call(expr) => { infer_from_call(&all_para, &expr); }
        Expr::Binary(expr) => {}
        Expr::Unary(expr) => {}
        Expr::Let(expr) => {}
        Expr::If(expr) => {}
        Expr::While(expr) => {}

        Expr::ForLoop(expr) => {}
        Expr::Loop(expr) => {}
        Expr::Paren(expr) => {}
        Expr::Group(expr) => {}
        //  `fname( ... ) ?`
        Expr::Try(expr) => { infer_from_expr(&all_para, &expr.expr); }

        //  TODO: Array, MethodCall, Tuple, Match, Closure, Unsafe, Block, Assign, AssignOp

        //  Not interested: Field, Index, Range, Path, Reference, Break, Continue, Return, Macro, Struct, Repeat, Async, TryBlock, Yield, Verbatim
        _ => {}
    };
}

/// Infer the types of the parameters in `all_para` recursively from the function call `call`
fn infer_from_call(all_para: &Vec<Box<String>>, call: &syn::ExprCall) {
    //  println!("call: {:#?}", call);
    //  For each function call `ExprCall`...    
    //  If this function call `ExprCall.func` is for a Mynewt API...
    //  e.g. `sensor::set_poll_rate_ms(sensor, poll_time) ? ;`
    let func = &call.func;
    println!("func: {:#?}", quote!{ #func }.to_string());

    //  Fetch the Mynewt API function declaration
    //  e.g. `fn sensor::set_poll_rate_ms(&Strn, u32)`

    //  For each argument in function call `ExprCall.args` e.g. `sensor`, `poll_time`, ...
    let args = &call.args;
    for arg in args {
        println!("arg: {:#?}", quote!{ #arg }.to_string());
        //  Match the identifier `ident` (e.g. `sensor`) with the corresponding Mynewt API 
        //  parameter type (e.g. `&Strn`).

        //  Remember the inferred type of the identifier...
        //  `sensor` has inferred type `&Strn`
        //  `poll_time` has inferred type `u32`

        /*
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
}