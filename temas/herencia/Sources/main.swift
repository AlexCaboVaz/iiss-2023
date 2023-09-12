import Foundation

// Clase base Vehicle para representar un vehículo genérico.
class Vehicle {
    // Propiedades comunes a todos los vehículos.
    var brand: String
    var model: String
    var year: Int
    var dateAdded: Date
    
    // DateFormatter estático para formatear las fechas.
    // Se utiliza un solo objeto para evitar la sobrecarga de crear múltiples instancias.
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    // Inicializador para configurar propiedades básicas.
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
        self.dateAdded = Date()
    }
    
    // Método para simular el arranque del motor.
    func startEngine() -> String {
        return "El motor del vehículo ha arrancado."
    }
    
    // Propiedad computada para generar una descripción del vehículo.
    var description: String {
        let formattedDate = Vehicle.dateFormatter.string(from: dateAdded)
        return "Este es un \(brand) \(model) del año \(year). Añadido el \(formattedDate)."
    }
}

// Clase Car heredada de Vehicle para representar coches específicos.
class Car: Vehicle {
    // Propiedad específica para coches: si tiene o no techo solar.
    var hasSunroof: Bool
    
    // Inicializador que acepta todas las propiedades, incluida hasSunroof.
    init(brand: String, model: String, year: Int, hasSunroof: Bool) {
        self.hasSunroof = hasSunroof
        super.init(brand: brand, model: model, year: year)
    }
    
    // Sobrescribir el método startEngine para coches.
    override func startEngine() -> String {
        return "El motor del coche ha arrancado con elegancia."
    }
    
    // Método específico para manejar el techo solar.
    func openSunroof() -> String {
        return hasSunroof ? "Abriendo el techo solar." : "Este coche no tiene techo solar."
    }
}

// Clase Truck heredada de Vehicle para representar camiones.
class Truck: Vehicle {
    // Propiedad específica para camiones: capacidad de carga.
    var payloadCapacity: Int
    
    // Inicializador que acepta todas las propiedades, incluida payloadCapacity.
    init(brand: String, model: String, year: Int, payloadCapacity: Int) {
        self.payloadCapacity = payloadCapacity
        super.init(brand: brand, model: model, year: year)
    }
    
    // Método específico para manejar la carga de mercancías.
    func loadPayload() -> String {
        return "Cargando \(payloadCapacity) kilogramos en el camión."
    }
}

// Crear instancias de Vehicle, Car y Truck para pruebas.
let myVehicle = Vehicle(brand: "Generic", model: "Basic", year: 2020)
let myCar = Car(brand: "Toyota", model: "Prius", year: 2022, hasSunroof: true)
let myTruck = Truck(brand: "Ford", model: "F-150", year: 2023, payloadCapacity: 1300)

// Imprimir descripciones y probar métodos de cada instancia.
print(myVehicle.description)
print(myVehicle.startEngine())

print(myCar.description)
print(myCar.startEngine())
print(myCar.openSunroof())

print(myTruck.description)
print(myTruck.startEngine())
print(myTruck.loadPayload())
