class Coche
    attr_reader :marca, :modelo, :disponible
  
    def initialize(marca, modelo, disponible = true)
      @marca = marca
      @modelo = modelo
      @disponible = disponible
    end
  
    def disponible?
      @disponible
    end
  
    def reservar!
      @disponible = false
    end
  end
  
  class RepositorioDeCoches
    def initialize
      @coches = []
    end
  
    def añadir_coche(coche)
      @coches << coche
    end
  
    def todos_los_coches
      @coches
    end
  end
  
  class GestorDeFlota
    def initialize(repositorio_de_coches)
      @repositorio_de_coches = repositorio_de_coches
    end
  
    def coches_disponibles
      todos_los_coches = @repositorio_de_coches.todos_los_coches
      todos_los_coches.select { |coche| coche.disponible? }
    end
  
    def reservar_coche(coche)
      if coche.disponible?
        coche.reservar!
        true
      else
        false
      end
    end
  end
  
  coche1 = Coche.new("Ford", "Fiesta")
  coche2 = Coche.new("Renault", "Clio")
  coche3 = Coche.new("Volkswagen", "Golf")
  
  repositorio = RepositorioDeCoches.new
  repositorio.añadir_coche(coche1)
  repositorio.añadir_coche(coche2)
  repositorio.añadir_coche(coche3)
  
  gestor = GestorDeFlota.new(repositorio)
  puts gestor.coches_disponibles.inspect
  
  gestor.reservar_coche(coche1)
  puts gestor.coches_disponibles.inspect
  