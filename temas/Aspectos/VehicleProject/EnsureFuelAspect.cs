using PostSharp.Aspects;
using System;
using VehicleProject.Models;

namespace VehicleProject
{
    [Serializable]
    public class EnsureFuelAspect : OnMethodBoundaryAspect
    {
        public override void OnEntry(MethodExecutionArgs args)
        {
            Vehicle? vehicle = args.Instance as Vehicle;
            if(vehicle?.Fuel <= 0)
            {
                Console.WriteLine("No hay suficiente combustible para mover el vehículo.");
                args.FlowBehavior = FlowBehavior.Return;
            }
        }
    }
}
