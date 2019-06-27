extern crate proc_macro;
use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input};

#[proc_macro]
pub fn strn(item: TokenStream) -> TokenStream {
    //  Parse the macro input as a block of statements.
    let input = parse_macro_input!(item as syn::???);
}

#[proc_macro_attribute]
pub fn safe_wrap(attr: TokenStream, item: TokenStream) -> TokenStream {
    //println!("attr: {:#?}", attr);
    //println!("item: {:#?}", item);
    //  Parse the macro input as an extern "C" function declaration.
    let input = parse_macro_input!(item as syn::ItemForeignMod);
    println!("input: {:#?}", input);
    for item in input.items {

    }
    "// Hello world".parse().unwrap()
}

/// Transform a block of CBOR encoding calls by adding error checking. Given input:
/// ```
/// let encoder = JSON_CONTEXT.encoder("JSON_CONTEXT", "_map");
/// cbor_encode_text_string(
///     encoder,
///     JSON_CONTEXT.key_to_cstr(key_with_opt_null),
///     JSON_CONTEXT.cstr_len(key_with_opt_null));
/// cbor_encode_int(encoder, value);
/// ```
/// Return:
/// ```
/// unsafe {
///     let encoder = JSON_CONTEXT.encoder("JSON_CONTEXT", "_map");
///     let res =
///         tinycbor::cbor_encode_text_string(encoder,
///           JSON_CONTEXT.key_to_cstr(key_with_opt_null),
///           JSON_CONTEXT.cstr_len(key_with_opt_null));
///     JSON_CONTEXT.check_result(res);
///     let res = tinycbor::cbor_encode_int(encoder, value);
///     JSON_CONTEXT.check_result(res);
/// };
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
                                JSON_CONTEXT.check_result(res);
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

// Build the output, possibly using quasi-quotation
// let expanded = quote! {
// ...
// };
// Hand the output tokens back to the compiler
//  TokenStream::from(expanded)

//syn::Expr::Call(syn::ExprCall { func: f, attrs: _, paren_token: _, args: _ }) => {
//  println!("expr2: {:#?}", quote! { #expr2 });
//  println!("ident: {:#?}", quote! { #expr2.func });       
//  if f.ident == "aaa" { println!("f: {:#?}", quote! { #f }); } 
