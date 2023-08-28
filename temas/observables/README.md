# Observables en SWIFT

## Como funciona el Patron observador en Swift

- Tenemos principalmente dos tipos de objetos
    1. Observales: Objetos que otros pueden "observar" para recibir actualizaciones
    2. Observadores: Objetos que "observan" a los Observables y reciben notificaciones de cambios.

### Funcionamiento
- Agregar Observadores: El objeto observable mantiene una lista de todos los Observaodres que están interesados en recibir notificaciones.
- Notificación: Cuando algo relevante sucede en el objeto Observable, notifica a todos los Observadores registrados. Usualmente, esto se hace llamando un método especifico del Observador que en este caso es "update(_ message: String)".
- Eliminar Observadores: También puedes eliminar Observadores si ya no quieres que reciban actualizaciones.


### Resumen

- En resumen, el patrón Observador en Swift permite que un objeto notifique a múltiples objetos sobre cambios en su estado sin tener que conocer los detalles de quiénes son esos objetos. Es especialmente útil para desacoplar clases y hacer que el sistema sea más modular y fácil de extender.


## Código
### Definimos los protocolos y clases

1. Protocol Observer: Define un contrato para cualquier objeto que desee ser informado de los cambios en "Observable". Cualquier observador debe implementar la funcion "update (_ message: String).

```
protocol Observer {
    func update(_ message: String)
}

```

2. Clase Observable: Esta clase mantiene una lista de observadores y proporciona métodos para agregar, eliminar y notificar los observadores.
    - observers: Un arreglo que contiene todos los objetos que implementan el protocolo observer.
    - addObserver(): Agrega un nuevo observador al arreglo
    - removeObserver(): Elimina un observador del arreglo
    - notifyObservers(): Notifica todos los observadores cuando hay un cambio.

```
class Observable {
    private var observers: [Observer] = []
    // ...
}

```

### Implementación de observadores:

1. ConcreteObserver: Esta clase implementa el protocolo "Observer". Especificamente, implementa el método "update(_ message: String)", que simplemente imprime un mensaje en la consola.

```
class ConcreteObserver: Observer {
    private let name: String
    // ...
}
```

### Uso del Patrón Observer

1. Creacion de Observables y Observadores: Crea una instancia de "Observable y dos intancias de "ConcreteObserver"

```
let observable = Observable()
let observer1 = ConcreteObserver(name: "Observer 1")
let observer2 = ConcreteObserver(name: "Observer 2")
```

2. Agrega Observadores: Agrega las instancias de ConcreteObserver al objeto Observable

```
observable.addObserver(observer1)
observable.addObserver(observer2)

```

3. Notificar Observadores: Envia un mensaje ("!Hola!") a todos los observadores

```
observable.addObserver(observer1)
observable.addObserver(observer2)

```

4. Eliminar Observadores: Elimina el Observer1

```
observable.removeObserver(observer1)

```

5. Nueva notificación: Envía un nuevo mensaje ("!Adios!") a los observadores restantes.

```
observable.notifyObservers("¡Adiós!")

```


