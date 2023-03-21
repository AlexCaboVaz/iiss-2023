
class Coche:
    def __init__(self, marca, modelo, año, color):
        self.marca = marca
        self.modelo = modelo
        self.año = año
        self.color = color

    def encender(self):
        print("Encendiendo el coche")

    def apagar(self):
        print("Apagando el coche")

class Sedan(Coche):
    def __init__(self, marca, modelo, año, color, num_puertas):
        super().__init__(marca, modelo, año, color)
        self.num_puertas = num_puertas

    def abrirMaletero(self):
        print("Abriendo el maletero")

class SUV(Coche):
    def __init__(self, marca, modelo, año, color, num_asientos):
        super().__init__(marca, modelo, año, color)
        self.num_asientos = num_asientos

    def abrirCarga(self):
        print("Abriendo el área de carga")

coche = Coche("Honda", "Accord", 2021, "rojo")
coche.encender()
coche.apagar()

sedan = Sedan("Toyota", "Camry", 2022, "azul", 4)
sedan.encender()
sedan.apagar()
sedan.abrirMaletero()

suv = SUV("Ford", "Explorer", 2023, "blanco", 7)
suv.encender()
suv.apagar()
suv.abrirCarga()
