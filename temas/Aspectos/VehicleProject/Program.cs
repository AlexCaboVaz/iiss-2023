using System;
using VehicleProject.Models;

namespace VehicleProject
{
    class Program
    {
        static void Main(string[] args)
        {
            // Crear una nueva instancia de IVehicle
            IVehicle myVehicle = new Vehicle
            {
                Brand = "Toyota",
                Model = "Corolla"
            };

            // Mostrar el estado inicial del combustible
            Console.WriteLine($"Combustible inicial: {myVehicle.Fuel}");
            
            // Mover, detener y girar el vehículo
            myVehicle.Move();
            myVehicle.Stop();
            myVehicle.Turn();

            // Mover el vehículo hasta agotar el combustible
            for (int i = 0; i < 12; i++)
            {
                myVehicle.Move();
            }

            // Reabastecer el vehículo
            myVehicle.Refuel(100);
            Console.WriteLine($"Combustible después de reabastecer: {myVehicle.Fuel}");
        }
    }
}