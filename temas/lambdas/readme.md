# Uso de lambdas en el código de coches en Ruby
## Introducción
Las lambdas son funciones anónimas en Ruby que se pueden pasar como argumentos a otras funciones. Son útiles cuando necesitamos una función temporal que no queremos definir de forma explícita en el código. En el caso del código de coches, se pueden utilizar lambdas para definir funciones de filtrado y simplificar la lógica del programa.

## Ejemplo
En el código de coches, se pueden utilizar lambdas para definir las funciones de filtrado de coches por año y precio. En lugar de utilizar condiciones if dentro de cada método, podemos pasar una lambda como argumento para realizar el filtrado. A continuación, se muestra cómo se puede hacer esto:

```
class CarManager
  def initialize(cars)
    @cars = cars
  end

  def filter_by_year(year)
    @cars.select { |car| lambda { |c| c.year == year }.call(car) }
  end

  def filter_by_price(price)
    @cars.select { |car| lambda { |c| c.price > price }.call(car) }
  end
end
```

En este ejemplo, utilizamos lambda para crear funciones de filtrado que comprueban si el año o el precio de un coche cumplen con un criterio específico. Luego, pasamos estas lambdas como argumentos a la función select para filtrar la lista de coches. Cada lambda se define en el momento de la llamada a select, por lo que no es necesario definir funciones adicionales en el código.

## Conclusión

Las lambdas son una forma útil de definir funciones anónimas en Ruby. Se pueden utilizar para simplificar la lógica del código y evitar la repetición de código. En el caso del código de coches, se pueden utilizar lambdas para definir funciones de filtrado y hacer que el código sea más legible y fácil de mantener.