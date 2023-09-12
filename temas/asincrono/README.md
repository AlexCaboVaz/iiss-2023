# 🚗 Gestión de Estacionamiento en Rust 🚗

---

## 📌 Índice 📌

1. [📚 Descripción General](#descripción-general)
2. [🔍 Cómo Funciona](#cómo-funciona)
    - [📦 Importación de Bibliotecas](#importación-de-bibliotecas)
    - [🚀 Enums y Estructuras](#enums-y-estructuras)
    - [🔧 Métodos](#métodos)
3. [🤔 Programación Asíncrona en Rust](#programación-asíncrona-en-rust)
4. [🤔 Diferencias entre Rust y Java](#diferencias-entre-rust-y-java)
5. [♻️ Refactorización Realizada](#refactorización-realizada)
6. [🏁 Cómo Ejecutar el Código](#cómo-ejecutar-el-código)
7. [🛠 Requisitos](#requisitos)

---

## 📚 Descripción General 📚

Este proyecto en Rust demuestra la utilización de la **programación asíncrona** y **semáforos** en la gestión de un estacionamiento de coches.

---

## 🔍 Cómo Funciona 🔍

### 📦 Importación de Bibliotecas 📦

\`\`\`rust
use tokio::sync::{Semaphore, Mutex};
use tokio::time::{sleep, Duration};
use std::sync::Arc;
use rand::{Rng, SeedableRng};
use rand::rngs::StdRng;
\`\`\`

Se importan las bibliotecas necesarias para gestionar la concurrencia (`tokio`), generar números aleatorios (`rand`), y otras utilidades estándar de Rust (`std`).

### 🚀 Enums y Estructuras 🚀

#### 🚗 Enumeración: CarType 🚗

```rust
#[derive(Debug)]
enum CarType {
    Regular,
    Vip,
}
```

Esta enumeración define los dos tipos de coches que pueden entrar al estacionamiento: Regular y Vip.

#### 🚗 Estructura: Car 🚗

```rust
struct Car {
    id: u32,
    car_type: CarType,
}
```

La estructura `Car` tiene dos campos:

- `id`: El identificador único del coche (u32).
- `car_type`: El tipo del coche (Regular o Vip), definido por la enumeración `CarType`.

### 🔧 Métodos 🔧

- `park()`: Este método asincrónico maneja el proceso de estacionamiento del coche, utilizando semáforos para asegurar que hay espacio disponible.
- `manage_parking_lot()`: Este método asincrónico gestiona todo el estacionamiento.

## 🤔 Programación Asíncrona en Rust 🤔

Rust utiliza la biblioteca `tokio` para manejar tareas asincrónicas. A diferencia de Java, que tiene un sistema de hilos incorporado, Rust utiliza un modelo de actor ligero para la concurrencia. El uso de `async/await` en Rust es muy parecido al de Java, pero Rust ofrece control más granular sobre las tareas.

## 🤔 Diferencias entre Rust y Java 🤔

### 💎 Sintaxis 💎
- **Rust**: `async fn`
- **Java**: `Future<>`

### 🔒 Control de Concurrency 🔒
- **Rust**: `tokio::sync`
- **Java**: `java.util.concurrent`

### 💡 Asincronía 💡
- **Rust**: `async/await`
- **Java**: `CompletableFuture`

## ♻️ Refactorización Realizada ♻️

No se realizaron cambios significativos en el código, ya que es bastante claro y modular.

## 🏁 Cómo Ejecutar el Código 🏁

Para ejecutar este proyecto:

1. Clone el repositorio.
2. Navegue hasta el directorio del proyecto.
3. Ejecute `cargo build`.
4. Ejecute `cargo run`.

## 🛠 Requisitos 🛠

- Rust 1.39 o superior.
- Cargo, el gestor de paquetes de Rust.

---

