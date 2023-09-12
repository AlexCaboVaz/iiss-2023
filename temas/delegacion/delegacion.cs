

// Importa el espacio de nombres System para acceder a las clases básicas de C#
using System;

// Define la clase Coche con sus propiedades y métodos
public class Coche
{
    // Constante para definir el incremento/decremento de velocidad
    private const int VelocidadIncremento = 15;

    // Propiedades de la clase Coche
    public string Marca { get; set; }
    public string Modelo { get; set; }
    
    // Hacer que el setter de VelocidadActual sea privado para un mejor encapsulamiento
    public int VelocidadActual { get; private set; }

    // Constructor de la clase Coche
    public Coche(string marca, string modelo)
    {
        Marca = marca;
        Modelo = modelo;
        VelocidadActual = 0;
    }

    // Método para acelerar el coche
    public void Acelerar()
    {
        VelocidadActual += VelocidadIncremento;  // Utiliza la constante definida
    }

    // Método para frenar el coche
    public void Frenar()
    {
        // Asegura que la velocidad no sea negativa
        VelocidadActual = Math.Max(0, VelocidadActual - VelocidadIncremento);  
    }
}

// Define la clase Program que contiene el método Main
public class Program
{
    // Método Main que se ejecuta al iniciar el programa
    public static void Main(string[] args)
    {
        // Crea un nuevo objeto de la clase Coche
        Coche miCoche = new Coche("Toyota", "Corolla");

        // Utiliza el tipo Action<T> en lugar de un delegado personalizado para simplificar
        Action<Coche> miControlador = (coche) => 
        {
            // Acelera y luego frena el coche
            coche.Acelerar();  
            coche.Frenar();  
        };

        // Verifica si miControlador es nulo antes de invocarlo
        miControlador?.Invoke(miCoche);  

        // Imprime la velocidad actual del coche en la consola
        Console.WriteLine("Velocidad actual del coche: " + miCoche.VelocidadActual);  
    }
}
