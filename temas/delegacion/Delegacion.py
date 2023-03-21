class Motor:
    def encender(self):
        print("El motor está encendido.")
        
    def apagar(self):
        print("El motor está apagado.")
        
class Coche:
    def __init__(self, motor):
        self.motor = motor
        
    def encender(self):
        self.motor.encender()
        
    def apagar(self):
        self.motor.apagar()

motor = Motor()
coche = Coche(motor)

coche.encender() # Output: El motor está encendido.
coche.apagar() # Output: El motor está apagado.
