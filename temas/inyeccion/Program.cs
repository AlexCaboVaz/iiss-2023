using System;
using Microsoft.Extensions.DependencyInjection;

public interface ISaludoService
{
    string Saludar(string nombre);
}

public class SaludoService : ISaludoService
{
    public string Saludar(string nombre)
    {
        return $"Hola, {nombre}!";
    }
}

public class App
{
    private readonly ISaludoService _saludoService;

    public App(ISaludoService saludoService)
    {
        _saludoService = saludoService;
    }

    public void Run()
    {
        Console.WriteLine(_saludoService.Saludar("Juan"));
    }
}

class Program
{
    static void Main(string[] args)
    {
        // Configuramos el contenedor de dependencias
        var services = new ServiceCollection();
        services.AddSingleton<ISaludoService, SaludoService>();
        services.AddTransient<App>();
        var serviceProvider = services.BuildServiceProvider();

        // Ejecutamos la aplicación
        var app = serviceProvider.GetService<App>();
        app.Run();
    }
}
