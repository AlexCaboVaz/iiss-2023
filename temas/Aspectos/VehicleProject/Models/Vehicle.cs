using System;
using VehicleProject;
using PostSharp.Aspects;
using VehicleProject.Aspectos;

namespace VehicleProject.Models
{
    public class Vehicle
    {
        public string Brand { get; set; } = "Generic";
        public string Model { get; set; } = "Vehicle";
        public int Fuel { get; set; } = 100;

        [EnsureFuelAspect]
        public void Move()
        {
            Fuel -= 10; // Consumir combustible.
            Console.WriteLine($"{Brand} {Model} está moviéndose. Combustible restante: {Fuel}.");
        }

        [Log]
        public void Stop()
        {
            Console.WriteLine($"{Brand} {Model} ha detenido.");
        }

        [Log]
        public void Turn()
        {
            Console.WriteLine($"{Brand} {Model} está girando.");
        }

        public void Refuel(int amount)
        {
            Fuel += amount;
            Console.WriteLine($"{Brand} {Model} ha sido reabastecido. Combustible actual: {Fuel}.");
        }
    }
}
