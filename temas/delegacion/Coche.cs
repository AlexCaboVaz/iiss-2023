
// Importar el espacio de nombres System para usar las clases básicas como ArgumentNullException y Math.
using System;

public class Coche
{
    // Definir una constante para el incremento o decremento de velocidad.
    private const int VelocidadIncremento = 15;

    // Propiedad para la Marca del coche, solo de lectura tras la inicialización.
    public string Marca { get; }

    // Propiedad para el Modelo del coche, solo de lectura tras la inicialización.
    public string Modelo { get; }

    // Propiedad para la velocidad actual, pero el setter es privado para un mejor encapsulamiento.
    public int VelocidadActual { get; private set; }

    // Constructor de la clase Coche.
    public Coche(string marca, string modelo)
    {
        // Verificar que los parámetros no sean nulos, lanzar una excepción en caso contrario.
        Marca = marca ?? throw new ArgumentNullException(nameof(marca));
        Modelo = modelo ?? throw new ArgumentNullException(nameof(modelo));

        // Inicializar la velocidad a 0.
        VelocidadActual = 0;
    }

    // Método para acelerar el coche.
    public void Acelerar(int cantidad = VelocidadIncremento)
    {
        // Incrementar la velocidad actual por la cantidad especificada.
        VelocidadActual += cantidad;
    }

    // Método para frenar el coche.
    public void Frenar(int cantidad = VelocidadIncremento)
    {
        // Asegurar que la velocidad no sea negativa.
        VelocidadActual = Math.Max(0, VelocidadActual - cantidad);
    }
}