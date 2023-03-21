# HERENCIA EN PYTHON

## Descripción
* Este ejemplo muestra cómo utilizar la herencia en la programación orientada a objetos de Python para crear subclases que hereden atributos y métodos de una clase base. En este caso, la clase base es Coche, que tiene atributos como la marca, modelo, año y color del coche, y métodos como arrancar y apagar el coche.

## Clases
### Coche
* Es la clase base que representa un coche y tiene los siguientes atributos y métodos:

1. Marca
2. Modelo
3. Año
4. Color
5. arrancar(): enciende el coche
6. apagar(): apaga el coche

#### Sedan
* Es una subclase de Coche que representa un coche sedán. Hereda los atributos y métodos de Coche y tiene un atributo adicional para el número de puertas y un método para abrir el baúl:

1. Num_Puertas
2. abrir_baul(): abre el baúl del coche

#### SUV
* Es otra subclase de Coche que representa un vehículo utilitario deportivo. Hereda los atributos y métodos de Coche y tiene un atributo adicional para el número de asientos y un método para abrir el área de carga:

1. Num_Asientos
2. abrir_area_carga(): abre el área de carga del vehículo

## Funcionamiento de la herencia
* En este ejemplo, se crean objetos de la clase Coche, Sedan y SUV, y se llaman a sus métodos respectivos para demostrar la herencia de atributos y métodos. La herencia permite que las subclases Sedan y SUV aprovechen los atributos y métodos de la clase base Coche, y también pueden agregar nuevos atributos y métodos según sea necesario.

* Por ejemplo, se crea un objeto carro de la clase Coche, un objeto sedan de la subclase Sedan, y un objeto suv de la subclase SUV. Luego se llaman a los métodos arrancar y apagar en cada objeto para iniciar y detener el coche respectivamente, y también se llaman a los métodos abrir_baul y abrir_area_carga en los objetos sedan y suv, respectivamente.

## Beneficios de la herencia en programación
* La herencia simplifica la reutilización de código al permitir que las subclases hereden atributos y métodos de la clase base. Además, permite crear jerarquías de clases que representen mejor la estructura de los objetos en el mundo real y facilita el mantenimiento del código al reducir la duplicación de código.