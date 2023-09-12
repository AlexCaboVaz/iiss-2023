// Importamos los módulos cars y dealership
mod cars;
mod dealership;

// Importamos las estructuras Car y Dealership de esos módulos
use cars::Car;
use dealership::Dealership;

// Función principal del programa
fn main() {
    // Creamos un nuevo concesionario vacío
    let mut dealership = Dealership::new();

    // Creamos un nuevo coche y lo añadimos al concesionario
    let car1 = create_car("ABC123", "Toyota", "Corolla", 2020);
    dealership.add_car(car1);

    // Demostramos el uso de la opción Option en Rust
    demonstrate_option_usage(&dealership);

    // Creamos otro coche y lo añadimos al concesionario
    let car2 = create_car("XYZ789", "Ford", "Mustang", 2021);
    dealership.add_car(car2);

    // Volvemos a demostrar el uso de Option con el concesionario actualizado
    demonstrate_option_usage(&dealership);
}

// Función para crear un nuevo objeto Car
fn create_car(registration: &str, brand: &str, model: &str, year: u16) -> Car {
    Car {
        registration: registration.to_string(),
        brand: brand.to_string(),
        model: model.to_string(),
        year,
    }
}

// Función para demostrar cómo se manejan las opciones en Rust
fn demonstrate_option_usage(dealership: &Dealership) {
    // Uso de as_ref() para convertir Option en Option<&T>
    let binding = dealership.find_car("ABC123");
    let car_ref = binding.as_ref();
    println!("Uso de as_ref: {:?}", car_ref);

    // Uso de expect() para desempaquetar Option o generar un pánico si es None
    let binding = dealership.find_car("ABC123");
    let car_expect = binding.as_ref().expect("No se encontró el coche con esa matrícula.");
    println!("Uso de expect: {:?}", car_expect);

    // Uso de or() para retornar el primer Option si es Some, o el segundo si el primero es None
    let car_or = dealership.find_car("DEF456").or_else(|| dealership.find_car("ABC123"));
    println!("Uso de or: {:?}", car_or);

    // Uso de or_else() para ejecutar una función si Option es None
    let car_or_else = dealership.find_car("DEF456").or_else(|| {
        Some(create_car("DEFAULT", "Unknown", "Unknown", 0000))
    });
    println!("Uso de or_else: {:?}", car_or_else);

    // Uso de and() para encadenar dos Option juntos, el segundo solo se evalúa si el primero es Some
    let car_and = dealership.find_car("ABC123").and_then(|_| dealership.find_car("XYZ789"));
    println!("Uso de and: {:?}", car_and);

    // Uso de and_then() similar a and(), pero permite el uso de una función para el encadenamiento
    let car_and_then = dealership.find_car("ABC123").and_then(|_| dealership.find_car("XYZ789"));
    println!("Uso de and_then: {:?}", car_and_then);
}
