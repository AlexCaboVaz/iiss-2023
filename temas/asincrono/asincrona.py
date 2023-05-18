import asyncio

async def revisar_coche(coche):
    print(f"Iniciando revisión del coche {coche}")
    await asyncio.sleep(3)
    print(f"Revisión completada del coche {coche}")

async def pintar_coche(coche):
    print(f"Iniciando pintura del coche {coche}")
    await asyncio.sleep(5)
    print(f"Pintura completada del coche {coche}")

async def vender_coche(coche):
    print(f"Iniciando venta del coche {coche}")
    await asyncio.sleep(2)
    print(f"Venta completada del coche {coche}")

async def main():
    coches = ["Toyota", "Ford", "Chevrolet", "BMW"]
    tareas = []

    for coche in coches:
        tarea_revisar = asyncio.create_task(revisar_coche(coche))
        tarea_pintar = asyncio.create_task(pintar_coche(coche))
        tarea_vender = asyncio.create_task(vender_coche(coche))
        tareas.extend([tarea_revisar, tarea_pintar, tarea_vender])

    await asyncio.gather(*tareas)

if __name__ == "__main__":
    asyncio.run(main())
