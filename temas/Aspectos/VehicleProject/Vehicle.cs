// Implementación concreta de un vehículo
using System;
using VehicleProject.Aspects;

namespace VehicleProject.Models
{
    public class Vehicle : IVehicle
    {
        public string Brand { get; set; } = "Generic"; // Marca del vehículo
        public string Model { get; set; } = "Vehicle"; // Modelo del vehículo
        private int fuel = 100;  // Variable privada para almacenar combustible

        public int Fuel => fuel; // Propiedad de solo lectura para el combustible

        [EnsureFuelAspect] // Aspecto para comprobar combustible
        public void Move()
        {
            fuel -= 10;
            Console.WriteLine($"{Brand} {Model} está moviéndose. Combustible restante: {Fuel}.");
        }

        [LogAttribute] // Aspecto para registrar el método
        public void Stop()
        {
            Console.WriteLine($"{Brand} {Model} ha detenido.");
        }

        [LogAttribute] // Aspecto para registrar el método
        public void Turn()
        {
            Console.WriteLine($"{Brand} {Model} está girando.");
        }

        public void Refuel(int amount)
        {
            // Validación de entrada
            if (amount <= 0) 
            {
                Console.WriteLine("La cantidad de combustible debe ser mayor que cero.");
                return;
            }
            fuel += amount;
            Console.WriteLine($"{Brand} {Model} ha sido reabastecido. Combustible actual: {Fuel}.");
        }
    }
}