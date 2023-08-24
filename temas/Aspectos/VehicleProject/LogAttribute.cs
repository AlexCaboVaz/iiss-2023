using PostSharp.Aspects;
using System;

namespace VehicleProject.Aspectos
{
    [Serializable]
    public class LogAttribute : OnMethodBoundaryAspect
    {
        public override void OnEntry(MethodExecutionArgs args)
        {
            Console.WriteLine($"Entrando al método: {args.Method.Name}");
        }
        
        public override void OnExit(MethodExecutionArgs args)
        {
            Console.WriteLine($"Saliendo del método: {args.Method.Name}");
        }
    }
}
