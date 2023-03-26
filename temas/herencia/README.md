# HERENCIA EN C#

## Resumen del Código
* Este código implementa un ejemplo básico de programación orientada a objetos en C#. Contiene la definición de varias interfaces y clases que se relacionan mediante herencia y composición.

## Clase Vehiculo
* La clase Vehiculo es una clase base abstracta que implementa la interfaz IVehiculo. Contiene tres propiedades públicas Marca, Modelo y Año que representan la marca, modelo y año del vehículo respectivamente. También tiene un método virtual Arrancar() que imprime en consola el mensaje "El vehículo ha arrancado". Esta clase se utiliza como base para la definición de la clase Automovil.

~~~
// Definimos una clase base "Vehiculo" que implementa "IVehiculo"
class Vehiculo : IVehiculo
{
    public string Marca { get; set; }
    public string Modelo { get; set; }
    public int Año { get; set; }

    public virtual void Arrancar()
    {
        Console.WriteLine("El vehiculo ha arrancado");
    }
}
~~~
## Interfaz IVehiculo
* La interfaz IVehiculo define tres propiedades Marca, Modelo y Año, y un método Arrancar(). Esta interfaz se implementa en la clase Vehiculo.

~~~
// Definimos una interface "IVehiculo"
interface IVehiculo
{
    string Marca { get; set; }
    string Modelo { get; set; }
    int Año { get; set; }

    void Arrancar();
}
~~~

## Interfaz IAerodinamico
* La interfaz IAerodinamico define una propiedad CoeficienteAerodinamico y un método CalcularCoeficienteAerodinamico(). Esta interfaz se implementa en la clase Automovil.

~~~
// Definimos una interface "IAerodinamico"
interface IAerodinamico
{
    double CoeficienteAerodinamico { get; set; }

    void CalcularCoeficienteAerodinamico();
}
~~~

## Clase 'Automovil'
* La clase Automovil hereda de la clase base Vehiculo e implementa la interfaz IAerodinamico. Además, define un nuevo método Acelerar(). Sobrescribe el método virtual Arrancar() de la clase base y agrega una funcionalidad adicional.

~~~
class Automovil : Vehiculo, IAerodinamico
{
    public double CoeficienteAerodinamico { get; set; }

    public void CalcularCoeficienteAerodinamico()
    {
        // Aquí se calcularía el coeficiente aerodinámico del automóvil
        Console.WriteLine("Se ha calculado el coeficiente aerodinámico del automóvil");
    }

    public override void Arrancar()
    {
        // Llamamos al método Arrancar de la clase base
        base.Arrancar();

        // Agregamos nuestra propia funcionalidad
        Console.WriteLine("El automóvil ha arrancado");
    }

    // Definimos un nuevo método llamado "Acelerar"
    public new void Acelerar()
    {
        Console.WriteLine("El automóvil está acelerando");
    }
}

~~~

* En esta clase se definen dos propiedades y dos métodos. La propiedad CoeficienteAerodinamico es de tipo double y representa el coeficiente aerodinámico del automóvil. El método CalcularCoeficienteAerodinamico() se encarga de calcular el coeficiente aerodinámico del automóvil.

* El método Arrancar() se sobrescribe para agregar una funcionalidad adicional, que es mostrar un mensaje de que el automóvil ha arrancado.

* El método Acelerar() es un nuevo método que no está presente en la clase base Vehiculo. Este método simplemente muestra un mensaje indicando que el automóvil está acelerando.

## Programa principal
* En el programa principal se crea una instancia de la clase Automovil y se establecen sus propiedades. Luego se llama a los métodos CalcularCoeficienteAerodinamico(), Arrancar() y Acelerar() de la instancia de la clase Automovil.

~~~
class Program
{
    static void Main(string[] args)
    {
        Automovil miAuto = new Automovil();
        miAuto.Marca = "Toyota";
        miAuto.Modelo = "Corolla";
        miAuto.Año = 2022;
        miAuto.CalcularCoeficienteAerodinamico();
        miAuto.Arrancar();
        miAuto.Acelerar();
    }
}
~~~

* El resultado de ejecutar este programa sería el siguiente:

~~~
Se ha calculado el coeficiente aerodinámico del automóvil
El vehiculo ha arrancado
El automóvil ha arrancado
El automóvil está acelerando
~~~