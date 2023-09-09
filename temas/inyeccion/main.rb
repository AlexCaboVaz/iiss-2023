require 'dry-container'
require 'dry-auto_inject'

# Configure the Container
class MyContainer
  extend Dry::Container::Mixin

  register('employee_database') { EmployeeDatabase.new }
  register('employee_manager') { EmployeeManager.new(MyContainer['employee_database']) }
end

# Configure Auto-Inject
MyInject = Dry::AutoInject(MyContainer)

# EmployeeDatabase Class
class EmployeeDatabase
  def initialize
    @data = {}
  end

  def add_employee(id, name)
    @data[id] = name
  end

  def get_employee(id)
    @data[id]
  end
end

# EmployeeManager Class
class EmployeeManager
  def initialize(employee_database)
    @employee_database = employee_database
  end

  def register_employee(id, name)
    @employee_database.add_employee(id, name)
  end

  def find_employee(id)
    @employee_database.get_employee(id)
  end
end

# App Class
class MyApp
  include MyInject['employee_manager']

  def call
    employee_manager.register_employee(1, 'Alice')
    employee_manager.register_employee(2, 'Bob')

    puts employee_manager.find_employee(1)
    puts employee_manager.find_employee(2)
  end
end

# Initialize the App
app = MyApp.new(employee_manager: MyContainer['employee_manager'])
app.call
