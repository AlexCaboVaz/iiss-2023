// Aspecto para registrar la entrada y salida de métodos
using PostSharp.Aspects;
using System;

namespace VehicleProject.Aspects
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