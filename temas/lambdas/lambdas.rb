class Car
  attr_reader :make, :model, :year, :color, :price

  def initialize(make, model, year, color, price)
    @make = make
    @model = model
    @year = year
    @color = color
    @price = price
  end

  def to_s
    "#{@make} #{@model} (#{@year})"
  end

  def inspect
    "#<Car:0x#{object_id.to_s(16)} make=#{@make}, model=#{@model}, year=#{@year}, color=#{@color}, price=#{@price}>"
  end
end

class CarManager
  def initialize(cars)
    @cars = cars
  end

  def filter_by_criteria(criteria)
    @cars.select(&criteria)
  end

  def print_cars(cars, title)
    puts "#{title}:"
    if cars.empty?
      puts "No se encontraron coches que cumplan con los criterios de búsqueda."
    else
      cars.each { |car| puts car }
    end
    puts
  end
end

car1 = Car.new("Honda", "Civic", 2022, "Blue", 22000)
car2 = Car.new("Nissan", "Sentra", 2022, "Silver", 19000)
car3 = Car.new("Ford", "Mustang", 2020, "Yellow", 30000)
car4 = Car.new("Chevrolet", "Camaro", 2021, "Black", 32000)
car5 = Car.new("Toyota", "Corolla", 2019, "Red", 15000)

cars = [car1, car2, car3, car4, car5]

car_manager = CarManager.new(cars)

# Ejemplo 1: Filtrar coches usando una lambda
filter_by_year_lambda = lambda { |car| car.year == 2022 }
cars_2022 = car_manager.filter_by_criteria(filter_by_year_lambda)
car_manager.print_cars(cars_2022, "Coches del 2022")

# Ejemplo 2: Filtrar coches usando un bloque de código
filter_by_price_block = proc { |car| car.price > 20000 }
expensive_cars = car_manager.filter_by_criteria(filter_by_price_block)
car_manager.print_cars(expensive_cars, "Coches que cuestan más de 20000")

# Ejemplo 3: Filtrar coches usando una clausura
def create_filter_by_color_closure(color)
  lambda { |car| car.color == color }
end

filter_by_color_closure = create_filter_by_color_closure("Blue")
blue_cars = car_manager.filter_by_criteria(filter_by_color_closure)
car_manager.print_cars(blue_cars, "Coches de color azul")
