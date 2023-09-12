# Requerimos las gemas que vamos a utilizar
require 'dry-container'
require 'dry-auto_inject'

# Configuramos el contenedor de la aplicación
class MyContainer
  extend Dry::Container::Mixin

  # Registramos el servicio para la base de datos de empleados
  register('employee_database') { EmployeeDatabase.new }
  
  # Registramos el servicio para el administrador de empleados
  register('employee_manager') { EmployeeManager.new(MyContainer['employee_database']) }
end

# Configuramos la inyección automática de dependencias
MyInject = Dry::AutoInject(MyContainer)

# Clase que representa la "base de datos" de empleados
class EmployeeDatabase
  # Inicializamos un hash para almacenar los datos
  def initialize
    @data = {}
  end

  # Añadimos un empleado a la base de datos
  def add_employee(id, name)
    @data[id] = name
  end

  # Obtenemos un empleado de la base de datos
  def get_employee(id)
    @data[id]
  end
end

# Clase que administra empleados
class EmployeeManager
  # Inyectamos la dependencia de la base de datos de empleados
  def initialize(employee_database)
    @employee_database = employee_database
  end

  # Registramos un empleado usando la base de datos de empleados
  def register_employee(id, name)
    @employee_database.add_employee(id, name)
  end

  # Buscamos un empleado usando la base de datos de empleados
  def find_employee(id)
    @employee_database.get_employee(id)
  end
end

# Clase principal de la aplicación
class MyApp
  # Inyectamos la dependencia del administrador de empleados
  include MyInject['employee_manager']

  # Método principal de la aplicación
  def call
    # Registramos algunos empleados
    employee_manager.register_employee(1, 'Alice')
    employee_manager.register_employee(2, 'Bob')

    # Buscamos y mostramos algunos empleados
    puts employee_manager.find_employee(1)
    puts employee_manager.find_employee(2)
  end
end

# Inicializamos y ejecutamos la aplicación
app = MyApp.new(employee_manager: MyContainer['employee_manager'])
app.call
