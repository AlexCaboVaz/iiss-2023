# Codigo creado por Alejandro Cabo


class Persona
    attr_accessor :nombre, :edad
    
    def initialize(nombre, edad)
      @nombre = nombre
      @edad = edad
    end
    
    def presentarse
      puts "Hola, mi nombre es #{@nombre} y tengo #{@edad} años."
    end
    
    private
    
    def CumplirAnios
      @edad += 1
    end
  end
  
  persona = Persona.new("Juan", 30)
  persona.presentarse # Al ejecutarlo, mostrara por pantalla la edad, y el nombre.
 
  persona.CumplirAnios # Dara error, al ser un metodo privado.
  
 