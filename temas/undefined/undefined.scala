case class Car(make: String, model: String, year: Option[Int])

// creación de algunos coches
val car1 = Car("Toyota", "Corolla", Some(2018))
val car2 = Car("Honda", "Civic", None)
val car3 = Car("Ford", "Mustang", Some(2022))

// función para imprimir información de un coche
def printCarInfo(car: Car): Unit = {
  println(s"${car.make} ${car.model}")
  car.year match {
    case Some(year) => println(s"Anio: $year")
    case None => println("Año: desconocido")
  }
}

// imprimir información de los coches
printCarInfo(car1)
printCarInfo(car2)
printCarInfo(car3)
