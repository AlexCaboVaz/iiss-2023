use crate::cars::Car;

pub struct Dealership {
    cars: Vec<Car>,
}

impl Dealership {
    pub fn new() -> Self {
        Dealership { cars: Vec::new() }
    }

    pub fn add_car(&mut self, car: Car) {
        self.cars.push(car);
    }

    pub fn find_car(&self, registration: &str) -> Option<Car> {
        // Busca y devuelve el coche si se encuentra, de lo contrario devuelve None
        self.cars.iter().find(|&car| car.registration == registration).cloned()
    }
}
