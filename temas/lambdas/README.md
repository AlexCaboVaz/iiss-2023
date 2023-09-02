# Lambdas en Kotlin


- En Kotlin, las lambdas son funciones anónimas que puedes usar para pasar código como argumento a funciones de orden superior. Utilizan una sintaxis concisa y permiten operaciones como filtrar, mapear y reducir en colecciones. También soportan la captura y modificación de variables externas y utilizan it para referirse a un único parámetro no declarado.

## Código

### Clase Person

- Primero, definimos una clase de datos llamada Person con tres propiedades: name, age y city. Esta clase se utilizará para crear una lista de objetos Person.

```

data class Person(val name: String, val age: Int, val city: String)


```

### Lista de Objetos Person

- Creamos una lista de objetos Person que contiene cuatro personas con diferentes nombres, edades y ciudades.

```

val people = listOf(
    Person("Alice", 29, "New York"),
    Person("Bob", 22, "Boston"),
    Person("Catherine", 31, "Chicago"),
    Person("David", 45, "Denver")
)


```


### Lambdas y sus funciones


1. Filtrar todas las personas mayores de 30 años

```

val olderThan30 = people.filter { it.age > 30 }


```

- Usamos la función filter que acepta una lambda { it.age > 30 }. Aquí, it se refiere a cada objeto Person en la lista.


2. Transformar la lista de personas a una lista de nombres

```
val names = people.map { it.name }

```

- Utilizamos map con una lambda { it.name } para transformar cada objeto Person en su propiedad name.


3. Encontrar a la persona más joven

```
val youngest = people.minByOrNull { it.age }

```

- Usamos minByOrNull con una lambda { it.age } para encontrar el objeto Person con la menor edad.


4. Agrupar personas por ciudad

```
val groupByCity = people.groupBy { it.city }

```

- Aquí, groupBy con la lambda { it.city } crea un mapa que agrupa los objetos Person por su propiedad city.


5. Calcular la edad promedio de las personas

```
val averageAge = people.map { it.age }.average()

```

- Primero, usamos map para extraer todas las edades y luego average() para calcular la edad media.


6. Ordenar personas por edad y luego por nombre

```
val sortedByAgeThenName = people.sortedWith(compareBy({ it.age }, { it.name }))

```

- sortedWith acepta un comparador, que en este caso se crea con compareBy y dos lambdas para ordenar primero por age y luego por name


7. Verificar si todas las personas viven en la misma ciudad

```
val allInSameCity = people.all { it.city == people[0].city }

```

- all utiliza una lambda para comprobar si todos los objetos Person tienen la misma city


8. Encontrar todas las ciudades únicas en las que viven las personas

```
val uniqueCities = people.map { it.city }.toSet()

```

- Utilizamos map para extraer las ciudades y luego toSet() para eliminar duplicados, obteniendo así las ciudades únicas.


## Diferencia con Java

- Sintaxis: Kotlin es más conciso; Java es más verboso.
- Variables Capturadas: Kotlin permite modificarlas; Java no.
- Tipado: Kotlin tiene mejor inferencia de tipos.
- Funciones de Extensión: Disponibles en Kotlin, no en Java.
- Funciones de Orden Superior: Más fáciles de usar en Kotlin.
- It: Kotlin usa it para simplificar las lambdas de un solo parámetro; Java no tiene un equivalente.
- En resumen, Kotlin ofrece una mayor flexibilidad y simplicidad cuando se trata de usar lambdas.