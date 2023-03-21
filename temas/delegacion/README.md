# DELEGACION EN PYTHON
   
   * El ejemplo presentado muestra cómo implementar delegación en Python utilizando dos clases: Motor y Coche. La clase Motor representa el motor del coche y tiene dos métodos: encender() y apagar(). La clase Coche tiene una instancia de Motor como atributo y también tiene métodos para encender y apagar el motor.

    * Cuando se llama a los métodos encender() y apagar() en la instancia de Coche, se delega la funcionalidad correspondiente en la instancia de Motor. De esta forma, la clase Coche no necesita saber cómo funciona el motor ni tener que implementar la funcionalidad por sí misma. Simplemente utiliza la instancia de Motor para delegar las operaciones correspondientes.

    * En general, la delegación es una técnica de programación que permite a un objeto utilizar la funcionalidad de otro objeto sin tener que conocer los detalles de cómo se implementa esa funcionalidad. En lugar de eso, se pasa la responsabilidad de manejar cierta tarea a otro objeto, lo que puede simplificar el diseño y mantenimiento del código.
