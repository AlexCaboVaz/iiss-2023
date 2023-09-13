// Definición de una interfaz para representar las operaciones básicas de un vehículo.
namespace VehicleProject.Models
{
   public interface IVehicle
{
    string Brand { get; set; }
    string Model { get; set; }
    int Fuel { get; }
    void Move();
    void Stop();
    void Turn();
    void Refuel(int amount);
}

}