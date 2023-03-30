//app.ts
import { Logger } from "./logger";

type ClassType<T> = { new (...args: any[]): T };

function InjectLogger(target: any, propertyKey: string, index: number) {
  target[propertyKey][index] = new Logger();
}

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
  constructor(@InjectLogger logger: Logger) {
    this.logger = logger;
  }

  @InjectMessage('Hola Mundo!!')
  greet() {
    this.logger.log('¡Registro desde la instancia de Logger!');
  }
}

const logger = new Logger();
const app = new App(logger);
app.greet();
