mod cars;
mod dealership;

use cars::Car;
use dealership::Dealership;

fn main() {
    let mut dealership = Dealership::new();

    // Agregamos un coche al concesionario
    let car1 = Car {
        registration: "ABC123".to_string(),
        brand: "Toyota".to_string(),
        model: "Corolla".to_string(),
        year: 2020,
    };
    dealership.add_car(car1);

    // Uso de as_ref()
    let binding = dealership.find_car("ABC123");
    let car_ref = binding.as_ref();
    println!("Uso de as_ref: {:?}", car_ref);

    // Uso de expect()
    let binding = dealership.find_car("ABC123");
    let car_expect = binding.as_ref().expect("No se encontró el coche con esa matrícula.");
    println!("Uso de expect: {:?}", car_expect);

    // Uso de or()
    let car_or = dealership.find_car("DEF456").or_else(|| dealership.find_car("ABC123"));
    println!("Uso de or: {:?}", car_or);

    // Uso de or_else()
    let car_or_else = dealership.find_car("DEF456").or_else(|| {
        Some(Car {
            registration: "DEFAULT".to_string(),
            brand: "Unknown".to_string(),
            model: "Unknown".to_string(),
            year: 0000,
        })
    });
    println!("Uso de or_else: {:?}", car_or_else);

    // Agregamos otro coche al concesionario
    let car2 = Car {
        registration: "XYZ789".to_string(),
        brand: "Ford".to_string(),
        model: "Mustang".to_string(),
        year: 2021,
    };
    dealership.add_car(car2);

    // Uso de and()
    let car_and = dealership.find_car("ABC123").and_then(|_| dealership.find_car("XYZ789"));
    println!("Uso de and: {:?}", car_and);

    // Uso de and_then()
    let car_and_then = dealership.find_car("ABC123").and_then(|_| dealership.find_car("XYZ789"));
    println!("Uso de and_then: {:?}", car_and_then);
}
