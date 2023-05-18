import time

def timing_aspect(func):
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        execution_time = end_time - start_time
        print("Tiempo de ejecución: {:.2f} segundos".format(execution_time))
        return result
    return wrapper

def division_aspect(func):
    def wrapper(*args, **kwargs):
        try:
            result = func(*args, **kwargs)
            print("Resultado de la división:", result)
            return result
        except ZeroDivisionError:
            print("¡Error: División por cero!")
    return wrapper

class Calculator:
    @timing_aspect
    def add(self, a, b):
        return a + b

    @timing_aspect
    @division_aspect
    def divide(self, a, b):
        return a / b

calc = Calculator()

result = calc.add(4564, 65465)
print("Resultado de la suma:", result)

calc.divide(564654, 2)
calc.divide(5, 0)
