use tokio::sync::{Semaphore, Mutex};
use tokio::time::{sleep, Duration};
use std::sync::Arc;
use rand::{Rng, SeedableRng};
use rand::rngs::StdRng;

#[derive(Debug)]
enum CarType {
    Regular,
    Vip,
}

struct Car {
    id: u32,
    car_type: CarType,
}

impl Car {
    async fn park(&self, semaphore: Arc<Semaphore>, vip_semaphore: Arc<Semaphore>) {
        let permit = match self.car_type {
            CarType::Regular => semaphore.acquire().await.unwrap(),
            CarType::Vip => vip_semaphore.acquire().await.unwrap(),
        };

        println!("Coche {} de tipo {:?} está estacionado.", self.id, self.car_type);

        // Simulamos el tiempo que el coche permanece estacionado
        let mut rng = StdRng::from_entropy();
        sleep(Duration::from_secs(rng.gen_range(2..5))).await;

        println!("Coche {} ha salido.", self.id);
        drop(permit);
    }
}

async fn manage_parking_lot(semaphore: Arc<Semaphore>, vip_semaphore: Arc<Semaphore>, queue: Arc<Mutex<Vec<Car>>>) {
    let mut car_id = 0;

    loop {
        sleep(Duration::from_secs(1)).await;

        if car_id < 20 {
            let mut rng = StdRng::from_entropy();
            let car_type = if rng.gen_bool(0.3) {
                CarType::Vip
            } else {
                CarType::Regular
            };

            let car = Car { id: car_id, car_type };

            {
                let mut q = queue.lock().await;
                q.push(car);
            }

            let sem_clone = semaphore.clone();
            let vip_sem_clone = vip_semaphore.clone();
            let queue_clone = queue.clone();
            
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

#[tokio::main]
async fn main() {
    let parking_spots = 5;
    let vip_parking_spots = 2;
    let semaphore = Arc::new(Semaphore::new(parking_spots));
    let vip_semaphore = Arc::new(Semaphore::new(vip_parking_spots));
    let queue = Arc::new(Mutex::new(Vec::new()));

    manage_parking_lot(semaphore, vip_semaphore, queue).await;
}
