// Define el protocolo Observer
protocol Observer {
    func update(_ message: String)
}

// Define la clase Observable
class Observable {
    private var observers: [Observer] = []
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        if let index = observers.firstIndex(where: { $0 as AnyObject === observer as AnyObject }) {
            observers.remove(at: index)
        }
    }
    
    func notifyObservers(_ message: String) {
        for observer in observers {
            observer.update(message)
        }
    }
}

// Implementación de Observadores
class ConcreteObserver: Observer {
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func update(_ message: String) {
        print("\(name) recibió el mensaje: \(message)")
    }
}

// Uso del patrón
let observable = Observable()

let observer1 = ConcreteObserver(name: "Observer 1")
let observer2 = ConcreteObserver(name: "Observer 2")

observable.addObserver(observer1)
observable.addObserver(observer2)

observable.notifyObservers("¡Hola!")

observable.removeObserver(observer1)

observable.notifyObservers("¡Adiós!")
