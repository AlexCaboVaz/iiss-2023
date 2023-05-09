import rx
from rx import operators as ops
import asyncio

class Coche:
    def __init__(self, nombre):
        self.nombre = nombre

    async def realizar_accion(self, accion):
        print(f"{self.nombre} realizando la acción {accion}...")
        # Simulamos una operación asíncrona con un sleep de 1 segundo
        await asyncio.sleep(1)
        print(f"{self.nombre} completó la acción {accion}")

coche1 = Coche("Coche 1")
coche2 = Coche("Coche 2")
coche3 = Coche("Coche 3")

coches = [coche1, coche2, coche3]

# Fuente de eventos que emite una acción cada segundo
evento_stream = rx.interval(1) \
    .pipe(ops.map(lambda i: f"Accion {i}"))

# Creamos un stream para cada coche y fusionamos todos los streams en uno solo
streams_coches = [evento_stream.pipe(
    ops.filter(lambda accion: accion.endswith(str(i))),
    ops.flat_map(lambda accion: rx.from_future(coche.realizar_accion(accion))),
) for i, coche in enumerate(coches)]

stream_fusionado = rx.merge(*streams_coches)

# Suscribimos al stream resultante para imprimir los resultados
stream_fusionado.subscribe(lambda _: print("Acción completada"))

# Esperamos a que se completen todas las acciones antes de terminar
asyncio.get_event_loop().run_until_complete(asyncio.gather(*[coche.realizar_accion("Apagar") for coche in coches]))


