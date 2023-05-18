# LAMBDAS

## Explicación del código:

El código proporcionado consta de dos clases: Car y CarManager. La clase Car representa un objeto de coche con diferentes atributos, como marca, modelo, año, color y precio. La clase CarManager se encarga de gestionar una lista de coches y proporciona métodos para filtrar y mostrar los coches.

Se crean cinco instancias de la clase Car con diferentes atributos y se almacenan en una lista llamada cars. Luego, se crea una instancia de CarManager llamada car_manager pasándole la lista de coches.

A continuación, se utilizan los métodos de CarManager para filtrar y mostrar los coches:

- filter_by_year: Este método recibe un año como argumento y utiliza una lambda para filtrar los coches que tienen el mismo año que el proporcionado. La lambda se pasa como argumento a @cars.select, que devuelve una nueva lista con los coches que cumplen el criterio de filtrado.

- filter_by_price: Este método recibe un precio como argumento y utiliza un bloque de código (objeto Proc) para filtrar los coches que tienen un precio mayor que el proporcionado. Al igual que en el método anterior, el bloque se pasa como argumento a @cars.select.

- print_cars: Este método recibe una lista de coches y un título, e imprime los coches que se pasaron como argumento. Si la lista está vacía, se muestra un mensaje indicando que no se encontraron coches que cumplan con los criterios de búsqueda.

## Lambdas en Ruby:

En Ruby, una lambda es una función anónima que se puede asignar a una variable y pasar como argumento a otros métodos. En este código, se utilizan lambdas para definir los criterios de filtrado personalizados. Se crean lambdas utilizando la sintaxis lambda { |parámetros| bloque de código }.

Por ejemplo, en el método filter_by_year, se crea la lambda filter_by_year_lambda que verifica si el año del coche es igual al año proporcionado. La lambda se pasa como argumento al método filter_by_criteria, donde se utiliza en la llamada a @cars.select.

## Clausuras en Ruby:

En Ruby, una clausura es un bloque de código que puede capturar y retener el entorno en el que se define. Esto significa que puede acceder a variables locales y métodos definidos en su contexto de creación, incluso si se ejecuta en un contexto diferente. Las clausuras se pueden crear utilizando lambdas o bloques de código.

En el código proporcionado, se utiliza una clausura a través de un bloque de código (Proc) en el método filter_by_price. Se define el bloque filter_by_price_block, que verifica si el precio del coche es mayor que el precio proporcionado. El bloque se pasa como argumento a @cars.select en la llamada a filter_by_criteria.

## Bloques de código en Ruby:

En Ruby, un bloque de código es una pieza de código que se puede pasar a un método como argumento. Los bloques de código se definen utilizando las palabras clave do y end o {}. Pueden contener múltiples líneas de código y se utilizan comúnmente en iteraciones y métodos que aceptan bloques.

En el código proporcionado, se utilizan bloques de código en el método print_cars. El bloque de código se pasa como argumento a cars.each, y se ejecuta para cada coche en la lista. El bloque de código imprime cada coche utilizando puts.


## Conclusion 
En resumen, en el código proporcionado se utilizan lambdas para definir criterios de filtrado personalizados en CarManager, bloques de código (objetos Proc) para filtrar los coches y clausuras para retener el entorno en el que se definen los bloques. Estos conceptos en Ruby permiten crear código más expresivo y flexible, facilitando la manipulación y procesamiento de datos de manera eficiente.