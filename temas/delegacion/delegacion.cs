using System;

public class Coche
{
    public string Marca { get; set; }
    public string Modelo { get; set; }
    public int VelocidadActual { get; set; }

    public Coche(string marca, string modelo)
    {
        Marca = marca;
        Modelo = modelo;
        VelocidadActual = 0;
    }

    public void Acelerar()
    {
        VelocidadActual += 10;
    }

    public void Frenar()
    {
        VelocidadActual -= 10;
    }
}

public delegate void ControladorCoche(Coche coche);

public class Program
{
    public static void Main(string[] args)
    {
        Coche miCoche = new Coche("Toyota", "Corolla");

        ControladorCoche miControlador = AcelerarCoche;

        miControlador += FrenarCoche;

        EjecutarControlador(miControlador, miCoche);

        Console.WriteLine("Velocidad actual del coche: " + miCoche.VelocidadActual);
    }

    public static void EjecutarControlador(ControladorCoche controlador, Coche coche)
    {
        if (controlador != null)
        {
            controlador(coche);
        }
    }

    public static void AcelerarCoche(Coche coche)
    {
        coche.Acelerar();
    }

    public static void FrenarCoche(Coche coche)
    {
        coche.Frenar();
    }
}
