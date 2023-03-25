# Anotacion de dependencias en Typescript

## ¿Que es la anotacion de dependecias?

* La anotación de dependencias es una técnica de programación que permite inyectar objetos dependientes en una clase sin tener que crearlos explícitamente en la clase que los necesita. Esto se logra utilizando una anotación que describe qué dependencias requiere una clase, y un contenedor de inyección de dependencias que se encarga de crear e inyectar las dependencias cuando se crea la instancia de la clase. En resumen, la anotación de dependencias ayuda a separar la lógica de la creación de objetos y la lógica de negocio en una aplicación.

## Ejemplo: 

* En este ejemplo, se muestra cómo se puede implementar la anotación de dependencias en TypeScript utilizando decoradores y tipos genéricos.

* En primer lugar, se define un tipo genérico ClassType<T> que representa una clase con un constructor que puede tomar cualquier número de argumentos. Este tipo se utiliza más adelante en el decorador Inject.

~~~
type ClassType<T> = { new (...args: any[]): T };
~~~

* Luego se define el decorador Inject, que toma como argumento la clase que se va a inyectar como dependencia. Este decorador devuelve otra función que toma tres argumentos: el objeto que contiene la propiedad que se va a inyectar, el nombre de la propiedad y el índice del argumento en el constructor de la clase.

~~~
function Inject<T>(dependency: ClassType<T>) {
  return function (target: any, propertyKey: string, index: number) {
    target[propertyKey][index] = new dependency();
  };
}
~~~

* En el constructor de la clase App, se declara una propiedad logger de tipo Logger. Esta propiedad se inicializa en el constructor de la clase mediante la creación de una nueva instancia de la clase Logger.

~~~
class App {
  logger: Logger;
  constructor() {
    this.logger = new Logger();
  }
  
  greet() {
    this.logger.log('Hola Mundo!!');
  }
}
~~~

* En lugar de inicializar la propiedad logger directamente en el constructor, se puede utilizar el decorador Inject para inyectar la dependencia en la propiedad. Para ello, se debe decorar la propiedad logger con @Inject(Logger) y se debe eliminar la inicialización en el constructor.

~~~
class App {
  @Inject(Logger)
  logger: Logger;
  
  greet() {
    this.logger.log('Hola Mundo!!');
  }
}
~~~

* Finalmente, se crea una instancia de la clase App y se llama al método greet.

~~~
const app = new App();
app.greet();
~~~

* Este ejemplo muestra cómo se puede utilizar la anotación de dependencias en TypeScript para mejorar la modularidad y la flexibilidad del código. Con esta técnica, se pueden inyectar dependencias en las clases y hacer que el código sea más fácil de probar y mantener.


## Para ejecutar este código, es necesario tener instalado Node.js en el equipo.

1. Abre un editor de código como Visual Studio Code.
2. Crea un nuevo archivo y pega el código proporcionado en el archivo.
3. Guarda el archivo con el nombre app.ts en una carpeta llamada src.
4. Crea una nueva carpeta llamada dist.
5. En la terminal, navega a la carpeta raíz del proyecto y ejecuta el siguiente comando para instalar las dependencias:

~~~
npm install typescript --save-dev
~~~

6. A continuación, ejecuta el siguiente comando para compilar el archivo TypeScript en JavaScript

~~~
npx tsc --outDir dist src/app.ts
~~~

7. Por último, ejecuta el siguiente comando para ejecutar el archivo JavaScript generado:

~~~
node dist/app.js
~~~

8. Verás que la consola muestra el mensaje "Hola Mundo!!", lo que indica que el código se ha ejecutado correctamente.