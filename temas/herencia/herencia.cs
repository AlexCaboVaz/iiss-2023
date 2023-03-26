using System;

// Definimos una interface "IVehiculo"
interface IVehiculo
{
    string Marca { get; set; }
    string Modelo { get; set; }
    int Año { get; set; }

    void Arrancar();
}

// Definimos una interface "IAerodinamico"
interface IAerodinamico
{
    double CoeficienteAerodinamico { get; set; }

    void CalcularCoeficienteAerodinamico();
}

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

// Definimos una clase que hereda de Vehiculo e implementa IAerodinamico
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
    public void Acelerar()
    {
        Console.WriteLine("El automóvil está acelerando");
    }
}

// Programa principal
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
