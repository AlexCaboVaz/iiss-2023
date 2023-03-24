# Ejemplo de inyección de dependencias en C#

## Descripción
* Este ejemplo muestra cómo implementar la inyección de dependencias en una aplicación de consola simple en C#. Se utilizó el framework .NET Core 3.1 para este ejemplo

## Qué es la Inyección de Dependencias?
* La inyección de dependencias es un patrón de diseño que se utiliza para desacoplar los componentes de una aplicación. En lugar de crear explícitamente cada objeto que necesita una clase, la clase solicita el objeto a través de la D

## Como usar la Inyección de Dependencias en una aplicación C#
* En este ejemplo, tenemos una interfaz ISaludoService que define un método Saludar y una implementación SaludoService que implementa la interfaz ISaludoService y devuelve un saludo con el nombre dado.

~~~
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
~~~

* Luego, tenemos una clase App que tiene una dependencia de ISaludoService. En lugar de crear explícitamente una instancia de SaludoService dentro de App, pasamos una instancia de ISaludoService como argumento al constructor de App.

~~~
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
~~~

* En la configuración del contenedor de servicios, registramos la implementación SaludoService para el tipo ISaludoService utilizando el método AddSingleton. Esto significa que cada vez que se solicite una instancia de ISaludoService, el contenedor de servicios devolverá la misma instancia de SaludoService.

~~~
var services = new ServiceCollection();
services.AddSingleton<ISaludoService, SaludoService>();
~~~

* Luego, registramos App como un tipo transitorio utilizando el método AddTransient. Esto significa que cada vez que se solicite una instancia de App, el contenedor de servicios creará una nueva instancia de App y pasará una instancia de ISaludoService como argumento al constructor de App.

~~~
services.AddTransient<App>();
~~~

* Finalmente, en el método Main, utilizamos el contenedor de servicios para obtener una instancia de App y ejecutar su método Run. Esto significa que la instancia de App que se ejecuta tiene una dependencia inyectada de ISaludoService.

~~~
var serviceProvider = services.BuildServiceProvider();
var app = serviceProvider.GetService<App>();
app.Run();
~~~



## Cómo instalar y ejecutar el ejemplo en Visual Studio Code
* Abre Visual Studio Code y crea un nuevo archivo con la extensión .cs.

* Copia el código del ejemplo en el archivo.

* Abre la terminal en Visual Studio Code.

* Instala el SDK de .NET Core si aún no lo has hecho (puedes descargarlo desde la página oficial de .NET):

~~~
dotnet --version
~~~
* En la terminal, navega al directorio donde se encuentra el archivo que acabas de crear:

~~~
cd <directorio>
~~~

* Compila y ejecuta el archivo con el comando:

~~~
dotnet run
~~~

* Deberías ver la salida de la aplicación en la terminal:

~~~
Hola, Juan!
~~~~
