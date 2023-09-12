# 🚗 Concesionario de Coches en Rust 🚗

## 📝 Índice 📝

1. [🌟 Descripción General](#Descripción-General)
2. [🛠 Cómo Funciona](#cómo-funciona)
    - [🚘 Estructura `Dealership`](#estructura-dealership)
        - [🔨 Método `new()`](#método-new)
        - [🔨 Método `add_car()`](#método-add_car)
        - [🔨 Método `find_car()`](#método-find_car)
    - [🚗 Estructura `Car`](#estructura-car)
        - [🔑 Campos](#campos)
    - [🎬 Función `main()`](#función-main)
        - [🔒 Inicialización](#inicialización)
        - [💡 Manipulación de Opciones](#manipulación-de-opciones)
3. [🤔 Comparación: Undefined en Rust vs. Java](#comparación-undefined-en-rust-vs-java)
4. [🔄 Refactorización Realizada](#refactorización-realizada)
5. [🏃‍♀️ Cómo Ejecutar el Código](#cómo-ejecutar-el-código)
6. [📋 Requisitos](#requisitos)

---

## 🌟 Descripción General 🌟

Este encantador proyecto simula un **concesionario de coches**. Realizado en Rust, es un excelente ejemplo de cómo gestionar un inventario de objetos de forma segura y eficiente. 

---

## 🛠 Cómo Funciona 🛠

### 🚘 Estructura `Dealership`

Encargada de la gestión completa del concesionario. 

#### 🔨 Método `new()`

Crea un nuevo concesionario vacío. 

```rust
pub fn new() -> Self {
    Dealership { cars: Vec::new() }
}
```

#### 🔨 Método `add_car()`

Añade un nuevo coche al concesionario.

```rust
pub fn add_car(&mut self, car: Car) {
    self.cars.push(car);
}
```

#### 🔨 Método `find_car()`

Busca un coche por su matrícula y devuelve una opción.

```rust
pub fn find_car(&self, registration: &str) -> Option<Car> {
    self.cars.iter().find(|&car| car.registration == registration).cloned()
}
```

### 🚗 Estructura `Car`

#### 🔑 Campos

- `registration`: Matrícula 🆔
- `brand`: Marca 🏎
- `model`: Modelo 🚗
- `year`: Año 📅

### 🎬 Función `main()`

#### 🔒 Inicialización

Aquí es donde la magia comienza. Se crea un concesionario y se añaden coches a la colección.

#### 💡 Manipulación de Opciones

En esta sección, verás ejemplos de cómo manipular el tipo `Option`:

- `as_ref()`
- `expect()`
- `or()`
- `or_else()`
- `and()`
- `and_then()`

---

## 🤔 Comparación: Undefined en Rust vs. Java 🤔

En Rust, usamos `Option` para representar la posibilidad de ausencia de un valor, mientras que en Java, se usa `null`. 

---

## 🔄 Refactorización Realizada 🔄

No se ha necesitado una refactorización adicional, dado que el código es limpio y sigue las mejores prácticas.

---

## 🏃‍♀️ Cómo Ejecutar el Código 🏃‍♀️

1. Abre **Visual Studio Code** 🚀
2. Navega a la carpeta del proyecto 📂
3. Ejecuta `cargo run` en la terminal 💻

---

## 📋 Requisitos 📋

- Rust y Cargo instalados 🦀
- Un editor de código como Visual Studio Code 💻

---
