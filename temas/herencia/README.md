# HERENCIA EN SWIFT

- Este proyecto de Swift demuestra cómo utilizar la herencia y la importación de módulos en un programa sencillo para gestionar vehículos. El programa define una clase base llamada Vehicle, junto con dos clases derivadas: Car y Truck. Además, utilizamos el módulo Foundation para trabajar con fechas, especificamente para registrar la fecha en que cada vehículo fue añadido al inventario.

## Como funciona el código

### Importacion de Módulos 

```
import Foundation

```

- Se importa el módulo "Foundation" para utilizar la clase Date y el DateFormatter

### Clase Base: Vehicle 

```
class Vehicle {
    var brand: String
    var model: String
    var year: Int
    var dateAdded: Date
    
    // Inicializador y métodos...
}

```

- La clase base Vehicle tiene cuatro propiedades: marca, modelo, año y fecha añadida

1. Brand, model y year son propiedades básicas que definen el vehículo
2. dateAdded es un objeto Date que se inicializa con la fecha actual cuando se crea una nueva instancia de Vehicle.

### Clases derivadas: Car y Truck

```
class Car: Vehicle {
    var hasSunroof: Bool
    
    // Inicializador y métodos...
}

class Truck: Vehicle {
    var payloadCapacity: Int
    
    // Inicializador y métodos...
}


```

- Las clases Car y Truck heredan de Vehicle

1. Car tiene una propiedad adicional llamada hasSunroof que indica si el coche tiene techo solar.

2. Truck tiene una propiedad adicional payloadCapacity para especificar la capacidad de carga del camión.

### Métodos

- startEngine(): presente en todas las clases. En las clases derivadas, este método se sobrescribe para proporcionar un comportamiento específico.

- description(): presente en la clase base para dar una descripción básica del vehículo.

- openSunroof(): presente solo en la clase Car.

- loadPayload(): presente solo en la clase Truck.

### Sobreescribiendo Métodos y Polimorfismo

- Se utiliza la palabra clave override para sobrescribir el método startEngine() en las clases derivadas. Esto demuestra el concepto de polimorfismo, donde una clase derivada proporciona su propia implementación de un método definido en su clase base.

### Ejecucion

- Para compilar y ejecutar el proyecto:

1. Abrir una terminal y navegar hasta la carpeta del proyecto.
2. Ejecutar swift build.
3. Ejecutar swift run.
4. Si se hace correctamente, verás la salida correspondiente en la terminal.


## Diferencias con Java

1. Sintaxis: Swift usa : para especificar herencia, mientras que Java utiliza extends.

2. Modificadores de Acceso: Swift tiene cinco niveles (incluido open para permitir la sobrescritura en otros módulos), mientras que Java tiene cuatro.

3. Sobrescritura: En Swift, usar override es obligatorio para sobrescribir métodos, mientras que en Java es opcional pero recomendado (@Override).

4. Inicializadores: Swift utiliza init y requiere que todos los miembros sean inicializados. Java usa constructores con el nombre de la clase y permite miembros no inicializados.

5. Interfaces y Protocolos: Swift tiene "protocolos" que pueden tener implementaciones de método predeterminadas; Java utiliza "interfaces", que recientemente permiten métodos por defecto.

6. Opcionales: Swift utiliza "opcionales" para manejar valores nulos de forma segura, mientras que en Java cualquier objeto puede ser null.

7. Gestión de Memoria: Swift usa conteo automático de referencias (ARC), y Java utiliza un recolector de basura.

8. Uso Principal: Swift es común en el desarrollo de iOS/macOS, mientras que Java se utiliza ampliamente en el desarrollo en el lado del servidor y en Android.

- Estas diferencias destacan cómo cada lenguaje aborda la herencia y la programación orientada a objetos, con Swift inclinándose más hacia la seguridad de tipos y Java ofreciendo un nivel de flexibilidad que ha sido útil para aplicaciones empresariales y de servidor.