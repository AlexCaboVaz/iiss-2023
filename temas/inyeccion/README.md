# Inyección de Dependencias en Ruby con Dry::Container

- Este documento describe cómo implementar la inyección de dependencias en Ruby utilizando la gema Dry::Container. La inyección de dependencias es un patrón de diseño utilizado en programación para aumentar la eficiencia y modularidad del código.

- Dry::Container es una biblioteca en Ruby para gestionar dependencias. Permite registrar recursos con claves únicas y luego resolverlos cuando se necesiten. Se puede usar junto con dry-auto_inject para la inyección automática de dependencias, haciendo el código más modular y fácil de gestionar.

## Requerimientos

- Ruby
- Gema dry-container
- Gema dry-auto_inject

## Código

### Configuración del contenedor - MyContainer

- Primero, definimos una clase llamada MyContainer que se extiende con Dry::Container::Mixin. Este mixin nos proporciona métodos para registrar y resolver dependencias.

```

class MyContainer
  extend Dry::Container::Mixin

  register('employee_database') { EmployeeDatabase.new }
  register('employee_manager') { EmployeeManager.new(MyContainer['employee_database']) }
end


```

- Aquí registramos dos dependencias: employee_database y employee_manager. Note que employee_manager depende de employee_database.

### Implementación de clases - EmployeeDatabase y EmployeeManager

- EmployeeDatabase es una clase simple que mantiene un hash de empleados.
- EmployeeManager es otra clase que depende de EmployeeDatabase.

```
class EmployeeDatabase
  # ...
end

class EmployeeManager
  def initialize(employee_database)
    @employee_database = employee_database
  end
  # ...
end

```

### Auto-inyección - MyInject

- Creamos un módulo MyInject que nos ayudará a inyectar automáticamente dependencias en nuestras clases.

```
MyInject = Dry::AutoInject(MyContainer)


```


### Clase principal - MyApp

- La clase MyApp incluye el módulo MyInject para inyectar la dependencia de employee_manager automáticamente.

```
class MyApp
  include MyInject['employee_manager']
  # ...
end


```

### Inicialización y ejecución

- Finalmente, creamos una instancia de MyApp y llamamos al método call.

```

app = MyApp.new(employee_manager: MyContainer['employee_manager'])
app.call


```

### Cómo funciona la Inyección de Dependencias

1. MyContainer registra todas las dependencias necesarias.
2. EmployeeManager se configura para recibir una instancia de EmployeeDatabase.
3. MyApp se configura para recibir una instancia de EmployeeManager.
4. Al inicializar MyApp, se resuelven todas las dependencias automáticamente.

## Diferencia con Java

- Ruby:

    1. Herramienta: Dry::Container
    2. Estilo: Fluida, sencilla
    3. Práctica: Registro directo de dependencias
    4. Filosofía: Convención sobre configuración

- Java:

    1. Herramienta: Spring
    2. Estilo: Formal, robusta
    3. Práctica: Anotaciones para inyección
    4. Filosofía: Configuración explícita

- Ambos buscan modularidad y desacoplamiento, pero con enfoques distintos.
