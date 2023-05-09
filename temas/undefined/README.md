# ¿Qué es undefined en Scala con la biblioteca Option?
En Scala, undefined se refiere a una variable que no ha sido inicializada. Es decir, es una variable que no tiene un valor asignado y que por lo tanto, no se puede utilizar. En lugar de usar null como en otros lenguajes, en Scala se utiliza Option para manejar la posibilidad de que una variable no tenga un valor asignado.

Option es una clase en la biblioteca estándar de Scala que representa una variable que puede o no tener un valor asignado. Si la variable tiene un valor, se utiliza la clase Some para almacenar el valor. Si la variable no tiene un valor, se utiliza la clase None.

## Cómo se ha implementado el código
A continuación, se presenta un ejemplo de cómo se puede utilizar Option para manejar variables que pueden o no tener un valor asignado en Scala:

```
case class Car(make: String, model: Option[String], year: Int)

val car1 = Car("Toyota", Some("Corolla"), 2020)
val car2 = Car("Honda", None, 2018)

def printCarModel(car: Car): Unit = {
  car.model match {
    case Some(model) => println(s"The model of the car is: $model")
    case None => println("The car has no model")
  }
}

printCarModel(car1) // Output: The model of the car is: Corolla
printCarModel(car2) // Output: The car has no model
```

En este ejemplo, Car es una clase que representa un coche y tiene tres atributos: make, model y year. model es una variable de tipo Option[String], lo que significa que puede tener un valor Some (en este caso, un String que representa el modelo del coche) o None.

Se crean dos objetos car1 y car2 de la clase Car, donde car1 tiene un modelo asignado (Some("Corolla")) y car2 no tiene un modelo asignado (None).

Luego, se define una función printCarModel que toma un objeto Car como parámetro e imprime el modelo del coche si se ha asignado, o "The car has no model" si no se ha asignado.

Finalmente, se llama a la función printCarModel con los objetos car1 y car2 como argumentos, lo que muestra la salida esperada en la consola.

## Resumen
En resumen, al utilizar Option para manejar variables que pueden o no tener un valor asignado, podemos evitar errores de tiempo de ejecución al intentar acceder a una variable null o no inicializada. En su lugar, podemos utilizar patrones de coincidencia para manejar las diferentes posibilidades de valores que una variable puede tener.
