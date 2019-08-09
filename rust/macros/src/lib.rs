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
//! Mynewt Macros for calling Mynewt APIs . Import this crate into a source code crate and check the expanded macros using:
//! ```
//! clear ; cargo rustc -- -Z unstable-options --pretty expanded | head -20
//! ```
#![recursion_limit="128"]     //  Increase recursion limit to prevent quote!{} errors
#![feature(proc_macro_span)]  //  Allow use of spans in Procedural Macros

mod safe_wrap;   //  Include safe_wrap.rs
mod infer_type;  //  Include infer_type.rs

extern crate proc_macro;
use proc_macro::TokenStream;
use quote::{quote};
use syn::{
    parse_macro_input,
};

/// Given an `extern "C"` block of function declarations, generate the safe wrapper for the function
#[proc_macro_attribute]
pub fn safe_wrap(attr: TokenStream, item: TokenStream) -> TokenStream {
    safe_wrap::safe_wrap_internal(attr, item)
}

/// Given a Rust function definition, infer the placeholder types in the function
#[proc_macro_attribute]
pub fn infer_type(attr: TokenStream, item: TokenStream) -> TokenStream {
    infer_type::infer_type_internal(attr, item)
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

/// Create a `Strn` containing a null-terminated byte string that's suitable for passing to Mynewt APIs.
/// `strn!("network")` expands to `&Strn::new( b"network\0" )`.
/// `strn!(())` expands to `&Strn::new( b"\0" )`.
/// For macro calls like `strn!( stringify!( value ) )`, return `&Strn::new( b"value\0" )`.
/// For complex macro calls like `strn!( $crate::parse!(@ json device_id) )`, return the parameter as is.
#[proc_macro]
pub fn strn(item: TokenStream) -> TokenStream {
    let item_str = item.to_string();
    let span = proc_macro2::Span::call_site();
    //  println!("item: {:#?}", item_str);
    if item_str.replace(" ", "") == "()" {
        //  Expand  `(  )` (old Rust) and `()` (new Rust) to `&Strn::new( b"\0" )`
        let expanded = quote! {
            &Strn::new( b"\0" )
        };
        return expanded.into();
    } else if item_str.contains("parse!") {
        //  If `item_str` looks like `$crate::parse!(@ json device_id)` (old Rust) or `::mynewt::parse!(@ json &device_id)` (new Rust), return as is.
        return item;
    } else if item_str.starts_with("\"") && item_str.ends_with("\"") {
        //  Transform literal `"\"device\""` to `&Strn::new( b"device\0" )`
        let item_split: Vec<&str> = item_str.splitn(3, "\"").collect();
        let lit = item_split[1].to_string() + "\0";            
        //  println!("lit: {:#?}", lit);
        let bytestr = syn::LitByteStr::new(lit.as_bytes(), span);
        let expanded = quote! {
            &Strn::new( #bytestr )
        };
        return expanded.into();
    }
    let expr = parse_macro_input!(item as syn::Expr);
    let expr_str = quote! { #expr }.to_string();
    match expr {
        syn::Expr::Macro(_expr) => {
            //  Transform macro `stringify ! ( value )` to `&Strn::new( b"value\0" )`
            //  macOS gives `stringify ! ( value )` but some Window machines give `stringify ! (value)`.
            let expr_split: Vec<&str> = expr_str.splitn(2, "stringify ! (").collect();
            let ident = expr_split[1].trim();
            let ident_split: Vec<&str> = ident.splitn(2, ")").collect();
            let ident = ident_split[0].trim().to_string() + "\0";            
            //  println!("ident: {:#?}", ident);
            let bytestr = syn::LitByteStr::new(ident.as_bytes(), span);
            let expanded = quote! {
                &Strn::new( #bytestr )
            };
            return expanded.into();
        }
        syn::Expr::Lit(_expr) => {
            //  Literals already handled above. Should not come here.
            assert!(false, "strn lit");  //  Not supported
            let expanded = quote! { &Strn::new( b"\0" ) };
            return expanded.into();
        }
        syn::Expr::Try(expr) => {
            //  Handle `strn!( fn() ? )`
            let expanded = quote! { &Strn::new( #expr ) };
            return expanded.into();
        }
        _ => {}
    };
    //  println!("strn: {:#?}", expr);
    //  println!("strn3: {:#?}", expr_str);
    assert!(false, "strn!() pattern not supported: {}", item_str);  //  Not supported
    let expanded = quote! { &Strn::new( b"\0" ) };
    expanded.into()
}

/// Initialise a null-terminated bytestring `Strn` that's suitable for passing to Mynewt APIs
/// `init_strn!("network")` expands to `Strn{ rep: ByteStr(b"network\0") }`
/// Used like this:
/// ```
/// static STATIC_STRN: Strn = init_strn!("network");
/// let local_strn = init_strn!("network");
/// ```
#[proc_macro]
pub fn init_strn(item: TokenStream) -> TokenStream {
    //  Parse the macro input as a literal string e.g. `"network"`.
    let input = parse_macro_input!(item as syn::LitStr);
    let span = proc_macro2::Span::call_site();

    //  Get the literal string value and terminate with null. Convert to bytestring.
    let val = input.value().to_string() + "\0";
    let bytestr = syn::LitByteStr::new(val.as_bytes(), span);

    //  Compose the macro expansion as tokens.
    let expanded = quote! {
        Strn {
            rep: mynewt::StrnRep::ByteStr(#bytestr)
        }
    };
    //  Return the expanded tokens back to the Rust compiler.
    return expanded.into();
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
