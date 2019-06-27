extern crate proc_macro;
use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input};

/// Run a block of CBOR encoding calls with error checking.
#[proc_macro]
pub fn run(item: TokenStream) -> TokenStream {
    //  Parse the macro input as a block of statements.
    let input = syn::parse_macro_input!(item as syn::Block);
    let mut res = String::new();
    for stmt in input.stmts {  //  For every statement in the block...
        //  Copy the statement into a string to prevent borrowing problems later.
        let stmt_str = (quote! { #stmt }).to_string();
        match stmt {
            //  If this is a statement followed by a semicolon...
            syn::Stmt::Semi(expr, _semi) => {
                match expr {
                    //  If statement is a function call like `func(...)`
                    syn::Expr::Call(expr) => {                        
                        let func = *expr.func;  //  Get the function called.
                        let func = quote! { #func };  //  Convert to token form.
                        //  If this is a CBOR encoding call..
                        if func.to_string().starts_with("cbor_encode_") {
                            //  Add error checking.
                            res.push_str("let res = ");
                            res.push_str(&stmt_str);
                            res.push_str("\ncontext.check_error(res);\n");
                            continue;  //  Skip to next statement.
                        }
                    }
                    //  If statement is not a function call...
                    _ => {}  //  TODO
                }            
            }
            //  If this is a statement not followed by a semicolon...
            syn::Stmt::Expr(_expr) => {}  //  TOOD
            //  If this is a `let` statement like `let a = ...`
            syn::Stmt::Local(_local) => {}  //  TODO
            //  If this is an item definition like `const a = ...`
            syn::Stmt::Item(_item) => {}  //  TODO
        }
        //  If we reach here, this statement is not a CBOR encoding call.  
        //  Return verbatim.
        res.push_str(&stmt_str);
        res.push_str("\n");
    }
    //  Parse the transformed code and return the result.
    res.parse().unwrap()    
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

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn test1() {
        assert_eq!(1, 1);
    }
}
