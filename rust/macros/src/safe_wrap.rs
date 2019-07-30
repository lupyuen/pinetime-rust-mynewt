//! Mynewt Macro that creates a safe wrapper
extern crate proc_macro;
use proc_macro::TokenStream;
use proc_macro2::Span;
use quote::{quote, quote_spanned};
use syn::{
    parse_macro_input,
    ArgCaptured,
    Expr,
    FnArg::{
        self,
        Captured,
    },
    ForeignItem,
    ForeignItemFn,
    Ident,
    ItemForeignMod,
    ReturnType,
    Type,
    punctuated::Punctuated,
    spanned::Spanned,
    token::Comma,
};

/// Given a function name like `os_task_init`, return true if we should create the wrapper
fn function_is_whitelisted(fname: &str) -> bool {
    match fname {  //  If match found, then it's whitelisted.
        //  kernel/os
        "os_eventq_dflt_get"        => { true }
        "os_eventq_run"             => { true }
        "os_task_init"              => { true }

        //  hw/sensor
        "sensor_mgr_find_next_bydevname"    => { true }
        "sensor_set_poll_rate_ms"           => { true }

        //  libs/sensor_network
        "do_server_post"            => { true }
        "init_server_post"          => { true }
        "start_server_transport"    => { true }

        _ => { false }  //  Else not whitelisted.
    }
}

