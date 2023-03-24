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

## Definimos el delegate ControladorCoche

* Luego, definimos el delegate ControladorCoche, que define la firma de los métodos que podemos asignar a una variable de este tipo. En este caso, el delegate recibe un objeto Coche como argumento y no devuelve ningún valor:

~~~
delegate void ControladorCoche(Coche coche);
~~~

## Uso de la delegación en el método Main

* En el método Main, creamos un objeto Coche y una variable miControlador de tipo ControladorCoche, que inicialmente está a null. Luego, asignamos el método AcelerarCoche al delegate mediante el operador +=. Esto significa que ahora miControlador apunta a este método:

~~~
Coche miCoche = new Coche();
ControladorCoche miControlador = null;
miControlador += AcelerarCoche;
~~~

* Después, llamamos al delegate pasando como argumento el objeto Coche que queremos acelerar. Como miControlador apunta al método AcelerarCoche, se ejecuta este método y el coche acelera:

~~~
miControlador(miCoche);
~~~

* Luego, asignamos el método FrenarCoche al delegate mediante el operador +=. Esto significa que ahora miControlador apunta a ambos métodos:

~~~
miControlador += FrenarCoche;
~~~

* Finalmente, llamamos al delegate pasando como argumento el objeto Coche que queremos frenar. Como miControlador apunta a dos métodos, se ejecutan ambos métodos en el orden en que se han asignado. Primero se ejecuta AcelerarCoche, que aumenta la velocidad del coche en 10 km/h, y luego se ejecuta FrenarCoche, que disminuye la velocidad del coche en 10 km/h. Como resultado, la velocidad final del coche es 0 km/h:

~~~
miControlador(miCoche);
~~~

## Métodos AcelerarCoche y FrenarCoche

* Estos son los métodos que hemos utilizado para acelerar y frenar el coche. Ambos métodos reciben un objeto Coche como argumento y no devuelven ningún valor:

~~~
static void AcelerarCoche(Coche coche)
{
    coche.Acelerar(10);
    Console.WriteLine("El coche ha acelerado a {0} km/h", coche.Velocidad);
}

static void FrenarCoche(Coche coche)
{
~~~
