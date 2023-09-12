// Importa las bibliotecas necesarias para el proyecto.
use tokio::sync::{Semaphore, Mutex};
use tokio::time::{sleep, Duration};
use std::sync::Arc;
use rand::{Rng, SeedableRng};
use rand::rngs::StdRng;

// Enumeración para el tipo de coche: Regular o Vip.
#[derive(Debug)]
enum CarType {
    Regular,
    Vip,
}

// Estructura para representar un coche.
struct Car {
    id: u32,
    car_type: CarType,
}

impl Car {
    // Método asincrónico que permite estacionar el coche.
    async fn park(&self, semaphore: Arc<Semaphore>, vip_semaphore: Arc<Semaphore>) {
        // Adquiere un permiso del semáforo, dependiendo del tipo de coche.
        let permit = match self.car_type {
            CarType::Regular => semaphore.acquire().await.unwrap(),
            CarType::Vip => vip_semaphore.acquire().await.unwrap(),
        };

        // Imprime un mensaje indicando que el coche está estacionado.
        println!("Coche {} de tipo {:?} está estacionado.", self.id, self.car_type);

        // Simula el tiempo que el coche permanece estacionado.
        let mut rng = StdRng::from_entropy();
        sleep(Duration::from_secs(rng.gen_range(2..5))).await;

        // Imprime un mensaje cuando el coche sale del estacionamiento.
        println!("Coche {} ha salido.", self.id);
        drop(permit);
    }
}

// Función asincrónica que maneja el estacionamiento.
async fn manage_parking_lot(semaphore: Arc<Semaphore>, vip_semaphore: Arc<Semaphore>, queue: Arc<Mutex<Vec<Car>>>) {
    let mut car_id = 0;

    // Bucle infinito para la gestión del estacionamiento.
    loop {
        // Espera 1 segundo antes de la siguiente iteración.
        sleep(Duration::from_secs(1)).await;

        // Si hay menos de 20 coches, crea un nuevo coche.
        if car_id < 20 {
            let mut rng = StdRng::from_entropy();
            let car_type = if rng.gen_bool(0.3) {
                CarType::Vip
            } else {
                CarType::Regular
            };

            // Crea un nuevo coche y lo añade a la cola.
            let car = Car { id: car_id, car_type };
            {
                let mut q = queue.lock().await;
                q.push(car);
            }

            // Clona las referencias para que puedan ser usadas dentro del async block.
            let sem_clone = semaphore.clone();
            let vip_sem_clone = vip_semaphore.clone();
            let queue_clone = queue.clone();
            
            // Crea una nueva tarea para estacionar el coche.
            tokio::spawn(async move {
                let car = {
                    let mut q = queue_clone.lock().await;
                    q.pop().unwrap()
                };
                car.park(sem_clone, vip_sem_clone).await;
            });

            car_id += 1;
        }
    }
}

// Función principal que arranca el programa.
#[tokio::main]
async fn main() {
    // Inicializa el semáforo con 5 plazas para coches regulares y 2 para VIPs.
    let parking_spots = 5;
    let vip_parking_spots = 2;
    let semaphore = Arc::new(Semaphore::new(parking_spots));
    let vip_semaphore = Arc::new(Semaphore::new(vip_parking_spots));

    // Inicializa una cola vacía para los coches.
    let queue = Arc::new(Mutex::new(Vec::new()));

    // Llama a la función para manejar el estacionamiento.
    manage_parking_lot(semaphore, vip_semaphore, queue).await;
}
