extern crate proc_macro;

use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input, ItemStruct};

#[proc_macro_attribute]
pub fn vehicle_info(_attrs: TokenStream, item: TokenStream) -> TokenStream {
    let input = parse_macro_input!(item as ItemStruct);
    let name = &input.ident;

    let expanded = quote! {
        #input

        impl #name {
            pub fn info(&self) -> String {
                format!("Este es un vehículo del tipo: {}", stringify!(#name))
            }
        }
    };

    TokenStream::from(expanded)
}