/// Given an `extern "C"` block of function declarations, generate the safe wrapper for the function.
pub fn safe_wrap_internal(_attr: TokenStream, item: TokenStream) -> TokenStream {
    //  println!("attr: {:#?}", attr); println!("item: {:#?}", item);
    //  Parse the macro input as an extern "C" function declaration.
    let input = parse_macro_input!(item as ItemForeignMod);
    //  println!("input: {:#?}", input);
    //  For each `ForeignItem` function or variable declaration...
    for foreign_item in input.items {  //  `foreign_item` has type `ForeignItem`
        match foreign_item {
            ForeignItem::Fn(foreign_fn) => {
                //  Generate the safe wrapper tokens for the extern function.
                let expanded = wrap_function(&foreign_fn);
                //  Return the expanded tokens back to the compiler.
                //  println!("expanded: {:#?}", expanded);
                return TokenStream::from(expanded)  //  TODO: Handle multiple functions.
            }
            ForeignItem::Static(foreign_static) => {
                return quote! { extern "C" { #foreign_static } }.into()
            }
            _ => {
                println!("safe_wrap_internal: Unknown extern {:#?}", quote! { #foreign_item }.to_string());
                assert!(false); //  TODO: Handle unknown extern.
            }
        }        
        break;
    }
    println!("safe_wrap_internal: Loop should not terminate");
    assert!(false);  //  TODO: Handle non-function externs.
    "// Should not come here".parse().unwrap()
}

/// Return the safe wrapper tokens for the extern function
pub fn wrap_function(foreign_fn: &ForeignItemFn) -> proc_macro2::TokenStream {
    //  println!("foreign_fn: {:#?}", foreign_fn);
    //  Contains `#[doc] ... pub fn ...`
    let foreign_item_tokens = quote! { #foreign_fn };
    //  println!("foreign_item_tokens: {:#?}", foreign_item_tokens.to_string());

    //  Get the function name, with and without namespace (`os_task_init` vs `task_init`)
    let transformed_fname = transform_function_name(&foreign_fn.ident);
    let TransformedFunctionName{ 
        ident: fname,
        token: fname_token, 
        without_namespace_token: fname_without_namespace_token, .. 
    } = transformed_fname;

    //  If function name is not whitelisted, return the extern tokens without wrapping.
    if !function_is_whitelisted(&fname) { 
        return quote! { extern "C" { #foreign_item_tokens } }
    }

    //  Move the `#[doc]` attributes out from the extern and into the top level.
    //  TODO: Accumulate doc in attrs and rename args.
    let attrs = &foreign_fn.attrs;
    let mut doc_tokens = proc_macro2::TokenStream::new();
    for attr in attrs {
        // println!("attr: {:#?}", quote! { #attr }.to_string());
        let attr_span = attr.span();
        let tokens = quote_spanned!(attr_span => #attr);
        doc_tokens.extend(tokens);
    }

    //  Get the extern declaration without the doc attributes.
    //  let extern_decl = foreign_fn.decl;
    //  let extern_decl_span = &foreign_fn.span();
    //  let extern_decl_tokens = quote_spanned!(extern_decl_span => #extern_decl);

    //  Transform the return type.
    let transformed_ret = transform_return_type(&foreign_fn.decl.output);
    let TransformedReturnType{ 
        declare_result_tokens, get_result_tokens, return_result_tokens, .. 
    } = transformed_ret;

    //  Get the function args and transform each arg into 3 forms:
    //  (1) Wrap Declaration: How the arg type is exposed via the wrapper
    //  (2) Validation Stmt: To validate each arg if needed, e.g. check strings are null-terminated
    //  (3) Call Expr: Inside the wrapper, call the Mynewt API with type casting
    let args = &foreign_fn.decl.inputs;
    let transformed_args = transform_arg_list(args);

    //  For all args, collect the tokens for the Wrap, Validation and Call forms.
    let wrap_tokens = collect_wrap(&transformed_args);
    let validation_tokens = collect_validation(&transformed_args);
    let call_tokens = collect_call(&transformed_args);

    //  Compose the wrapper code as tokens.
    let expanded = quote! {
        //  "----------Insert Doc: `#[doc]`----------";
        #doc_tokens
        //  "----------Insert Func Name: `pub fn task_init() -> ... {`----------";
        pub fn #fname_without_namespace_token(
            //  "----------Insert Wrapped Decl----------";
            #wrap_tokens
            /* Like this:
                t: Out<os_task>,  //  Previously: *mut os_task
                name: &Strn,      //  Previously: *const ::cty::c_char
                func: os_task_func_t,
                arg: Ptr,         //  Previously: *mut ::cty::c_void
                prio: u8,
                sanity_itvl: os_time_t,
                stack_bottom: Out<[os_stack_t]>,  //  Previously: *mut os_stack_t
                stack_size: usize,                //  Previously: u16 */
        ) -> #declare_result_tokens {             //  e.g. MynewtResult<()> or MynewtResult<* mut os_eventq>
            "----------Insert Extern Decl: `extern C { pub fn ... }`----------";
            extern "C" { #foreign_item_tokens }
            "----------Insert Validation: `Strn::validate_bytestr(name.bytestr)`----------";
            #validation_tokens
            unsafe {
            "----------Insert Call: `let result_code = os_task_init(`----------";
                #get_result_tokens #fname_token(
                    //  "----------Insert Call Expr----------";
                    #call_tokens
                    /* Like this:
                        t,
                        name.bytestr.as_ptr() as *const ::cty::c_char,  //  Converted to pointer
                        func,
                        arg,
                        prio,
                        sanity_itvl,
                        stack_bottom.as_ptr() as *mut os_stack_t,  //  Converted to pointer
                        stack_size as u16  */
                );
                #return_result_tokens
            }
        }
    };
    expanded
}

/// Collect the Wrapped Declarations for all args. Return a TokenStream of the declarations for the wrapper function:
/// `t: Out<os_task>, name: &Strn, func: os_task_func_t, ...`
/// Preserve the span info for error display.
fn collect_wrap(args: &Vec<TransformedArg>) -> proc_macro2::TokenStream {
    //  Construct a new `TokenStream` to accumulate the expanded code.
    //  We use `TokenStream` instead of string because `TokenStream` remembers the source location (span) in case of errors.
    //  `quote!` returns `proc_macro2::TokenStream` instead of `proc_macro::TokenStream`, so we use `proc_macro2::TokenStream`.
    let mut expanded = proc_macro2::TokenStream::new();
    for arg in args {
        //  Construct the wrap identifier and type tokens, preserving the span: `t: Out<os_task>`
        let TransformedArg{ ident, wrap_type, ident_span, type_span, .. } = arg;
        let tokens = expand_decl(ident, wrap_type, ident_span, type_span, Separator::Colon);
        if !expanded.is_empty() { expanded.extend(quote!{ , }) }  //  Add a comma if not first arg.
        expanded.extend(tokens);
    }
    //  Return the expanded tokens.
    //  println!("expanded: {:#?}", expanded);
    expanded
}

/// Collect the Call Expressions for all args. Return a TokenStream of the call expressions for the wrapper function:
/// `t, name.bytestr.as_ptr() as *const ::cty::c_char, ...`
/// Preserve the span info for error display.
fn collect_call(args: &Vec<TransformedArg>) -> proc_macro2::TokenStream {
    //  Construct a new `TokenStream` to accumulate the expanded code.
    //  We use `TokenStream` instead of string because `TokenStream` remembers the source location (span) in case of errors.
    //  `quote!` returns `proc_macro2::TokenStream` instead of `proc_macro::TokenStream`, so we use `proc_macro2::TokenStream`.
    let mut expanded = proc_macro2::TokenStream::new();
    for arg in args {
        //  Construct the call expr and type tokens, preserving the span: `t as *mut os_task`
        let TransformedArg{ call_expr, extern_type, ident_span, type_span, .. } = arg;
        let tokens = expand_decl(call_expr, extern_type, ident_span, type_span, Separator::As);
        if !expanded.is_empty() { expanded.extend(quote!{ , }) }  //  Add a comma if not first arg.
        expanded.extend(tokens);
    }
    //  Return the expanded tokens.
    //  println!("expanded: {:#?}", expanded);
    expanded
}

/// Collect the Validate Statements for all args. Return a TokenStream of the validation statements for the wrapper function:
/// `Strn::validate_bytestr(name.bytestr); ...`
/// Preserve the span info for error display.
fn collect_validation(args: &Vec<TransformedArg>) -> proc_macro2::TokenStream {
    //  Construct a new `TokenStream` to accumulate the expanded code.
    //  We use `TokenStream` instead of string because `TokenStream` remembers the source location (span) in case of errors.
    //  `quote!` returns `proc_macro2::TokenStream` instead of `proc_macro::TokenStream`, so we use `proc_macro2::TokenStream`.
    let mut expanded = proc_macro2::TokenStream::new();
    for arg in args {
        //  Construct the call validation tokens, preserving the span.
        let TransformedArg{ validation_stmt, ident_span, .. } = arg;
        if validation_stmt.as_str() == "" { continue; }
        let stmt_token = syn::parse_str::<Expr>(validation_stmt).unwrap();
        let tokens = quote_spanned!(ident_span=> #stmt_token);
        expanded.extend(quote!{ #tokens ; });  //  Add a semicolon.
    }
    //  Return the expanded tokens.
    //  println!("expanded: {:#?}", expanded);
    expanded
}

/// Given identifier `ident` and type `ty`, return the tokens for the declaration `ident: ty`.
/// Preserve the identifier and type spans specified in `ident_span` and `type_span`.
fn expand_decl(ident: &str, ty: &str, ident_span: &Span, type_span: &Span, separator: Separator) -> proc_macro2::TokenStream {
    //  Parse the ident and type strings as syn::Pat and syn::Type.
    let ident_token = syn::parse_str::<Expr>(ident).unwrap();
    let type_token = syn::parse_str::<Type>(ty).unwrap();
    //  Wrap the parsed tokens with the spans (locations) of the ident and type.
    let ident_token_spanned = quote_spanned!(ident_span=> #ident_token);
    let type_token_spanned  = quote_spanned!(type_span => #type_token);
    //  Return the tokens.
    match separator {
        Separator::Colon => { quote!{ #ident_token_spanned : #type_token_spanned } }
        Separator::As    => { quote!{ #ident_token_spanned as #type_token_spanned } }
    }
}

/// Given a list of extern function arg declarations, return the transformed args.
fn transform_arg_list(args: &Punctuated<FnArg, Comma>) -> Vec<TransformedArg>{
    //println!("args: {:#?}", args);
    let mut res = Vec::new();
    for cap in args {
        //println!("cap: {:#?}", cap);
        if let Captured(arg) = cap {
            //  `arg` contains `pat : ty`
            //println!("arg: {:#?}", arg);
            let arg_transformed = transform_arg(&arg);
            res.push(arg_transformed);
        } else { assert!(false); }
    }
    res
}

/// Transform the extern arg for Wrap declaration, Validation statement and Call expression.
fn transform_arg(arg: &ArgCaptured) -> TransformedArg {
    //  `arg` contains `pat : ty` e.g. `t : * mut os_task`
    //  println!("arg: {:#?}", arg);
    let ArgCaptured{ pat, ty, .. } = arg;
    //  println!("pat: {}, ty: {}", quote!{ #pat }, quote!{ #ty });
    let pat_span = pat.span();  //  syn::Pat
    let ty_span = ty.span();    //  syn::Type
    let ident = quote!{ #pat }.to_string();
    let extern_type = quote!{ #ty }.to_string();
    let mut wrap_type = quote!{ #ty }.to_string();
    let mut validation_stmt = "".to_string();
    let mut call_expr = quote!{ #pat }.to_string();
    //  Match the type and transform accordingly.
    match extern_type.as_str() {
        //  * const :: cty :: c_char => &Strn
        "* const :: cty :: c_char" => {
            wrap_type = "&Strn".to_string();
            //  e.g. Strn::validate_bytestr(name.bytestr)
            validation_stmt = format!("Strn::validate_bytestr({}.bytestr)", ident);
            //  e.g. name.bytestr.as_ptr()
            call_expr = format!("{}.bytestr.as_ptr()", ident);
        }
        //  * mut :: cty :: c_void => Ptr
        "* mut :: cty :: c_void" => {
            wrap_type = "Ptr".to_string();
        }
        //  * mut os_task => Out<os_task>
        "* mut os_task" => {
            //  TODO: Use regex to match any `os_*`: https://rust-lang-nursery.github.io/rust-cookbook/text/regex.html
            wrap_type = "Out<os_task>".to_string();
        }
        //  * mut os_stack_t => Out<[os_stack_t]>
        "* mut os_stack_t" => {
            wrap_type = "Out<[os_stack_t]>".to_string();
            //  e.g. stack_bottom.as_ptr()
            call_expr = format!("{}.as_ptr()", ident);
        }
        _ => {}
    }
    //  Return the transformed arg.
    TransformedArg {
        ident:           Box::new(ident),
        extern_type:     Box::new(extern_type),
        wrap_type:       Box::new(wrap_type),
        validation_stmt: Box::new(validation_stmt),
        call_expr:       Box::new(call_expr),
        ident_span:      Box::new(pat_span),
        type_span:       Box::new(ty_span),
    }
}

/// Transform the extern return type e.g. `:: cty :: c_int`
fn transform_return_type(output: &ReturnType) -> TransformedReturnType {
    let extern_type = quote! { output }.to_string();
    let wrap_type =
        if let ReturnType::Type (_, return_type) = output {
            //  e.g. `:: cty :: c_int` for Mynewt error code, or `* mut os_eventq`
            (quote! { #return_type }).to_string()
        }
        else { "".to_string() };  //  No return type
    //  println!("wrap_type: {:#?}", wrap_type);

    //  Declare the result type.
    let declare_result_tokens =
        if wrap_type == ":: cty :: c_int" {  //  Mynewt error code
            quote! { MynewtResult<()> }                        
        }
        else if wrap_type != "" {
            let return_type_tokens = syn::parse_str::<Type>(&wrap_type).unwrap();
            quote! { MynewtResult< #return_type_tokens > }  //  Specified return type e.g. `* mut os_eventq`
        }
        else { 
            quote! { MynewtResult<()> }  //  No return type
        };
    //  Assign the result.
    let get_result_tokens =
        if wrap_type != "" { quote! { let result_value = } }
        else { quote! {} };  //  No return type, so no result.
    //  Return the result or error.
    let return_result_tokens = 
    if wrap_type == ":: cty :: c_int" {  //  Mynewt error code
        quote! {                         
            if result_value == 0 { Ok(()) }
            else { Err(MynewtError::from(result_value)) }
        }
    }
    else if wrap_type != "" {
        quote! { Ok( result_value ) }  //  Return Ok with return value.
    }
    else { 
        quote! { Ok(()) }  //  If no return type, return nothing.
    };
    let type_span = output.span();
    //  Return the transformed return type.
    TransformedReturnType {
        extern_type:                Box::new(extern_type),
        wrap_type:                  Box::new(wrap_type),
        declare_result_tokens:      Box::new(quote_spanned!(type_span=> #declare_result_tokens)),
        get_result_tokens:          Box::new(quote_spanned!(type_span=> #get_result_tokens)),
        return_result_tokens:       Box::new(quote_spanned!(type_span=> #return_result_tokens)),
        type_span:                  Box::new(type_span),
    }
}

/// Transform the extern function name e.g. `os_task_init`
fn transform_function_name(ident: &Ident) -> TransformedFunctionName {
    // Get namespace e.g. `os`
    let fname = ident.to_string();
    let namespace = get_namespace(&fname);
    // println!("namespace: {:#?}", namespace);
    // Get namespace prefix e.g. `os_`
    let namespace_prefix = 
        if namespace.len() > 0 { 
            format!("{}_", namespace).to_string()  //  e.g. `os_`
        } else {
            "".to_string()
        };
    // Transform the function name based on namespace.
    assert!(fname.starts_with(&namespace_prefix));
    let fname_without_namespace = &fname[namespace_prefix.len()..];
    let fname_token = Ident::new(&fname, ident.span());
    let fname_without_namespace_token = Ident::new(&fname_without_namespace, ident.span());
    //  Return the transformed function name.
    TransformedFunctionName {
        ident:                      Box::new(fname.clone()),
        namespace:                  Box::new(namespace.to_string()),
        without_namespace:          Box::new(fname_without_namespace.to_string()),
        token:                      Box::new(fname_token),
        without_namespace_token:    Box::new(fname_without_namespace_token),
        ident_span:                 Box::new(ident.span()),
    }
}

/// Given a function name like `os_task_init`, return the namespace (`os`)
fn get_namespace(fname: &str) -> &str {
    //  Get the first part before `_`.
    let fname_split: Vec<&str> = fname.splitn(2, "_").collect();
    let namespace = fname_split[0];
    //  Match the namespace and ignore if it's not a known namespace.
    match namespace {
        "start" => { "" }   //  `start` is not a valid namespace e.g. `start_server_transport()
        "init"  => { "" }   //  `init` is not a valid namespace e.g. `init_server_post()
        "do"    => { "" }   //  `do` is not a valid namespace e.g. `do_server_post()
        _ => { namespace }  //  Else it's a valid namspace
    }
}

/// Extern arg declaration transformed into the Wrap, Validation and Call forms 
struct TransformedArg {
    /// Identifier e.g. `name`
    ident: Box<String>,
    /// Original extern type e.g. `*const ::cty::c_char`
    extern_type: Box<String>,
    /// Wrapped type to be exposed e.g. `&Strn`
    wrap_type: Box<String>,
    /// Validation statement e.g. `Strn::validate_bytestr(name.bytestr)`
    validation_stmt: Box<String>,
    /// Call expression e.g. `name.bytestr.as_ptr() as *const ::cty::c_char`
    call_expr: Box<String>,
    /// Span of the identifier (file location)
    ident_span: Box<Span>,
    /// Span of the type (file location)
    type_span: Box<Span>,
}

/// Extern return type declaration transformed
struct TransformedReturnType {
    /// Original extern type e.g. `:: cty :: c_int` or `* mut os_eventq`
    extern_type: Box<String>,
    /// Wrapped type to be exposed e.g. `:: cty :: c_int` or `* mut os_eventq`
    wrap_type: Box<String>,
    /// Declare the result type e.g. `MynewtResult< * mut os_eventq >`
    declare_result_tokens: Box<proc_macro2::TokenStream>,
    /// Assign the result e.g. `let result_value = `
    get_result_tokens: Box<proc_macro2::TokenStream>,
    /// Return the result or error e.g. `Ok( result_value )`
    return_result_tokens: Box<proc_macro2::TokenStream>,
    /// Span of the type (file location)
    type_span: Box<Span>,
}

/// Extern function name transformed
struct TransformedFunctionName {
    /// Identifier e.g. `os_task_init`
    ident: Box<String>,
    /// Namespace e.g. `os`. Or empty if no namespace.
    namespace: Box<String>,
    /// Function name without namespace e.g. `task_init`
    without_namespace: Box<String>,
    /// Token of function name e.g. `os_task_init`
    token: Box<Ident>,
    /// Token of function name without namespace e.g. `task_init`
    without_namespace_token: Box<Ident>,
    /// Span of the identifier (file location)
    ident_span: Box<Span>,
}

/// Separator for composing declarations and call expressions
enum Separator {
    /// `ident: ty`
    Colon,
    /// `ident as ty`
    As,
}
