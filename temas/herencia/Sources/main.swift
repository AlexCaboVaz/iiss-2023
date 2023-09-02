import Foundation

// Clase base Vehicle
class Vehicle {
    var brand: String
    var model: String
    var year: Int
    var dateAdded: Date
    
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
        self.dateAdded = Date()
    }
    
    func startEngine() {
        print("El motor del vehículo ha arrancado.")
    }
    
    func description() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let formattedDate = dateFormatter.string(from: dateAdded)
        
        return "Este es un \(brand) \(model) del año \(year). Añadido el \(formattedDate)."
    }
}

// Clase Car heredada de Vehicle
class Car: Vehicle {
    var hasSunroof: Bool
    
    init(brand: String, model: String, year: Int, hasSunroof: Bool) {
        self.hasSunroof = hasSunroof
        super.init(brand: brand, model: model, year: year)
    }
    
    override func startEngine() {
        print("El motor del coche ha arrancado con elegancia.")
    }
    
    func openSunroof() {
        if hasSunroof {
            print("Abriendo el techo solar.")
        } else {
            print("Este coche no tiene techo solar.")
        }
    }
}

// Clase Truck heredada de Vehicle
class Truck: Vehicle {
    var payloadCapacity: Int
    
    init(brand: String, model: String, year: Int, payloadCapacity: Int) {
        self.payloadCapacity = payloadCapacity
        super.init(brand: brand, model: model, year: year)
    }
    
    func loadPayload() {
        print("Cargando \(payloadCapacity) kilogramos en el camión.")
    }
}

// Instancias y pruebas
let myVehicle = Vehicle(brand: "Generic", model: "Basic", year: 2020)
let myCar = Car(brand: "Toyota", model: "Prius", year: 2022, hasSunroof: true)
let myTruck = Truck(brand: "Ford", model: "F-150", year: 2023, payloadCapacity: 1300)

print(myVehicle.description())
myVehicle.startEngine()

print(myCar.description())
myCar.startEngine()
myCar.openSunroof()

print(myTruck.description())
myTruck.startEngine()
myTruck.loadPayload()
