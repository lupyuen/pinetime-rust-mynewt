extern crate proc_macro;
use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input};

#[proc_macro]
pub fn run(item: TokenStream) -> TokenStream {
    let input = syn::parse_macro_input!(item as syn::Block);
    for stmt in input.stmts {
        //  println!("stmt: {:#?}", quote! { #stmt });
        //  println!("id: {:#?}", stmt.ident);
        match stmt {
            syn::Stmt::Local(local) => {
            }
            syn::Stmt::Item(item) => {
            }
            syn::Stmt::Expr(expr) => {
            }
            syn::Stmt::Semi(expr, _semi) => {
                //  println!("expr: {:#?}", quote! { #expr });
                match expr {
                    syn::Expr::Call(expr2) => {
                        println!("expr2: {:#?}", quote! { #expr2 });
                        //&expr2.func?.ident;
                    }
                    _ => {
                        assert!(false);
                    }
                }
            
            }
        }
    }
    "fn answer() -> u32 { 42 }".parse().unwrap()    
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn test1() {
        assert_eq!(1, 1);
    }
}
