/**
 * Clase para representar una persona con nombre, edad y ciudad.
 */
data class Person(val name: String, val age: Int, val city: String)

/**
 * Valida la información de una persona.
 */
fun validate(person: Person): Boolean {
    return person.age >= 0 && person.name.isNotEmpty() && person.city.isNotEmpty()
}

fun main() {
    val people = listOf(
        Person("Alice", 29, "New York"),
        Person("Bob", 22, "Boston"),
        Person("Catherine", 31, "Chicago"),
        Person("David", 45, "Denver")
    ).filter(::validate)

    mostrarResultados(
        "Personas mayores de 30" to filterOlderThan(people, 30),
        "Nombres de personas" to transformToNames(people),
        "Personas agrupadas por ciudad" to groupPeopleByCity(people),
        "Edad promedio" to calculateAverageAge(people),
        "Ordenado por edad y luego por nombre" to sortPeopleByAgeAndName(people),
        "¿Todos viven en la misma ciudad?" to checkIfAllInSameCity(people),
        "Ciudades únicas" to findUniqueCities(people)
    )
}

/**
 * Muestra múltiples resultados con sus etiquetas correspondientes.
 */
fun mostrarResultados(vararg resultados: Pair<String, Any>) {
    for ((etiqueta, resultado) in resultados) {
        println("$etiqueta: $resultado")
    }
}

fun filterOlderThan(people: List<Person>, age: Int): List<Person> {
    return people.filter { it.age > age }
}

fun transformToNames(people: List<Person>): List<String> {
    return people.map { it.name }
}

fun findYoungestPerson(people: List<Person>): Person? {
    return people.minByOrNull { it.age }
}

fun groupPeopleByCity(people: List<Person>): Map<String, List<Person>> {
    return people.groupBy { it.city }
}

fun calculateAverageAge(people: List<Person>): Double {
    return people.map { it.age }.average()
}

fun sortPeopleByAgeAndName(people: List<Person>): List<Person> {
    return people.sortedWith(compareBy({ it.age }, { it.name }))
}

fun checkIfAllInSameCity(people: List<Person>): Boolean {
    val firstCity = people.firstOrNull()?.city ?: return false
    return people.all { it.city == firstCity }
}

fun findUniqueCities(people: List<Person>): Set<String> {
    return people.map { it.city }.toSet()
}
