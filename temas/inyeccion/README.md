# Ejemplo de inyección de dependencias en Ruby
* Este código muestra cómo usar la inyección de dependencias en Ruby para gestionar una flota de coches.

## Clases
* El código define tres clases:

### Coche
* La clase Coche representa un coche con una marca, modelo y disponibilidad. Tiene los siguientes métodos:

1. initialize(marca, modelo, disponible = true): Crea un nuevo objeto Coche con los atributos especificados. Por defecto, un coche se crea como disponible.
disponible?: Devuelve true si el coche está disponible, o false si no lo está.

2. reservar!: Marca el coche como no disponible.

3. RepositorioDeCoches
- La clase RepositorioDeCoches representa un repositorio de coches. Tiene los siguientes métodos:

1. initialize: Crea un nuevo objeto RepositorioDeCoches vacío.
añadir_coche(coche): Añade un objeto Coche al repositorio.

2. todos_los_coches: Devuelve un array con todos los objetos Coche del repositorio.

## GestorDeFlota
* La clase GestorDeFlota representa un gestor de flota de coches. Tiene los siguientes métodos:

1. initialize(repositorio_de_coches): Crea un nuevo objeto GestorDeFlota con el repositorio de coches especificado.
coches_disponibles: Devuelve un array con todos los objetos Coche del repositorio que estén disponibles.

2. reservar_coche(coche): Marca el coche especificado como no disponible.

## Uso
* El código crea tres objetos Coche y un objeto RepositorioDeCoches. Luego, añade los tres coches al repositorio, y crea un objeto GestorDeFlota con el repositorio.

* Finalmente, se llaman a los métodos coches_disponibles y reservar_coche en el gestor.

* La salida del código muestra los coches disponibles y actualiza la lista después de reservar el primer coche.

## Resumen
* La inyección de dependencias en Ruby permite separar el comportamiento de las clases de su implementación concreta.

* Las clases se comunican entre sí a través de interfaces y no conocen la implementación concreta de otras clases.

* En este ejemplo, la clase GestorDeFlota depende del repositorio de coches, pero no sabe cómo está implementado.
* Esto hace que el código sea más flexible y fácil de mantener.