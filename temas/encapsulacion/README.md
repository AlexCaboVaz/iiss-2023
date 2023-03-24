# ENCAPSULACION EN RUBY

  * En este ejemplo se crean dos clases en Ruby: Persona y Empleado. La clase Empleado es una subclase de la clase Persona, lo que significa que hereda todos los atributos y métodos de la clase Persona.

## Clase Persona
* La clase Persona tiene tres atributos de instancia: nombre, edad y contraseña. Se utilizan los métodos attr_reader y attr_accessor para crear métodos de acceso para estos atributos. Además, se definen dos métodos de instancia adicionales:

     1. comprobar: toma una contraseña como argumento y compara si coincide con la contraseña almacenada en la instancia de Persona.
     ~~~
     def comprobar(contraseña)
      contraseña == @contrasena
     end
     ~~~
     2. ComprobarID: es un método privado que verifica la identidad de la persona, aunque la lógica específica para esta verificación no se define en este ejemplo.
     ~~~
     def ComprobarID(id)
     # Lógica para verificar la identidad de la personaaa
     end
     ~~~

* También se define un método dirección como método protegido. Este método podría utilizarse para obtener la dirección de la persona, aunque la lógica específica para obtener la dirección no se define en este ejemplo.

## Clase Empleado
* La clase Empleado hereda los atributos y métodos de la clase Persona utilizando la palabra clave super. Además, se definen dos métodos de instancia adicionales:

     1. obtenerDireccion: llama al método protegido dirección de la clase Persona para obtener la dirección de la persona.
     2. verificarID: llama al método privado ComprobarID de la clase Persona para verificar la identidad del empleado.
## Uso
* Se crean una instancia de Persona llamada persona y una instancia de Empleado llamada empleado. Luego, se utilizan los métodos de instancia definidos para leer y escribir en los atributos de las instancias, y para verificar la identidad y la dirección de la persona y el empleado.

## Encapsulación en ruby, ¿como es?:
* En Ruby, la visibilidad de los métodos es una convención que ayuda a ocultar la implementación de los métodos privados y protegidos de las clases. El método ComprobarID es privado para garantizar la seguridad de los datos y el método dirección es protegido para permitir que las subclases accedan a él. Aunque no hay una forma estricta de ocultar la implementación de un método en Ruby, estas convenciones son útiles para mantener la estructura del código y la privacidad de los dato
~~~
protected
  
    def dirección
      # Lógica para obtener la dirección de la personaaa
    end
  end
~~~
## Conclusiones
* Este ejemplo muestra cómo se pueden utilizar los mecanismos de encapsulación en Ruby para proteger los datos y la funcionalidad de una clase y sus subclases, y cómo se pueden utilizar los métodos de acceso para leer y escribir en los atributos de las instancias.
