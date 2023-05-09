import asyncio

async def revisar_coche(coche):
    print(f"Revisando el coche {coche}")
    await asyncio.sleep(3)
    print(f"El coche {coche} ha sido revisado")

async def vender_coche(coche):
    print(f"Vendiendo el coche {coche}")
    await asyncio.sleep(5)
    print(f"El coche {coche} ha sido vendido")

async def main():
    coches = ["Toyota", "Ford", "Chevrolet", "BMW"]
    tareas = []
    for coche in coches:
        tarea1 = asyncio.create_task(revisar_coche(coche))
        tarea2 = asyncio.create_task(vender_coche(coche))
        tareas.append(tarea1)
        tareas.append(tarea2)

    # Esperar a que se completen todas las tareas
    await asyncio.gather(*tareas)

if __name__ == "__main__":
    asyncio.run(main())
