# DELEGACION EN PYTHON
   
## Ejemplo de Delegación en Python
### Descripción
* Este ejemplo muestra cómo implementar delegación en Python utilizando dos clases: Motor y Coche. La delegación es una técnica de programación que permite a un objeto utilizar la funcionalidad de otro objeto sin conocer los detalles de cómo se implementa. En este caso, la clase Coche utiliza la instancia de la clase Motor para delegar las operaciones de encendido y apagado del motor.

## Clases
### Motor
* Representa el motor del coche y tiene los siguientes métodos:

1. encender(): enciende el motor
2. apagar(): apaga el motor
### Coche
* Tiene una instancia de la clase Motor como atributo y los siguientes métodos:

1. encender(): delega la funcionalidad al método encender() de la instancia de Motor
2. apagar(): delega la funcionalidad al método apagar() de la instancia de Motor

## Funcionamiento de la delegación
* Cuando se llama a los métodos encender() y apagar() en la instancia de Coche, se delega la funcionalidad correspondiente en la instancia de Motor. De esta forma, la clase Coche no necesita conocer los detalles de cómo funciona el motor ni tener que implementar la funcionalidad por sí misma.

## Beneficios de la delegación en programación
* La delegación simplifica el diseño y mantenimiento del código al separar las responsabilidades de cada objeto. Además, permite reutilizar código ya existente de otros objetos, lo que reduce la duplicación de código y mejora la eficiencia y legibilidad del código.