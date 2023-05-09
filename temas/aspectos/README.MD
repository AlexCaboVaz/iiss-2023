# Ejemplo de uso de aspectos en Python con AspectLib

Este ejemplo muestra cómo aplicar aspectos en Python utilizando la biblioteca AspectLib. Los aspectos son una técnica de programación que permite separar las preocupaciones transversales de un programa en módulos separados y reutilizables, lo que hace que el código sea más modular, fácil de entender y mantener.

## Estructura del código

El código de este ejemplo consta de dos clases: Point y Line. La clase Point representa un punto en un sistema de coordenadas cartesianas, mientras que la clase Line representa una línea que conecta dos puntos.

La clase Point tiene dos atributos: x e y, que representan las coordenadas del punto. La clase Line tiene dos atributos: p1 y p2, que representan los puntos finales de la línea.

Ambas clases tienen métodos get_x() y get_y() que devuelven las coordenadas x e y del punto, y métodos set_x() y set_y() que establecen las coordenadas x e y del punto.

## Aplicando aspectos en Python con AspectLib
Para aplicar aspectos en Python con AspectLib, debemos seguir los siguientes pasos:

1. Importar la biblioteca aspectlib.
2. Definir una función que se ejecutará antes o después de la función original, es decir, el aspecto. Esta función debe tener un argumento next_func, que representa la función original que se va a modificar.
3. Utilizar el decorador @aspectlib.Aspect para aplicar el aspecto a la función original.
Por ejemplo, podemos crear un aspecto que registre todas las llamadas a los métodos set_x() y set_y() de la clase Point:
import aspectlib

```
class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def get_x(self):
        return self.x

    def get_y(self):
        return self.y

    @aspectlib.Aspect
    def set_x(self, x):
        print(f"Setting x to {x}")
        yield aspectlib.Return(self.x)

    @aspectlib.Aspect
    def set_y(self, y):
        print(f"Setting y to {y}")
        yield aspectlib.Return(self.y)
```

En este ejemplo, creamos dos aspectos utilizando el decorador @aspectlib.Aspect. El aspecto set_x se ejecutará antes o después de la función set_x() original, y registrará el valor que se está estableciendo. El aspecto set_y funciona de la misma manera para la función set_y().

Podemos utilizar estas clases y aspectos de la siguiente manera:

```
point = Point()
point.set_x(10)
point.set_y(20)

```

Este código creará un objeto Point, establecerá la coordenada x en 10 y la coordenada y en 20. Cada vez que se llama a set_x() o set_y(), se imprimirá un mensaje que indica el valor que se está estableciendo.

## Ejecutando el código
Para ejecutar este código, primero debemos instalar la biblioteca AspectLib. Podemos hacerlo utilizando el siguiente comando:
```
pip install aspectlib
```
Luego, podemos ejecutar el archivo main.py que contiene el código de ejemplo:
```
python aspectos.py
```
Este archivo creará un objeto Point, establecerá las coordenadas x e y varias veces utilizando los métodos set_x() y set_y(), y mostrará los valores de las coordenadas utilizando los métodos get_x() y get_y().

Cada vez que se establece una coordenada, se imprimirá un mensaje que indica el valor que se está estableciendo. Esto se debe a los aspectos que hemos definido en la clase Point.

## Conclusiones

Los aspectos son una técnica útil para separar las preocupaciones transversales de un programa en módulos separados y reutilizables. En este ejemplo, hemos utilizado la biblioteca AspectLib para aplicar aspectos en Python a los métodos de las clases Point y Line.

Estos aspectos nos permiten registrar las llamadas a los métodos set_x() y set_y() de la clase Point. De esta manera, podemos separar la funcionalidad de establecimiento de coordenadas de la clase Point de la funcionalidad de registro de llamadas.

En resumen, la utilización de aspectos nos permite tener un código más modular, fácil de entender y mantener, lo que es especialmente importante en proyectos de gran escala.



