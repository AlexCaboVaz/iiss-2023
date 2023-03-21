class Persona
    attr_reader :nombre, :edad
    attr_accessor :contraseña
  
    def initialize(nombre, edad, contrasena)
      @nombre = nombre
      @edad = edad
      @contrasena = contrasena
    end
  
    def comprobar(contraseña)
      contraseña == @contrasena
    end
  
    private
  
    def ComprobarID(id)
      # Lógica para verificar la identidad de la personaaa
    end
  
    protected
  
    def dirección
      # Lógica para obtener la dirección de la personaaa
    end
  end
  
  class Empleado < Persona
    def initialize(nombre, edad, contraseña, id)
      super(nombre, edad, contraseña)
      @id = id
    end
  
    def obtenerDireccion
      dirección
    end
  
    def verificarID(id)
      ComprobarID(id)
    end
  end
  
  persona = Persona.new("Juan", 30, "contrasena123")
  empleado = Empleado.new("Pedro", 25, "contrasena456", "ABC123")
  
  puts persona.nombre #=> "Juan"
  puts persona.edad #=> 30
  puts persona.comprobar("contrasena123") #=> true
  
  persona.contraseña = "nuevacontrasena"
  puts persona.comprobar("contrasena123") #=> false
  puts persona.comprobar("nuevacontrasena") #=> true
  
  puts empleado.obtenerDireccion #=> Dirección de la personaa
  puts empleado.verificarID("ABC123") #=> true
  
  