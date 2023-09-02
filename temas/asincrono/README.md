# Programación Asíncrona en Rust

- Este programa en Rust utiliza el runtime de Tokio para simular la gestión de un estacionamiento con espacios regulares y espacios VIP.

## Dependencias

- Para este proyecto, es necesario instalar las siguientes dependencias.

```

[dependencies]
tokio = { version = "1", features = ["full"] }
rand = "0.8.0"


```

## Cómo funciona

### Enum "CarType"

- Define los tipos de coche que pueden entrar al estacionamiento. Los tipos disponibles son Regular y Vip.

```
enum CarType {
    Regular,
    Vip,
}

```

### Estructura "Car"

- id: un identificador único para cada coche.
- car_type: el tipo de coche (Regular o Vip).

```
struct Car {
    id: u32,
    car_type: CarType,
}
```

### Método "park" en "car"

- Este método es una función asíncrona que toma semáforos para espacios de estacionamiento regulares y VIP. Adquiere un permiso del semáforo correspondiente y "estaciona" el coche durante un tiempo aleatorio antes de liberar el permiso.

```
async fn park(&self, semaphore: Arc<Semaphore>, vip_semaphore: Arc<Semaphore>) {
    // ... Código ...
}

```

### Función manage_parking_lot

- Es una función asíncrona que controla el flujo de coches en el estacionamiento. Crea coches de forma aleatoria y los pone en una cola. Luego, inicia tareas asíncronas para "estacionar" estos coches.

```
async fn manage_parking_lot(semaphore: Arc<Semaphore>, vip_semaphore: Arc<Semaphore>, queue: Arc<Mutex<Vec<Car>>>) {
    // ... Código ...
}

```

### Funcion "Main"

- Configura el runtime de Tokio y llama a manage_parking_lot.

```

#[tokio::main]
async fn main() {
    // ... Código ...
}

```

## Conceptos utilizados

- Semáforos: Utilizados para controlar el acceso a los espacios de estacionamiento.
- Mutex: Se utiliza para garantizar el acceso exclusivo a la cola de coches.
- Tareas asíncronas: Utilizadas para simular el estacionamiento de coches de forma concurrente.

## Cómo ejecutar

- Después de agregar las dependencias en Cargo.toml, puedes ejecutar el programa utilizando cargo run.


## Diferencias con Java

### Rust

- Usa el modelo de "async/await" nativo del lenguaje para manejar la asincronía.
- Basado en "Futures" y "Tasks" que son ejecutados por un runtime como Tokio.
- Ofrece control más granular sobre la concurrencia.
- Tipo de sistema con verificación en tiempo de compilación para garantizar la seguridad de la concurrencia (por ejemplo, garantiza que un objeto sea Send para transferirlo entre hilos).

### Java

- Tradicionalmente ha utilizado hilos y bloqueo para manejar la asincronía.
- Las bibliotecas modernas (como CompletableFuture) permiten un estilo más funcional de programación asíncrona.


- En general, menos control granular en comparación con Rust; más orientado a un modelo de alto nivel.
-Ambos lenguajes pueden lograr tareas similares en lo que respecta a la asincronía, pero lo hacen de maneras diferentes y con diferentes ventajas y desventajas.