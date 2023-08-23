use vehicle_info_macro::vehicle_info;

#[vehicle_info]
struct Car {
    brand: String,
    model: String,
    year: u32,
}

fn main() {
    let my_car = Car {
        brand: "Toyota".to_string(),
        model: "Corolla".to_string(),
        year: 2020,
    };

    println!("{}", my_car.info());
}
