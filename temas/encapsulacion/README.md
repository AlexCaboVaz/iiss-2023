# ENCAPSULACION EN RUBY

  * En este ejemplo se crean dos clases en Ruby: Persona y Empleado. La clase Empleado es una subclase de la clase Persona, lo que significa que hereda todos los atributos y métodos de la clase Persona.

## Clase Persona
     * La clase Persona tiene tres atributos de instancia: nombre, edad y contraseña. Se utilizan los métodos attr_reader y attr_accessor para crear métodos de acceso para estos atributos. Además, se definen dos métodos de instancia adicionales:

     1. comprobar: toma una contraseña como argumento y compara si coincide con la contraseña almacenada en la instancia de Persona.
     2. ComprobarID: es un método privado que verifica la identidad de la persona, aunque la lógica específica para esta verificación no se define en este ejemplo.

     * También se define un método dirección como método protegido. Este método podría utilizarse para obtener la dirección de la persona, aunque la lógica específica para obtener la dirección no se define en este ejemplo.

## Clase Empleado
     * La clase Empleado hereda los atributos y métodos de la clase Persona utilizando la palabra clave super. Además, se definen dos métodos de instancia adicionales:

     1. obtenerDireccion: llama al método protegido dirección de la clase Persona para obtener la dirección de la persona.
     2.verificarID: llama al método privado ComprobarID de la clase Persona para verificar la identidad del empleado.
## Uso
     * Se crean una instancia de Persona llamada persona y una instancia de Empleado llamada empleado. Luego, se utilizan los métodos de instancia definidos para leer y escribir en los atributos de las instancias, y para verificar la identidad y la dirección de la persona y el empleado.

## Conclusiones
     * Este ejemplo muestra cómo se pueden utilizar los mecanismos de encapsulación en Ruby para proteger los datos y la funcionalidad de una clase y sus subclases, y cómo se pueden utilizar los métodos de acceso para leer y escribir en los atributos de las instancias.
