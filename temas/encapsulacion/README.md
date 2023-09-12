# 🌟📚 **Gestión de Personas y Empleados en Ruby** 📚🌟

---

## 📌 **Tabla de Contenidos** 📌

1. [✨ Descripción General ✨](#-descripción-general-)
2. [🔍 Cómo Funciona 🔍](#-cómo-funciona-)
   - [🙎‍♂️ Clase Base: Persona 🙎‍♂️](#-clase-base-persona-)
   - [💼 Clase Derivada: Empleado 💼](#-clase-derivada-empleado-)
3. [🛡 Encapsulación en Ruby 🛡](#-encapsulación-en-ruby-)
4. [🔄 Diferencias con Java 🔄](#-diferencias-con-java-)
5. [⚙ Ejecución y Requisitos ⚙](#-ejecución-y-requisitos-)

---

## ✨📃 Descripción General 📃✨

Este código en Ruby define **dos** clases majestuosas:

- 🙎‍♂️ **Persona**: Contiene atributos y métodos generales para cualquier persona.
- 💼 **Empleado**: Hereda de `Persona` y añade funcionalidades específicas para empleados.

---

## 🔍 Cómo Funciona 🔍

### 🙎‍♂️ Clase Base: Persona 🙎‍♂️

```ruby
class Persona
  attr_reader :nombre, :edad
  attr_accessor :contraseña
  
  def initialize(nombre, edad, contrasena)
    @nombre = nombre
    @edad = edad
    @contrasena = contrasena
  end
  
  def comprobar(contraseña)
    contraseña == @contrasena
  end
end
```

#### 🎯 Funciones Principales 🎯

- initialize: Constructor de la clase.
- comprobar: Compara una contraseña proporcionada con la almacenada en la clase.

## 💼 Clase Derivada: Empleado 💼

```ruby
class Empleado < Persona
  def initialize(nombre, edad, contraseña, id)
    super(nombre, edad, contraseña)
    @id = id
  end
end

```

#### 🎯 Funciones Principales 🎯

- initialize: Constructor de la clase que también inicializa el id del empleado.



## 🛠 Refactorización del Código 

> **🌟 Resumen:**  
> Este apartado tiene como objetivo **explicar** las **técnicas de refactorización** aplicadas al código para mejorar su legibilidad, mantenibilidad y eficiencia.

---

### 📜 Técnicas Utilizadas

1. **🔍 Extraer Método**:  
    - 📝 *Descripción*: Mantener los métodos bien separados para cumplir con una única responsabilidad.
    - 🧩 *Ejemplo*: Método `comprobar` en la clase `Persona`.

2. **📛 Usar Nombres Descriptivos**:  
    - 📝 *Descripción*: Utilizar nombres de métodos y variables que sean lo más descriptivos posible.
    - 🧩 *Ejemplo*: Variables como `contraseña`, `nombre`, `edad`.

3. **🔒 Encapsulación**:  
    - 📝 *Descripción*: Utilizar niveles apropiados de encapsulación (`public`, `protected`, `private`) para controlar el acceso a los métodos y variables.
    - 🧩 *Ejemplo*: Uso de `private` y `protected` en la clase `Persona`.

## 🛡 Encapsulación en Ruby 🛡

- Public: Accesibles desde cualquier parte.
- Protected: Sólo accesibles por instancias de la misma clase o subclases.
- Private: Sólo accesibles dentro de la misma instancia de clase.

## 🔄 Diferencias con Java 🔄

1. Herencia: En Ruby, se utiliza < vs. extends en Java.
2. Encapsulación: Palabras clave ligeramente diferentes.
3. Constructores: initialize en Ruby vs. nombre de la clase en Java.
4. Tipado: Dinámico en Ruby vs. estático en Java

## ⚙ Ejecución y Requisitos ⚙

1. Instalación de Ruby: Asegúrese de tener Ruby instalado en su sistema.
2. Ejecución: Guarde el código en un archivo .rb y ejecute con el comando ruby nombre_del_archivo.rb.