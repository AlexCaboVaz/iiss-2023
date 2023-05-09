## Cómo funciona el código
El código utiliza la biblioteca RxPY para trabajar con flujos de eventos asíncronos. En este ejemplo, creamos una clase Coche que tiene un nombre y una función realizar_accion que simula una operación asíncrona realizada por el coche.

Luego, creamos tres instancias de la clase Coche y las almacenamos en una lista coches. Después, definimos una fuente de eventos que emite una acción cada segundo utilizando el operador interval de RxPY.

Utilizamos operadores de RxPY para filtrar y transformar estos eventos en un stream para cada coche, y luego fusionamos todos los streams en uno solo utilizando el operador merge.

Finalmente, nos suscribimos a este stream resultante con una función lambda que imprime un mensaje cada vez que se completa una acción. Para asegurarnos de que se completen todas las acciones, esperamos a que se completen todas las acciones antes de terminar el programa utilizando asyncio.gather.

```
import asyncio
import rx
from rx import operators as ops

class Coche:
    def __init__(self, nombre):
        self.nombre = nombre
    
    async def realizar_accion(self):
        await asyncio.sleep(1)  # Simular una acción asíncrona
        print(f"{self.nombre} ha realizado una acción")

coches = [Coche("Coche 1"), Coche("Coche 2"), Coche("Coche 3")]

fuente = rx.interval(1)  # Emite un evento cada segundo

stream_coches = (
    fuente
    .pipe(
        ops.zip(coches),
        ops.map(lambda tupla: tupla[1].realizar_accion())
    )
    .pipe(ops.merge_all())
)

stream_coches.subscribe(lambda _: print("Se ha completado una acción"))

asyncio.run(asyncio.gather(stream_coches.to_future()))
```

## ¿Qué es ReactiveX?
- Biblioteca de programación reactiva.
- Permite trabajar con flujos de datos asíncronos.
- Utiliza una sintaxis funcional y declarativa.
## ¿Cómo funciona ReactiveX en Python?
- mplementación de ReactiveX en Python se llama RxPY.
- Permite trabajar con flujos de eventos utilizando una sintaxis similar a la de ReactiveX en otros lenguajes.
1. Conceptos clave:
    - Observable: Representa un flujo de eventos que se puede observar y transformar utilizando operadores.
    - Operadores: Funciones que transforman los flujos de eventos.
    - Subscriber: Es quien observa el flujo de eventos y ejecuta acciones en respuesta a ellos.
    - Schedulers: Permite controlar el flujo y la ejecución de eventos.
2. Programación reactiva con RxPY:
    - Crear un flujo de eventos utilizando la clase Observable.
    - Utilizar operadores para transformar y filtrar el flujo de eventos.
    - Suscribirse al flujo de eventos utilizando un Subscriber.
## ¿Qué operadores ofrece RxPY?
- map: Transforma cada evento del flujo utilizando una función.
- filter: Filtra los eventos del flujo según una condición.
- reduce: Reduce el flujo de eventos a un solo valor utilizando una función de reducción.
- merge: Combina varios flujos de eventos en uno solo.
- zip: Combina dos flujos de eventos en uno solo, emitiendo eventos en pares.

En resumen, ReactiveX en Python (RxPY) es una biblioteca de programación reactiva que permite trabajar con flujos de eventos asíncronos utilizando una sintaxis funcional y declarativa. Permite transformar y filtrar estos flujos de manera sencilla y eficiente utilizando una gran cantidad de operadores, y permite suscribirse a estos flujos utilizando un Subscriber para procesar cada evento del flujo.