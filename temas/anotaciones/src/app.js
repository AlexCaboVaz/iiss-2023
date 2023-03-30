"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const logger_1 = require("./logger");
function Inject(dependency) {
    return function (target, propertyKey, index) {
        target[propertyKey][index] = new dependency();
    };
}
class App {
    constructor() {
        this.logger = new logger_1.Logger();
    }
    greet() {
        this.logger.log('Hola Mundo!!');
    }
}
const app = new App();
app.greet();
