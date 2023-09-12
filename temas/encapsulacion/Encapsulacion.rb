class Persona
  attr_reader :nombre, :edad
  attr_accessor :contraseña

  def initialize(nombre, edad, contrasena)
    @nombre = nombre
    @edad = edad
    @contraseña = contrasena
  end

  # Comprueba si la contraseña dada es correcta
  def comprobar(contraseña)
    contraseña == @contraseña
  end

  private

  # Lógica para verificar la identidad de la persona
  def comprobar_id(id)
    # Implementación
  end

  protected

  # Lógica para obtener la dirección de la persona
  def direccion
    # Implementación
  end
end

class Empleado < Persona
  def initialize(nombre, edad, contraseña, id)
    super(nombre, edad, contraseña)
    @id = id
  end

  # Obtener la dirección de la persona
  def obtener_direccion
    direccion
  end

  # Verifica el ID del empleado
  def verificar_id(id)
    comprobar_id(id)
  end
end

# Ejemplo de uso
persona = Persona.new("Juan", 30, "contrasena123")
empleado = Empleado.new("Pedro", 25, "contrasena456", "ABC123")

puts persona.nombre  # "Juan"
puts persona.edad    # 30
puts persona.comprobar("contrasena123")  # true

# Cambio de contraseña
persona.contraseña = "nuevacontrasena"
puts persona.comprobar("contrasena123")  # false
puts persona.comprobar("nuevacontrasena")  # true
