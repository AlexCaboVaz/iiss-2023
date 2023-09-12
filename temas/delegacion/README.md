# 🚗 Proyecto Coche en C# 🛠️

## 📌 Tabla de Contenidos

1. [Introducción](#-introducción)
2. [Cómo Funciona el Código](#-cómo-funciona-el-código)
3. [Delegación en C#](#-delegación-en-c)
4. [Diferencias con Java](#-diferencias-con-java)
5. [Requisitos y Ejecución](#-requisitos-y-ejecución)

---

## 🌟 Introducción

Este proyecto de C# tiene como objetivo demostrar un diseño básico de la clase `Coche`, que puede acelerar y frenar. Este es un ejemplo introductorio para ilustrar el concepto de **delegación** en C#.

---

## 🛠️ Cómo Funciona el Código

### 🚗 Clase `Coche`

#### Código de ejemplo

\`\`\`csharp
public class Coche
{
    public string Marca { get; set; }
    public string Modelo { get; set; }
    public int VelocidadActual { get; set; }

    public Coche(string marca, string modelo)
    {
        Marca = marca;
        Modelo = modelo;
        VelocidadActual = 0;
    }

    public void Acelerar()
    {
        VelocidadActual += 10;
    }

    public void Frenar()
    {
        VelocidadActual -= 10;
    }
}
\`\`\`

- 🏷️ **Propiedades**
  - `Marca`: La marca del coche (ej. "Toyota").
  - `Modelo`: El modelo específico (ej. "Corolla").
  - `VelocidadActual`: Velocidad a la que se desplaza el coche; inicialmente se establece en 0.

- 🎯 **Métodos**
  - `Acelerar()`: Aumenta la `VelocidadActual` en 10 unidades.
  - `Frenar()`: Disminuye la `VelocidadActual` en 10 unidades.

### 🖥️ Clase `Program`

#### Código de ejemplo

\`\`\` csharp
public class Program
{
    public static void Main(string[] args)
    {
        Coche miCoche = new Coche("Toyota", "Corolla");
        ControladorCoche miControlador = AcelerarCoche;
        miControlador += FrenarCoche;
        EjecutarControlador(miControlador, miCoche);
        Console.WriteLine("Velocidad actual del coche: " + miCoche.VelocidadActual);
    }
}
\`\`\`

Esta es la clase principal que se encarga de:

- Crear una instancia de `Coche`.
- Utilizar un delegado para controlar la aceleración y la frenada.

---

## 📬 Delegación en C#

La delegación es un patrón de diseño en el cual un objeto delega la ejecución de una tarea a otro objeto. C# ofrece un tipo especial llamado **delegado** para hacer esto.

- **`ControladorCoche`**: Este es un delegado personalizado que apunta a métodos que toman un `Coche` como parámetro y devuelven `void`.

---

## ☕ Diferencias con Java

1. **Delegados vs Interfaces Funcionales**: C# usa delegados, mientras que Java usa interfaces funcionales para lograr la delegación.
2. **Modificadores de Acceso**: C# tiene tipos como `internal`, que no tienen un equivalente directo en Java.
3. **Tipos Anónimos**: C# permite tipos anónimos; Java no.

---

## 🚀 Requisitos y Ejecución

### 📋 Requisitos

- Asegúrese de tener instalado el [.NET SDK](https://dotnet.microsoft.com/download).

### 🏃‍♂️ Ejecución

1. **Clonar el Repositorio**: `git clone <URL del repositorio>`.
2. **Navegar a la Carpeta del Proyecto**: `cd <nombre de la carpeta>`.
3. **Ejecutar el Proyecto**: `dotnet run`.

Esto imprimirá la velocidad actual del coche en la terminal.



