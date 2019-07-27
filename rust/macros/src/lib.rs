//! Mynewt Macros for calling Mynewt APIs . Import this crate into a source code crate and check the expanded macros using:
//! ```
//! clear ; cargo rustc -- -Z unstable-options --pretty expanded | head -20
//! ```
#![recursion_limit="128"] //  Increase recursion limit to prevent quote!{} errors
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
    Type,
    punctuated::Punctuated,
    spanned::Spanned,
    token::Comma,
};

/// Given an `extern "C"` block of function declarations, generate the safe wrapper for the function.
#[proc_macro_attribute]
pub fn safe_wrap(_attr: TokenStream, item: TokenStream) -> TokenStream {
    let namespace = "os";  //  TODO
    let namespace_prefix = format!("{}_", namespace).to_string();  //  e.g. `os_`
    //  println!("attr: {:#?}", attr); println!("item: {:#?}", item);
    //  Parse the macro input as an extern "C" function declaration.
    let input = parse_macro_input!(item as syn::ItemForeignMod);
    //println!("input: {:#?}", input);
    //  For each function...
    for foreign_item in input.items {
        //  TODO: Accumulate doc in attrs and rename args.
        //  println!("foreign_item: {:#?}", foreign_item);
        let foreign_item_tokens = quote! { #foreign_item };
        if let syn::ForeignItem::Fn(foreign_fn) = foreign_item {
            //  println!("foreign_fn: {:#?}", foreign_fn);
            //  Get the function name, with and without namespace (`os_task_init` vs `task_init`)
            let fn_name = foreign_fn.ident.to_string();
            assert!(fn_name.starts_with(&namespace_prefix));
            let fn_name_without_namespace = &fn_name[namespace_prefix.len()..];
            let fn_name_token = syn::Ident::new(&fn_name, foreign_fn.ident.span());
            let fn_name_without_namespace_token = syn::Ident::new(&fn_name_without_namespace, foreign_fn.ident.span());

            //  Get the function args and transform each arg into 3 forms:
            //  (1) Wrap Declaration: How the arg type is exposed via the wrapper
            //  (2) Validation Stmt: To validate each arg if needed, e.g. check strings are null-terminated
            //  (3) Call Expr: Inside the wrapper, call the Mynewt API with type casting
            let args = foreign_fn.decl.inputs;
            let transformed_args = transform_arg_list(args);

            //  For all args, collect the tokens for the Wrap, Validation and Call forms.
            let wrap_tokens = collect_wrap(&transformed_args);
            let validation_tokens = collect_validation(&transformed_args);
            let call_tokens = collect_call(&transformed_args);

            //  Compose the wrapper code as tokens.
            let expanded = quote! {
                //  "----------Insert Func Name: `pub fn task_init() -> {`----------";
                pub fn #fn_name_without_namespace_token(
                    //  "----------Insert Wrapped Decl----------";
                    #wrap_tokens
                    /* Like this:
                        t: Out<os_task>,  //  TODO: *mut os_task
                        name: &Strn,      //  TODO: *const ::cty::c_char
                        func: os_task_func_t,
                        arg: Ptr,         //  TODO: *mut ::cty::c_void
                        prio: u8,
                        sanity_itvl: os_time_t,
                        stack_bottom: Out<[os_stack_t]>,  //  TODO: *mut os_stack_t
                        stack_size: usize,                //  TODO: u16 */
                ) -> MynewtResult<()> {               //  TODO: Was ::cty::c_int;
                    "----------Insert Extern Decl: `extern C { pub fn ... }`----------";
                    extern "C" { #foreign_item_tokens }
                    "----------Insert Validation: `Strn::validate_bytestr(name.bytestr)`----------";
                    #validation_tokens
                    unsafe {
                    "----------Insert Call: `let result_code = os_task_init(`----------";
                        let result_code = #fn_name_token(
                            //  "----------Insert Call Expr----------";
                            #call_tokens
                            /* Like this:
                                t,
                                name.bytestr.as_ptr() as *const ::cty::c_char,  //  TODO
                                func,
                                arg,
                                prio,
                                sanity_itvl,
                                stack_bottom.as_ptr() as *mut os_stack_t,  //  TODO
                                stack_size as u16  */
                        );
                        if result_code == 0 { Ok(()) }
                        else { Err(MynewtError::from(result_code)) }
                    }
                }
            };
            //  Return the expanded tokens back to the compiler.
            //  println!("expanded: {:#?}", expanded);
            return TokenStream::from(expanded)
        } else { assert!(false) }
        break;
    }
    "// Should not come here".parse().unwrap()
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
fn transform_arg_list(args: Punctuated<FnArg, Comma>) -> Vec<TransformedArg>{
    //println!("args: {:#?}", args);
    let mut res = Vec::new();
    for cap in args {
        //println!("cap: {:#?}", cap);
        if let Captured(arg) = cap {
            //  `arg` contains `pat : ty`
            //println!("arg: {:#?}", arg);
            let arg_transformed = transform_arg(arg);
            res.push(arg_transformed);
        } else { assert!(false); }
    }
    res
}

/// Transform the extern arg for Wrap declaration, Validation statement and Call expression.
fn transform_arg(arg: ArgCaptured) -> TransformedArg {
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

/// Separator for composing declarations and call expressions
enum Separator {
    /// `ident: ty`
    Colon,
    /// `ident as ty`
    As,
}

/// Given a static mutable variable, return an unsafe mutable pointer that's suitable for passing to Mynewt APIs for writing output.
/// `out!(NETWORK_TASK)` expands to `unsafe { &mut NETWORK_TASK }`
#[proc_macro]
pub fn out(item: TokenStream) -> TokenStream {
    //  Parse the macro input as an identifier e.g. `NETWORK_TASK`.
    let input = parse_macro_input!(item as syn::Ident);
    //  Convert the identifier to string.
    let ident = input.to_string();
    //  Compose the macro expansion as a string. `r#"..."#` represents a raw string (for convenience) 
    let expanded = format!(r#"unsafe {{ &mut {} }}"#, ident);  //  `{{` and `}}` will be rendered as `{` and `}`
    //  Parse the string into Rust tokens and return the expanded tokens back to the compiler.
    expanded.parse().unwrap()
}

/// Transform input string into a null-terminated bytestring that's suitable for passing to Mynewt APIs
/// `strn!("network")` expands to `&Strn::new( b"network\0" )`
#[proc_macro]
pub fn strn(item: TokenStream) -> TokenStream {
    //  Parse the macro input as a literal string e.g. `"network"`.
    let input = parse_macro_input!(item as syn::LitStr);
    //  Get the literal string value.
    let val = input.value();
    //  Compose the macro expansion as a string. `r#"..."#` represents a raw string (for convenience) 
    let expanded = format!(r#"&Strn::new( b"{}\0" )"#, val);
    //  Parse the string into Rust tokens and return the expanded tokens back to the compiler.
    expanded.parse().unwrap()
}

/// Initialise a null-terminated bytestring `Strn` that's suitable for passing to Mynewt APIs
/// `init_strn!("network")` expands to `Strn{ bytestr: b"network\0" }`
/// Used like this:
/// ```
/// static STATIC_STRN: Strn = init_strn!("network");
/// let local_strn = init_strn!("network");
/// ```
#[proc_macro]
pub fn init_strn(item: TokenStream) -> TokenStream {
    //  Parse the macro input as a literal string e.g. `"network"`.
    let input = parse_macro_input!(item as syn::LitStr);
    //  Get the literal string value.
    let val = input.value();
    //  Compose the macro expansion as a string. `r#"..."#` represents a raw string (for convenience) 
    let expanded = format!(r#"Strn{{ bytestr: b"{}\0" }}"#, val);
    //  Parse the string into Rust tokens and return the expanded tokens back to the compiler.
    expanded.parse().unwrap()
}

/// Transform a block of CBOR encoding calls by adding error checking.
/// ```
/// run({
///     let encoder = COAP_CONTEXT.encoder("COAP_CONTEXT", "_map");
///     cbor_encode_text_string(
///         encoder,
///         COAP_CONTEXT.key_to_cstr(key_with_opt_null),
///         COAP_CONTEXT.cstr_len(key_with_opt_null));
///     cbor_encode_int(encoder, value);
/// })
/// ```
/// expands to:
/// ```
/// unsafe {
///     let encoder = COAP_CONTEXT.encoder("COAP_CONTEXT", "_map");
///     let res =
///         tinycbor::cbor_encode_text_string(encoder,
///           COAP_CONTEXT.key_to_cstr(key_with_opt_null),
///           COAP_CONTEXT.cstr_len(key_with_opt_null));
///     COAP_CONTEXT.check_result(res);
///     let res = tinycbor::cbor_encode_int(encoder, value);
///     COAP_CONTEXT.check_result(res);
/// }
/// ```
#[proc_macro]
pub fn run(item: TokenStream) -> TokenStream {
    //  Parse the macro input as a block of statements.
    let input = parse_macro_input!(item as syn::Block);
    //  Construct a new `TokenStream` to accumulate the expanded code.
    //  We use `TokenStream` instead of string because `TokenStream` remembers the source location (span) in case of errors.
    //  `quote!` returns `proc_macro2::TokenStream` instead of `proc_macro::TokenStream`, so we use `proc_macro2::TokenStream`.
    let mut expanded = proc_macro2::TokenStream::new();
    for stmt in input.stmts {  //  For every statement in the block...
        //  Copy the statement into tokens to prevent borrowing problems later.
        let stmt_tokens = quote! { #stmt };
        match stmt {
            //  If this is a statement followed by a semicolon...
            syn::Stmt::Semi(expr, _semi) => {
                match expr {
                    //  If statement is a function call like `func(...)`...
                    syn::Expr::Call(expr) => {                        
                        let func = *expr.func;        //  Get the function called.
                        let func = quote! { #func };  //  Summarise as token form.
                        //  If this is a CBOR encoding call..
                        if func.to_string().starts_with("cbor_encode_") {
                            //  Add error checking to the CBOR statement.
                            let updated_stmt = quote! { 
                                let res = tinycbor::#stmt_tokens;
                                COAP_CONTEXT.check_result(res);
                            };
                            //  Append updated statement tokens to result.
                            expanded.extend(updated_stmt);  
                            continue;  //  Skip to next statement.
                        }
                    }
                    //  If statement is not a function call...
                    _ => {}  //  TODO
                }            
            }
            //  If this is a statement not followed by a semicolon...
            syn::Stmt::Expr(_expr) => {}  //  TOOD
            //  If this is a `let` statement like `let a = ...`...
            syn::Stmt::Local(_local) => {}  //  TODO
            //  If this is an item definition like `const a = ...`...
            syn::Stmt::Item(_item) => {}  //  TODO
        }
        //  If we reach here, this statement is not a CBOR encoding call.  Return verbatim.
        expanded.extend(stmt_tokens);  //  Append statement tokens to result.
    }
    //  Wrap the expanded tokens with an `unsafe` block.
    expanded = quote! {
        unsafe {
            #expanded
        }
    };
    //  Return the expanded tokens back to the compiler.
    TokenStream::from(expanded)
}
