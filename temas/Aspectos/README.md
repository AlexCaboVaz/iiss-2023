# Aspectos en C#

- Nos encontramos con un programa que utiliza AOP, lo conocido por sus siglas en ingles como Programación orientada a Aspectos, en este caso en el lenguaje de C#

- La programación orientada a aspectos (AOP) en C# permite añadir funcionalidades como registros o seguridad de forma modular, sin tener que modificar el código existente. Se crean "Aspectos" que encapsulan estas funcionalidades adicionales y se inyectan en el código objetivo, ya sea en tiempo de compilación o en tiempo de ejecución. Herramientas como PostSharp facilitan este proceso. Este enfoque ayuda a mantener el código más limpio y fácil de gestionar.

## Código

### Modelo Vehiculo

- La clase vehiculo tiene propiedades basicas como marca, modelo y gasolina y metodos que representan acciones que el propio vehiculo puede realizar, como mover, parar, girar o recargar la gasolina.

```public string Brand { get; set; } = "Generic";
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
```

- En esta clase los aspectos se aplican a traves de atributos.

- Esos atributos lo encontramos EnfureFuelAspect, que se aplica en el metodo "Move", este aspecto lo que verifica es que el vehiculo tenga el combustible suficiente para moverse antes de ejecutar el movimiento, en caso de que no sea asi lo comuncia y detiene la ejecución.

- Tambien tenemos el atributo Log, que lo encontramos en los métodos "Stop" y "Turn", este simplemente registra un mensaje al entrar y al salir de los metodos anotados.

### Aspecto EnsureFuelAspect

- Este aspecto, hereda de OnMethodBoundaryAspect lo que significa que puede intervenir en las fases de entrada y salida de un método, en este caso solo utilizada la fase de entrada, como ya hemos comentado antes, si el vehiculo no tienen combustible, lo notifica y detiene la ejecucion.

```
 public override void OnEntry(MethodExecutionArgs args)
        {
            Vehicle? vehicle = args.Instance as Vehicle;
            if(vehicle?.Fuel <= 0)
            {
                Console.WriteLine("No hay suficiente combustible para mover el vehículo.");
                args.FlowBehavior = FlowBehavior.Return;
            }
        }


```

### Aspecto LogAttribute

- Al igual que el método anterior, este tambien hereda de OnMethodBoundaryAspect, pero en cambio, no es de solo entrada, dado que tambien es de salida, esto es util para la depuración y monitoreo de la ejecución del programa.

```
public override void OnEntry(MethodExecutionArgs args)
        {
            Console.WriteLine($"Entrando al método: {args.Method.Name}");
        }
        
        public override void OnExit(MethodExecutionArgs args)
        {
            Console.WriteLine($"Saliendo del método: {args.Method.Name}");
        }


```

### Programa principal

- En el caso del programa principal o main, es quien crea la instancia de vehiculo y hace que el vehiculo se mueva, se detenga y gire, hasta que se acabe el combustible, tras esto, se reabastece.

```
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

```

## Diferencias entre C# y Java

- En C# utilizadmos la biblioteca PostSharp, que es la que ha sido utilizada para este programa y es la mas popular, en cambio en Java se utiliza la biblioteca AspectJ.

- En java los aspectos se intruce una sintaxis especial y permite definir pointcuts, advices y aspects, en C# se aplican como atribuytos en los metodos o las clases.

- En C#, Postsharp modifica el ensamblado despues de que el compilador haya hecho su trabajo, en cambio en Java puede trabajar durante el tiempo de compilación como durente el tiempo de carga.

- En resumen, se mantiene la idea de la programación orientada a aspectos pero la implementación, herramientas y sintaxis pueden varias considerablemente entre ambos lenguajes.
