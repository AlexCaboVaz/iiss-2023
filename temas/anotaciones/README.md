# Anotación en Typescript

## ¿Que es la anotacion?

* La anotación es una técnica de programación que permite inyectar objetos dependientes en una clase sin tener que crearlos explícitamente en la clase que los necesita. Esto se logra utilizando una anotación que describe qué dependencias requiere una clase, y un contenedor de inyección de dependencias que se encarga de crear e inyectar las dependencias cuando se crea la instancia de la clase. En resumen, la anotación de dependencias ayuda a separar la lógica de la creación de objetos y la lógica de negocio en una aplicación.

## Ejemplo: 

* Este archivo contiene una aplicación de ejemplo que utiliza decoradores en TypeScript para inyectar dependencias en una clase. La aplicación se compone de una clase App y una clase Logger.

* La clase Logger es una simple clase que tiene un método log() que toma una cadena y la imprime en la consola.

~~~
export class Logger {
  log(message: string) {
    console.log(message);
  }
}
~~~


* En primer lugar, se define un tipo genérico ClassType<T> que representa una clase con un constructor que puede tomar cualquier número de argumentos. Este tipo se utiliza más adelante en el decorador Inject.

~~~
type ClassType<T> = { new (...args: any[]): T };
~~~


* En este ejemplo, creamos una instancia de la clase Logger y la pasamos como argumento al constructor de la clase App. Luego, llamamos al método greet de la clase App, que a su vez llama al método log de la instancia de Logger que inyectamos previamente

~~~
import { Logger } from "./logger";

class App {
  logger: Logger;
  constructor(logger: Logger) {
    this.logger = logger;
  }

  greet() {
    this.logger.log('Hola Mundo!!');
  }
}

const logger = new Logger();
const app = new App(logger);
app.greet(); // Output: "Hola Mundo!!"
~~~


* Se utilizan dos decoradores para inyectar dependencias en la clase App. El primer decorador, InjectLogger, se encarga de inyectar una instancia de Logger en el constructor de la clase App. El segundo decorador, InjectMessage, se encarga de inyectar un mensaje en el método greet()

* Para inyectar la instancia de Logger utilizando decoradores, podemos utilizar el decorador @InjectLogger de la siguiente manera:

~~~
function InjectLogger(target: any, propertyKey: string, index: number) {
  target[propertyKey][index] = new Logger();
}

class App {
  logger: Logger;
  constructor(@InjectLogger logger: Logger) {
    this.logger = logger;
  }

  greet() {
    this.logger.log('Hola Mundo!!');
  }
}

const app = new App();
app.greet(); // Output: "Hola Mundo!!"

~~~

* En este caso, el decorador @InjectLogger se aplica a un parámetro del constructor de la clase App. El decorador reemplaza el valor del parámetro con una nueva instancia de Logger.

* También podemos inyectar un mensaje personalizado en el método greet utilizando el decorador @InjectMessage de la siguiente manera:

~~~
function InjectMessage(message: string) {
  return function (target: any, propertyKey: string, descriptor: PropertyDescriptor) {
    const originalMethod = descriptor.value;
    descriptor.value = function (...args: any[]) {
      console.log(message);
      return originalMethod.apply(this, args);
    };
    return descriptor;
  };
}

class App {
  logger: Logger;
  constructor(logger: Logger) {
    this.logger = logger;
  }

  @InjectMessage('Hola Mundo!!')
  greet() {
    this.logger.log('Logging from Logger instance injected by decorator!');
  }
}

const logger = new Logger();
const app = new App(logger);
app.greet(); // Output: "Hola Mundo!!", "Logging from Logger instance injected by decorator!"
~~~

* En este caso, el decorador @InjectMessage se aplica al método greet de la clase App. El decorador modifica el comportamiento del método, imprimiendo el mensaje personalizado antes de llamar al método original.

* En este código hemos usado anotaciones para inyectar una dependencia (la clase Logger) y decorar un método (greet()) en la clase App. Al crear una instancia de la clase App, la anotación InjectLogger crea una instancia de Logger y la asigna a la propiedad correspondiente en la instancia de App. La anotación InjectMessage decora el método greet() para que imprima un mensaje personalizado antes de ejecutar el método original. De esta forma, las anotaciones nos permiten inyectar dependencias y decorar métodos de forma fácil y legible.

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