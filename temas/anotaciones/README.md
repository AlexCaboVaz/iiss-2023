# 🚗 Gestión de Vehículos en Rust 🚗

---

## 📌 Índice 📌

1. [📚 Descripción General](#descripción-general)
2. [🔍 Cómo Funciona](#cómo-funciona)
    - [📦 Importación de Crates](#importación-de-crates)
    - [🚀 Estructuras y Propiedades](#estructuras-y-propiedades)
    - [🔧 Macros de Procedimiento](#macros-de-procedimiento)
3. [🤔 Anotaciones en Rust](#anotaciones-en-rust)
4. [♻️ Técnicas de Refactorización](#técnicas-de-refactorización)
5. [🏁 Cómo Ejecutar el Código](#cómo-ejecutar-el-código)
6. [🛠 Requisitos](#requisitos)

---

## 📚 Descripción General 📚

Este proyecto en Rust demuestra la utilización de **macros de procedimiento** para generar código de manera dinámica y también ejemplifica el uso de **anotaciones** en la programación.

---

## 🔍 Cómo Funciona 🔍

### 📦 Importación de Crates 📦

\`\`\`rust
extern crate vehicle_info_macro;
\`\`\`

Importamos el crate que contiene la macro de procedimiento `vehicle_info`.

### 🚀 Estructuras y Propiedades 🚀

#### 🚗 Estructura Base: Car 🚗

\`\`\`rust
#[vehicle_info]
struct Car {
    brand: String,
    model: String,
    year: u32,
}
\`\`\`

Esta estructura define las propiedades básicas que tendrán todos los vehículos:

- brand: La marca del vehículo (String).
- model: El modelo del vehículo (String).
- year: El año de fabricación (u32).

### 🔧 Macros de Procedimiento 🔧

La macro `vehicle_info` añade un método `info` al `struct` anotado, que devuelve una cadena con detalles del vehículo.

\`\`\`rust
impl Car {
    pub fn info(&self) -> String {
        format!(
            "Este es un vehículo del tipo: Car\nMarca: {}\nModelo: {}\nAño: {}",
            self.brand,
            self.model,
            self.year
        )
    }
}
\`\`\`

## 🤔 Anotaciones en Rust 🤔

Las macros de procedimiento permiten una forma de metaprogramación en Rust. Con `vehicle_info`, hemos generado dinámicamente un método que opera en cualquier estructura que tenga las propiedades adecuadas, haciendo que el código sea más reutilizable y modular.

## ♻️ Técnicas de Refactorización ♻️

- **Modularización**: Se ha separado la lógica de la macro en su propia función para mejorar la legibilidad y el mantenimiento.
- **Extendibilidad**: La macro podría modificarse fácilmente para manejar más tipos de vehículos o más propiedades.
- **Documentación completa**: Todos los componentes del código están bien documentados para facilitar la comprensión.

## 🏁 Cómo Ejecutar el Código 🏁

Para ejecutar este proyecto:

1. Clone el repositorio
2. Navegue hasta el directorio del proyecto
3. Ejecute `cargo build`
4. Ejecute `cargo run`

## 🛠 Requisitos 🛠

- Rust 1.40.0 o superior.
- Cargo, el gestor de paquetes de Rust.

---

