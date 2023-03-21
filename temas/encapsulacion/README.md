# ENCAPSULACION EN RUBY

   *  En este ejemplo, estamos creando dos clases en Ruby: Persona y Empleado. La clase Empleado es una subclase de la clase Persona, lo que significa que hereda todos los atributos y métodos de la clase Persona.

   *  En la clase Persona, definimos tres atributos de instancia: nombre, edad y contraseña. Utilizamos los métodos attr_reader y attr_accessor para crear métodos de acceso para estos atributos. El método attr_reader crea un método de instancia para leer un atributo, mientras que el método attr_accessor crea métodos de instancia para leer y escribir en un atributo.

  *    Dos métodos de instancia adicionales en la clase Persona: comprobar y ComprobarID. El método comprobar toma una contraseña como argumento y compara si coincide con la contraseña almacenada en la instancia de Persona. El método ComprobarID es un método privado que verifica la identidad de la persona, aunque la lógica específica para esta verificación no se define en este ejemplo.

   * También definimos un método dirección como método protegido. Este método podría utilizarse para obtener la dirección de la persona, aunque la lógica específica para obtener la dirección no se define en este ejemplo.

   * En la clase Empleado, heredamos los atributos y métodos de la clase Persona utilizando la palabra clave super. También definimos dos métodos de instancia adicionales: obtenerDireccion y verificarID. El método obtenerDireccion llama al método protegido dirección de la clase Persona para obtener la dirección de la persona. El método verificarID llama al método privado ComprobarID de la clase Persona para verificar la identidad del empleado.

  *  Finalmente, creamos una instancia de Persona llamada persona y una instancia de Empleado llamada empleado. Luego, utilizamos los métodos de instancia definidos para leer y escribir en los atributos de las instancias, y para verificar la identidad y la dirección de la persona y el empleado.

  *  En resumen, este ejemplo muestra cómo se pueden utilizar los mecanismos de encapsulación en Ruby para proteger los datos y la funcionalidad de una clase y sus subclases, y cómo se pueden utilizar los métodos de acceso para leer y escribir en los atributos de las instancias.
