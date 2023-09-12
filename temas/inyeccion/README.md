# Sistema de Gestión de Empleados en Ruby

---

## 📌 Índice 📌

1. [📚 Descripción General](#descripción-general)
2. [🔍 Cómo Funciona](#cómo-funciona)
   - [📚 Clase EmployeeDatabase](#-clase-employeedatabase-)
   - [🛠️ Clase EmployeeManager](#-clase-employeemanager-)
   - [🌟 Clase MyApp](#-clase-myapp-)
   - [📦 Inyección de Dependencias](#inyección-de-dependencias)
3. [🤔 Inyección de Dependencias en Ruby vs Java](#inyección-de-dependencias-en-ruby-vs-java)
4. [♻️ Refactorización del Código](#refactorización-del-código)
5. [🏁 Cómo Ejecutar el Código](#cómo-ejecutar-el-código)
6. [🛠 Requisitos](#requisitos)
7. [💡 Explicación del Código](#explicación-del-código)

---

## 📚 Descripción General 📚

Este proyecto en Ruby demuestra un Sistema de Gestión de Empleados que utiliza **Inyección de Dependencias** para gestionar las dependencias entre clases. Utiliza las gemas `Dry-Container` y `Dry-AutoInject` para lograrlo.

---

## 🔍 Cómo Funciona 🔍

### 📚 Clase `EmployeeDatabase` 📚

Esta clase actúa como un almacén de datos para los empleados. Utiliza un hash interno para mantener el estado de los empleados. 

```ruby
def add_employee(id, name)
  @data[id] = name
end

def get_employee(id)
  @data[id]
end
```

### 🛠️ Clase `EmployeeManager` 🛠️

Esta clase se encarga de las operaciones de gestión de empleados, como añadir un nuevo empleado y buscar un empleado existente. Toma una instancia de `EmployeeDatabase` como una dependencia.

```ruby
def register_employee(id, name)
  @employee_database.add_employee(id, name)
end

def find_employee(id)
  @employee_database.get_employee(id)
end
```

### 🌟 Clase `MyApp` 🌟

Esta clase es la que realmente ejecuta nuestro programa. Utiliza la inyección de dependencias para obtener una instancia de `EmployeeManager` y luego realiza operaciones en ella.

```ruby
employee_manager.register_employee(1, 'Alice')
employee_manager.register_employee(2, 'Bob')

puts employee_manager.find_employee(1)
puts employee_manager.find_employee(2)
```

Con `Dry-AutoInject`, la inyección de la instancia se maneja automáticamente, lo que permite un acoplamiento más débil y una mayor facilidad para las pruebas.


### 📦 Inyección de Dependencias 📦

La inyección de dependencias se gestiona a través del contenedor de dependencias `MyContainer`. Aquí es donde se registran las diferentes clases que necesitaremos.

```ruby
class MyContainer
  extend Dry::Container::Mixin

  register('employee_database') { EmployeeDatabase.new }
  register('employee_manager') { EmployeeManager.new(MyContainer['employee_database']) }
end
```

La clase `EmployeeManager` depende de `EmployeeDatabase`. Esta dependencia se inyecta en tiempo de ejecución.

```ruby
class EmployeeManager
  def initialize(employee_database)
    @employee_database = employee_database
  end
  # ...
end
```

## 🤔 Inyección de Dependencias en Ruby vs Java 🤔

- **Ruby**: Usa metaprogramación y la gema Dry-Container para inyección de dependencias, haciendo el código más flexible pero también más mágico.
  
- **Java**: Tiende a usar anotaciones e interfaces para lograr la inyección de dependencias, haciéndolo más explícito pero tal vez más verboso.

---

## ♻️ Refactorización del Código ♻️

El código ha sido refactorizado para utilizar `Dry-Container` y `Dry-AutoInject`, permitiendo un mejor manejo de las dependencias y facilitando las pruebas unitarias.

---

## 🏁 Cómo Ejecutar el Código 🏁

1. Abre una terminal.
2. Navega hasta el directorio del proyecto.
3. Ejecuta `ruby nombre_del_archivo.rb`.

---

## 🛠 Requisitos 🛠

- Ruby 2.6 o superior
- Gema Dry-Container
- Gema Dry-AutoInject

---

