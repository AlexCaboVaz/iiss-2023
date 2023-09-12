// Importar el espacio de nombres System para usar la clase Action y Console.
using System;

public class Program
{
    // Punto de entrada principal del programa.
    public static void Main(string[] args)
    {
        // Crear un nuevo objeto Coche.
        Coche miCoche = new Coche("Toyota", "Corolla");

        // Crear un delegado Action para manipular el coche.
        Action<Coche> miControlador = (coche) => 
        {
            // Acelerar el coche.
            coche.Acelerar();

            // Frenar el coche.
            coche.Frenar();
        };

        // Invocar el delegado (no es necesario comprobar si es nulo).
        miControlador.Invoke(miCoche);

        // Imprimir la velocidad actual en la consola.
        Console.WriteLine($"Velocidad actual del coche: {miCoche.VelocidadActual}");
    }
}