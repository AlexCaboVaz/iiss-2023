# Ejemplo de programación asíncrona en Python utilizando asyncio
Este ejemplo muestra cómo utilizar la programación asíncrona en Python mediante la biblioteca asyncio para mejorar la eficiencia en la ejecución de un código que simula un concesionario de coches. El objetivo de utilizar la programación asíncrona es poder realizar varias tareas de forma simultánea y en paralelo.

## Cómo funciona el código
El archivo principal asyncio_coches.py contiene tres funciones principales:

- revisar_coche(coche): esta función simula la tarea de revisión de un coche. Imprime un mensaje indicando que se está revisando el coche y espera 3 segundos simulados antes de imprimir un mensaje que indica que la tarea ha sido completada.
- vender_coche(coche): esta función simula la tarea de venta de un coche. Imprime un mensaje indicando que se está vendiendo el coche y espera 5 segundos simulados antes de imprimir un mensaje que indica que la tarea ha sido completada.
- main(): esta función crea una lista de coches y luego crea una tarea para revisar y vender cada uno de ellos utilizando la función asyncio.create_task(). Luego, espera a que se completen todas las tareas utilizando asyncio.gather().

## Cómo se ha aplicado la programación asíncrona

En el código, se han utilizado las funciones async def para indicar que las funciones revisar_coche() y vender_coche() se ejecutan de forma asíncrona. De esta manera, cuando se llaman a estas funciones, no bloquean la ejecución del programa y permiten que otras tareas se ejecuten mientras se espera la finalización de la tarea actual.

Además, se han utilizado las funciones asyncio.create_task() y asyncio.gather() para crear tareas asíncronas y esperar a que se completen. En la función main(), se crea una tarea para cada coche utilizando asyncio.create_task(), lo que permite que todas las tareas se ejecuten en paralelo. Luego, se utiliza asyncio.gather() para esperar a que todas las tareas se completen antes de continuar con la ejecución del programa.

## Ejemplo de uso en el código
Aquí presentamos un ejemplo de cómo se utiliza la programación asíncrona en el código para revisar un coche:

```
async def revisar_coche(coche):
    print(f"Revisando coche {coche['marca']} {coche['modelo']}")
    await asyncio.sleep(3)
    print(f"Revisión completada para coche {coche['marca']} {coche['modelo']}")
```
La palabra clave async indica que la función se ejecutará de forma asíncrona. El tiempo de espera await asyncio.sleep(3) permite que otras tareas se ejecuten durante este tiempo.

## Conclusión
En resumen, la programación asíncrona nos permite realizar varias tareas de forma simultánea y en paralelo, lo que puede mejorar el rendimiento y la eficiencia de nuestro código. En este ejemplo, hemos utilizado la biblioteca asyncio para simular la tarea de un concesionario de coches y hemos mostrado cómo utilizar las funciones async def, asyncio.create_task() y asyncio.gather() para implementar la programación asíncrona en Python.
