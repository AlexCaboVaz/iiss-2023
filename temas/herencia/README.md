# 🚗 Gestión de Vehículos en Swift 🚗

---

## 📌 Índice 📌

1. [📚 Descripción General](#descripción-general)
2. [🔍 Cómo Funciona](#cómo-funciona)
    - [📦 Importación de Módulos](#importación-de-módulos)
    - [🚀 Clases y Propiedades](#clases-y-propiedades)
    - [🔧 Métodos](#métodos)
3. [🤔 Herencia en Swift](#herencia-en-swift)
4. [♻️ Técnicas de Refactorización](#técnicas-de-refactorización)
5. [🏁 Cómo Ejecutar el Código](#cómo-ejecutar-el-código)
6. [🛠 Requisitos](#requisitos)

---

## 📚 Descripción General 📚

Este proyecto en Swift demuestra la utilización de la **herencia** y la **encapsulación** en la programación orientada a objetos.

---

## 🔍 Cómo Funciona 🔍

### 📦 Importación de Módulos 📦

```swift
import Foundation

```

Importamos el módulo Foundation para acceder a utilidades básicas como la clase Date para el manejo de fechas.

## 🚀 Clases y Propiedades 🚀

### 🚗 Clase Base: Vehicle 🚗

```swift

class Vehicle {
    var brand: String
    var model: String
    var year: Int
    var dateAdded: Date
    // ... (código omitido)
}

```

Esta clase define las propiedades básicas que tendrán todos los vehículos:

- brand: La marca del vehículo (String).
- model: El modelo del vehículo (String).
- year: El año de fabricación (Int).
- dateAdded: La fecha en que se añadió al sistema, usando la clase Date de Foundation.


### 🚙 Clase Derivada: Car 🚙

``` Swift

class Car: Vehicle {
    var hasSunroof: Bool
    // ... (código omitido)
}

```

La clase Car hereda de Vehicle y añade una propiedad:

- hasSunroof: Un Booleano que indica si el coche tiene techo solar.

### 🚚 Clase Derivada: Truck 🚚

``` swift

class Truck: Vehicle {
    var payloadCapacity: Int
    // ... (código omitido)
}


```

La clase Truck también hereda de Vehicle y añade:

- payloadCapacity: Un entero que indica la capacidad de carga del camión.

## 🔧 Métodos 🔧

- startEngine(): Este método imprime un mensaje indicando que el motor se ha arrancado. Las clases derivadas sobrescriben este método para mostrar su propio mensaje.
- description: Propiedad computada que devuelve una cadena con la descripción del vehículo.

## 🤔 Herencia en Swift 🤔

Las clases Car y Truck heredan de la clase base Vehicle. Esto les permite acceder a todas las propiedades y métodos de Vehicle, mientras que pueden añadir sus propios métodos y propiedades, como hasSunroof para Car y payloadCapacity para Truck.

## 🤔 Diferencias entre Herencia en Swift y Java 🤔

### 💎 Sintaxis 💎
- **Swift**: `class Car: Vehicle {}`
- **Java**: `public class Car extends Vehicle {}`

### 🔒 Modificadores 🔒
- **Swift**: `public`, `internal`, `private`
- **Java**: `public`, `protected`, `private`

### 💡 Sobrescritura 💡
- **Swift**: `override func`
- **Java**: `@Override public void`

### 🛠 Inicializadores 🛠
- **Swift**: `init() {}`
- **Java**: `Car() {}`



## ♻️ Técnicas de Refactorización ♻️

- Propiedades Computadas: Se ha cambiado el método description() por una propiedad computada para hacer el código más Swift-idiomático.
- Encapsulamiento de Comportamiento: Se encapsulan métodos que son específicos para Car y Truck en sus respectivas clases, haciendo que el código sea más modular y fácil de mantener
- Código comentado al completo

## 🏁 Cómo Ejecutar el Código 🏁

Para ejecutar este proyecto:

1. Clone el repositorio
2. Navegue hasta el directorio del proyecto
3. Ejecute swift build
4. Ejecute swift run

## 🛠 Requisitos 🛠

- Swift 5.0 o superior.
- Xcode si está en macOS o cualquier editor compatible con Swift en otros sistemas operativos.