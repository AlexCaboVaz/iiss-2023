class Perro:
    def __init__(self, nombre):
        self.nombre = nombre

    def ladrar(self):
        return "Guau!"

class Persona:
    def __init__(self, nombre, mascota):
        self.nombre = nombre
        self.mascota = mascota

    def presentar_mascota(self):
        return f"Mi nombre es {self.nombre} y esta es mi mascota {self.mascota.nombre}. Dice {self.mascota.ladrar()}"

# Creamos una instancia de la clase Perro
mi_perro = Perro("Fido")

# Creamos una instancia de la clase Persona, pasando el perro como parámetro
yo = Persona("Juan", mi_perro)

# Llamamos al método presentar_mascota de la clase Persona, que utiliza la función ladrar del perro
print(yo.presentar_mascota())
