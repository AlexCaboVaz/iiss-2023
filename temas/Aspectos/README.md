# Vehículo Aspect-Oriented Programming en C#

---

## 📚 Tabla de Contenidos

- [🌟 Introducción](#-introducción)
- [💡 Aspectos en C#](#-aspectos-en-c)
  - [🔍 Comparación con Java](#-comparación-con-java)
- [📝 Código Detallado](#-código-detallado)
  - [🚗 Clase Vehicle](#-clase-vehicle)
  - [⛽ Aspecto EnsureFuel](#-aspecto-ensurefuel)
  - [📜 Aspecto Log](#-aspecto-log)
- [🔨 Refactorización](#-refactorización)
  - [📝 Detalles](#-detalles)
- [🚀 Cómo Ejecutar](#-cómo-ejecutar)
- [📋 Requisitos](#-requisitos)

---

## 🌟 Introducción

Este proyecto ilustra el uso de Aspect-Oriented Programming (AOP) en C# para modelar un vehículo sencillo. Se ha utilizado el paquete PostSharp para implementar los aspectos.

```csharp
Vehicle myVehicle = new Vehicle
{
    Brand = "Toyota",
    Model = "Corolla"
};
```

## 💡 Aspectos en C#
Aspectos, o Aspect-Oriented Programming, es una técnica que permite modularizar el código de manera más efectiva. Se han aplicado dos aspectos principales en este proyecto:

## 🔍 Comparación con Java
Java ofrece frameworks como AspectJ para el desarrollo orientado a aspectos. En comparación, C# con PostSharp es más nativo y ofrece una mejor integración con el ecosistema de .NET. Además, PostSharp tiende a ser más fácil de usar y configurar.

## 📝 Código Detallado

### 🚗 Clase Vehicle

La clase `Vehicle` es la clase principal que modela un vehículo. Contiene propiedades como `Brand`, `Model` y `Fuel`.

```csharp

public string Brand { get; set; } = "Generic";
public string Model { get; set; } = "Vehicle";
public int Fuel { get; set; } = 100;

```

#### Métodos:

- **Move**: Consumirá 10 unidades de combustible y mostrará un mensaje que indica el movimiento y el combustible restante.

```csharp

[EnsureFuelAspect]
public void Move()
{
    Fuel -= 10; // Consumir combustible.
    Console.WriteLine($"{Brand} {Model} está moviéndose. Combustible restante: {Fuel}.");
}


```

- **Stop**: Detiene el vehículo y muestra un mensaje.

```csharp

[Log]
public void Stop()
{
    Console.WriteLine($"{Brand} {Model} ha detenido.");
}


```

- **Turn**: Gira el vehículo y muestra un mensaje.

```csharp

[Log]
public void Turn()
{
    Console.WriteLine($"{Brand} {Model} está girando.");
}


```

- **Refuel**: Añade combustible al vehículo.

```csharp
public void Refuel(int amount)
{
    Fuel += amount;
    Console.WriteLine($"{Brand} {Model} ha sido reabastecido. Combustible actual: {Fuel}.");
}


```

## ⛽ Aspecto EnsureFuel

Este aspecto está diseñado para prevenir que el vehículo se mueva si no hay suficiente combustible. Se activa antes del método `Move`.

```csharp
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

## 📜 Aspecto Log

Este aspecto genera registros cada vez que un método con el atributo `LogAttribute` se invoca o finaliza. Es útil para tareas de seguimiento y diagnóstico.

```csharp

public override void OnEntry(MethodExecutionArgs args)
{
    Console.WriteLine($"Entrando al método: {args.Method.Name}");
}


```

## 🔨 Refactorización

### 📝 Detalles

1. **Introducción de Interfaces**: Se ha introducido la interfaz `IVehicle` para abstraer el concepto de un vehículo. Esto hace que el código sea más extensible y fácil de mantener.

2. **Encapsulación**: El campo `fuel` se ha convertido en un campo privado con una propiedad de solo lectura para proteger su integridad.

3. **Validación de Datos**: Se añadió una comprobación en el método `Refuel` para asegurarse de que la cantidad de combustible es válida.

4. **Aplicación de Aspectos**: Los aspectos se han utilizado para separar las preocupaciones transversales como la comprobación de combustible (`EnsureFuelAspec`) y el registro de la actividad (`LogAttribute`).


## 🚀 Cómo Ejecutar

1. **Clonar el Repositorio**: git clone <url_del_repositorio>
2. **Abrir en Visual Studio**: Ejecuta Visual Studio y abre el proyecto.
3. **Instalar Dependencias**: Asegúrate de instalar PostSharp a través de NuGet si aún no está instalado.
4. **Ejecutar el Proyecto**: Haz clic en el botón "Ejecutar" o presiona F5.

## 📋 Requisitos
- Visual Studio 2019 o superior
- .NET Core 3.1 o superior
- PostSharp
