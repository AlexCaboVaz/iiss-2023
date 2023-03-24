# HERENCIA EN C#

## Herencia
* La herencia y los traits son dos características importantes de la programación orientada a objetos (POO) que se utilizan comúnmente en C# para crear clases más específicas y reutilizar código común en diferentes clases. En este archivo README.md, se explicará cómo se utiliza la herencia y los traits en un ejemplo simple en C#

## Aplicacion de la herencia en el codigo.
* La herencia en C# se logra utilizando la palabra clave "extends". Una clase derivada puede heredar todas las propiedades y métodos públicos de su clase base. En este ejemplo, definiremos una clase base "Vehiculo" que tiene algunas propiedades y métodos comunes a todos los vehículos. Luego crearemos una clase derivada "Automovil" que hereda de "Vehiculo" utilizando la palabra clave "extends" y agrega algunas propiedades y métodos adicionales específicos de los automóviles.

~~~
// Definimos una clase base "Vehiculo"
class Vehiculo
{
    public string Marca { get; set; }
    public string Modelo { get; set; }
    public int Año { get; set; }

    public void Arrancar()
    {
        Console.WriteLine("El vehículo ha arrancado");
    }
}

// Definimos una clase derivada "Automovil" que hereda de "Vehiculo"
class Automovil : Vehiculo
{
    public int Cilindrada { get; set; }

    public void Acelerar()
    {
        Console.WriteLine("El automóvil está acelerando");
    }
}
~~~

* En este ejemplo, la clase "Vehiculo" es la clase base, y la clase "Automovil" hereda de ella utilizando la palabra clave "extends". La clase "Automovil" también agrega una propiedad adicional "Cilindrada" y un método adicional "Acelerar" que son específicos de los automóviles.

## Como se usan los traits en este ejemplo:
* Los traits en C# se implementan utilizando la palabra clave "interface". Un trait define una interfaz común que implementan varias clases. En este ejemplo, definiremos un trait "IAerodinamico" para definir una interfaz común que implementan todos los vehículos aerodinámicos. La clase "Automovil" implementará este trait utilizando la palabra clave "interface" y proporcionará una implementación para el método "CalcularCoeficienteAerodinamico", que es definido por el trait

~~~
// Definimos un trait "IAerodinamico"
interface IAerodinamico
{
    double CoeficienteAerodinamico { get; set; }

    void CalcularCoeficienteAerodinamico();
}

// La clase "Automovil" implementa el trait "IAerodinamico"
class Automovil : Vehiculo, IAerodinamico
{
    public int Cilindrada { get; set; }
    public double CoeficienteAerodinamico { get; set; }

    public void Acelerar()
    {
        Console.WriteLine("El automóvil está acelerando");
    }

    public void CalcularCoeficienteAerodinamico()
    {
        // Aquí se calcularía el coeficiente aerodinámico
~~~