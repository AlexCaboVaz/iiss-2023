# DELEGACION EN C#

* Este es un ejemplo sencillo de cómo se puede utilizar la delegación en C# para controlar la velocidad de un objeto Coche mediante el uso de delegates.

## Delegacion de la clase coche

* Primero, definimos la clase Coche con sus propiedades y métodos para acelerar y frenar el coche:

~~~
class Coche
{
    public string Marca { get; set; }
    public int Velocidad { get; set; }

    public void Acelerar(int incremento)
    {
        Velocidad += incremento;
    }

    public void Frenar(int decremento)
    {
        Velocidad -= decremento;
    }
}
~~~

## Definimos EjecutarControlador

* Verifica si el delegate es nulo antes de invocarlo.

~~~
public static void EjecutarControlador(ControladorCoche controlador, Coche coche)
    {
        if (controlador != null)
        {
            controlador(coche);
        }
    }
~~~

## Uso de la delegación en el método Main

* En el método Main, creamos un objeto Coche y una variable miControlador de tipo ControladorCoche, que inicialmente está a null. Luego, asignamos el método AcelerarCoche al delegate mediante el operador +=. Esto significa que ahora miControlador apunta a este método:

~~~
Coche miCoche = new Coche();
ControladorCoche miControlador = null;
miControlador += AcelerarCoche;
~~~

* Luego, asignamos el método FrenarCoche al delegate mediante el operador +=. Esto significa que ahora miControlador apunta a ambos métodos:

~~~
miControlador += FrenarCoche;
~~~

* Finalmente, el método EjecutarControlador toma el delegate y el objeto Coche como argumentos y verifica si el delegate es nulo antes de invocarlo. Al utilizar un método intermediario de esta manera, se puede agregar lógica adicional antes y después de la ejecución del delegate.

~~~
EjecutarControlador(miControlador, miCoche);
~~~
## Evento delegate 

* Esto convierte el delegate en un evento, lo que significa que solo se puede agregar o quitar métodos del delegate desde dentro de la clase que lo define. En otras palabras, no se puede invocar directamente el delegate desde fuera de la clase.

~~~
public event ControladorCoche MiEvento;
~~~

## Métodos AcelerarCoche y FrenarCoche

* Estos son los métodos que hemos utilizado para acelerar y frenar el coche. Ambos métodos reciben un objeto Coche como argumento y no devuelven ningún valor:

~~~
static void AcelerarCoche(Coche coche)
{
    coche.Acelerar(10);
    Console.WriteLine("El coche ha acelerado a {0} km/h", coche.Velocidad);
}

public static void FrenarCoche(Coche coche)
    {
        coche.Frenar();
    }
~~~
