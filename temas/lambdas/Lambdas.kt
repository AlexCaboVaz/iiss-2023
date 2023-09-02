data class Person(val name: String, val age: Int, val city: String)

fun main() {
    val people = listOf(
        Person("Alice", 29, "New York"),
        Person("Bob", 22, "Boston"),
        Person("Catherine", 31, "Chicago"),
        Person("David", 45, "Denver")
    )

    // 1. Filtrar todas las personas que son mayores de 30 años
    val olderThan30 = people.filter { it.age > 30 }
    println("Personas mayores de 30: $olderThan30")

    // 2. Transformar la lista de personas a una lista de nombres
    val names = people.map { it.name }
    println("Nombres de personas: $names")

    // 3. Encontrar a la persona más joven y devolver su nombre y edad
    val youngest = people.minByOrNull { it.age }
    println("La persona más joven es: ${youngest?.name}, Edad: ${youngest?.age}")

    // 4. Agrupar personas por ciudad
    val groupByCity = people.groupBy { it.city }
    println("Personas agrupadas por ciudad: $groupByCity")

    // 5. Calcular la edad promedio de las personas
    val averageAge = people.map { it.age }.average()
    println("Edad promedio: $averageAge")

    // 6. Ordenar personas por edad y luego por nombre
    val sortedByAgeThenName = people.sortedWith(compareBy({ it.age }, { it.name }))
    println("Ordenado por edad y luego por nombre: $sortedByAgeThenName")
    
    // 7. Verificar si todas las personas viven en la misma ciudad
    val allInSameCity = people.all { it.city == people[0].city }
    println("¿Todos viven en la misma ciudad? $allInSameCity")
    
    // 8. Encontrar todas las ciudades únicas en las que viven las personas
    val uniqueCities = people.map { it.city }.toSet()
    println("Ciudades únicas: $uniqueCities")
}

