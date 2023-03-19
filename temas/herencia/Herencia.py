class Animal:
    def __init__(self, nombre, especie):
        self.nombre = nombre
        self.especie = especie

    def sonar(self):
        print("¡Hago un sonido!")

class Perro(Animal):
    def __init__(self, nombre, raza):
        super().__init__(nombre, "Canino")
        self.raza = raza

    def sonar(self):
        print("Guau")

mi_perro = Perro("Fido", "Labrador")
print(mi_perro.nombre) # imprime "Fido"
print(mi_perro.especie) # imprime "Canino"
mi_perro.sonar() # imprime "Guau"

