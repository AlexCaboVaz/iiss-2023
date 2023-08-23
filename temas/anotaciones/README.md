# Anotaciones en RUST

- En el lenguaje de programacion RUST las anotaciones son metadatos que se pueden agregar módulos del código para modificar su comportamiento o para interactuar con herramientas externas. Estas anotaciones como vemos en el código se especifican con el simbolo '#[]'.

- En este ejercicio hemos usado la anotación personalizada para modificar el comportamiento de una estructura de datos, y esa anotación es nuestro macro personalizado.

## Definicion de la Anotación

- En el archivo lib.rs de vehicle_info_macro, definimos una función de macro:

´´´
#[proc_macro]
pub fn vehicle_info(_item: TokenStream) -> TokenStream {
    // ... código del macro ...
}
´´´

- La anotación #[proc_macro] indica que la funcion a continuación, vehicle_info, se debe tratar como un macro procesador.

## Uso de la Anotación

- En main.rs aplicamos la anotacion (o macro) a una estructura

´´´
#[vehicle_info]
struct Car {
    brand: String,
    model: String,
    year: i32,
}
´´´

- Aqui #[vehicle_info] es una anotación que aplica el macro que definimos anteriormente a la estructura Car.

- Cuando el compilador de Rust ve esta anotación, llamara a nuestra funcion macro vehicle_info y le pasara la estructura Car (como un TokenStream). Nuestro macro procesara esta estructura y generara código adicional para ella (en este caso, una funcion).

## Resultado

- Como resultado de aplicar la anotación, la estructura Car, ahora tiene una función adicional llamada vehicle_info, que no se definio explicitamente en el código original pero fue generada por el macro. Esto se evidencia en el código principal:

´´´
fn main() {
    let my_car = Car {
        brand: "Toyota".to_string(),
        model: "Corolla".to_string(),
        year: 2020,
    };
    println!("{}", my_car.vehicle_info());
}
´´´

- Aquí, my_car.vehicle_info() es posible gracias a la anotación que aplicamos a Car.

## Diferencias con Java

- Las anotaciones en Rust como en Java cumplen el propósito general de proporcionar metadatos adicionales sobre el código, pero se utilizan de manera diferente y tienen capacidades distintas. Podemos ver estas difenrencias en el proposito, en el acceso a tiempo de ejecución, la sintaxis...


## Explicación del código

1. Macro vehicle_info_macro
    - El archivo lib.rs en el directorio vehicle_info_macro contiene el código que define cómo funciona el macro vehicle_info.

    ´´´
    extern crate proc_macro;

    use proc_macro::TokenStream;
    use quote::quote;
    use syn::{parse_macro_input, ItemStruct};
    ´´´
    - proc_macro: Es una biblioteca de Rust que proporciona funcionalidades para escribir macros personalizados
    - quote: Es una biblioteca que proporciona una serie de utilidades para generar código Rust.
    - syn: Es otra biblioteca que se utiliza para analizar código Rust en una forma que sea más fácil de manipular y entender.

    ´´´
    #[proc_macro]
    pub fn vehicle_info(_item: TokenStream) -> TokenStream {
    // ... código del macro ...
    }

    ´´´

    - #[proc_macro] indica que estamos definiendo un macro procesador, que toma un TokenStream (representa un fragmento de código) y produce otro TokenStream.
    - La función vehicle_info es el corazón de nuestro macro. Esta función toma un fragmento de código, lo manipula, y produce un nuevo fragmento de código.


    - Dentro de la función vehicle_info, analizamos el TokenStream entrante y generamos un nuevo fragmento de código que define la función vehicle_info para la estructura.


2. Usando el Macro vehicle_info en main.rs:
    ´´´
    use vehicle_info_macro::vehicle_info;
    ´´´´

    - Esto nos permite usar el macro vehicle_info en nuestro archivo principal.

    ´´´
    #[vehicle_info]
    truct Car {
    brand: String,
    model: String,
    year: i32,
    }
    ´´´

    - Aquí definimos una estructura Car. La anotación #[vehicle_info] indica que queremos que el macro vehicle_info procese esta estructura. El macro generará automáticamente una función vehicle_info para esta estructura.

    ´´´
    fn main() {
    let my_car = Car {
        brand: "Toyota".to_string(),
        model: "Corolla".to_string(),
        year: 2020,
    };
    println!("{}", my_car.vehicle_info());
    }
    ´´´

    - Aquí creamos una instancia de Car y luego llamamos a la función vehicle_info (que fue generada por el macro) para imprimir información sobre el coche.

3. Resumen
    - En resumen, lo que hicimos fue definir un macro que, cuando se aplica a una estructura, genera automáticamente una función para esa estructura. Luego usamos ese macro en nuestro programa principal para agregar una función a nuestra estructura Car.