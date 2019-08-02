//! Mynewt Macros for calling Mynewt APIs . Import this crate into a source code crate and check the expanded macros using:
//! ```
//! clear ; cargo rustc -- -Z unstable-options --pretty expanded | head -20
//! ```
#![recursion_limit="128"] //  Increase recursion limit to prevent quote!{} errors

mod safe_wrap;  //  Include safe_wrap.rs

extern crate proc_macro;
use proc_macro::TokenStream;
use quote::{quote};
use syn::{
    parse_macro_input,
};

/// Given an `extern "C"` block of function declarations, generate the safe wrapper for the function.
#[proc_macro_attribute]
pub fn safe_wrap(attr: TokenStream, item: TokenStream) -> TokenStream {
    safe_wrap::safe_wrap_internal(attr, item)
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

/// ```
/// strn!( "network" );
/// strn!( sensor_network::get_device_id() ? );
/// ```
#[proc_macro]
pub fn strn2(item: TokenStream) -> TokenStream {
    //  Parse the macro input as a literal string e.g. `"network"`.
    let expr = parse_macro_input!(item as syn::Expr);
    println!("strn: {:#?}", expr);
    //  `expr` is either `Lit` or `Try`.  TODO: Allow `&str`
    match expr {
        syn::Expr::Lit(expr) => {
            //  Get the literal string value.
            let lit = expr.lit;
            println!("lit: {:#?}", quote! { #lit }.to_string());
            let expanded = quote! {
                &Strn::new( b"zzz\0" )
            };
            return expanded.into();
        }
        syn::Expr::Try(expr) => {
            let expanded = quote! {
                &Strn::new(
                    #expr
                )
            };
            return expanded.into();
        }
        _ => {}
    };
    //  Compose the macro expansion as a string. `r#"..."#` represents a raw string (for convenience) 
    let expanded = format!(r#"&Strn::new( b"{}\0" )"#, "abc");
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
    let expanded = format!(r#"Strn{{ bytestr: b"{}\0", cstr: 0 as *const ::cty::c_char }}"#, val);
    //  Parse the string into Rust tokens and return the expanded tokens back to the compiler.
    expanded.parse().unwrap()
}

/// Transform a block of CBOR encoding calls by adding error checking. All lines must terminate with `;`
/// ```
/// try_cbor!({
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
pub fn try_cbor(item: TokenStream) -> TokenStream {
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
                        if func.to_string().starts_with("cbor_encode_") ||
                            func.to_string().starts_with("cbor_encoder_") {
                            //  Add error checking to the CBOR statement.
                            let updated_stmt = quote! { 
                                let res = mynewt::encoding::tinycbor::#stmt_tokens;
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
