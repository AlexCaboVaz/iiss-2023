using System;
using VehicleProject.Models;

namespace VehicleProject
{
    class Program
    {
        static void Main(string[] args)
        {
            // Crear un nuevo vehículo.
            Vehicle myVehicle = new Vehicle
            {
                Brand = "Toyota",
                Model = "Corolla"
            };

            // Muestra el estado inicial del combustible.
            Console.WriteLine($"Combustible inicial: {myVehicle.Fuel}");

            // Mover el vehículo.
            myVehicle.Move();

            // Detener el vehículo.
            myVehicle.Stop();

            // Girar el vehículo.
            myVehicle.Turn();

            // Volver a mover el vehículo varias veces hasta que el combustible se agote.
            for(int i = 0; i < 12; i++)
            {
                myVehicle.Move();
            }

            // Reabastecer el vehículo.
            myVehicle.Refuel(100);
            Console.WriteLine($"Combustible después de reabastecer: {myVehicle.Fuel}");
        }
    }
}
