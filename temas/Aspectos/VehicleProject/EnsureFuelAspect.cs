// Aspecto para asegurarse de que el vehículo tenga combustible antes de moverse
using PostSharp.Aspects;
using System;
using VehicleProject.Models;

namespace VehicleProject.Aspects
{
    [Serializable]
    public class EnsureFuelAspect : OnMethodBoundaryAspect
    {
        public override void OnEntry(MethodExecutionArgs args)
        {
            // Comprueba si el objeto es de tipo IVehicle y si tiene combustible
            if (args.Instance is IVehicle vehicle && vehicle.Fuel <= 0)
            {
                Console.WriteLine("No hay suficiente combustible para mover el vehículo.");
                args.FlowBehavior = FlowBehavior.Return;
            }
        }
    }
}