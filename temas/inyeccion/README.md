# Inyección de dependencias en Swift

- Este proyecto demuestra cómo implementar la inyección de dependencias en Swift. La aplicación es una simple aplicación de notas que permite crear, leer y eliminar notas.

- La inyección de dependencias es un patrón de diseño que facilita la modularidad y pruebas en tu código

##  Métodos Comunes

- Constructor: Inyectar a través del inicializador.

- Propiedades: Inyectar después de la creación de instancia.

## ¿Por qué es Útil?

- Facilita las Pruebas Unitarias.

- Mejora la Reutilización del Código.

- Aumenta la Modularidad.

## Como funciona la ineyccion de dependencias

### Protocolos y clases concretas

- NotesDatabase: un protocolo que define las operaciones de base de datos como create, read y delete.

- InMemoryNotesDatabase: una implementación en memoria del protocolo NotesDatabase.

### Inyección

1. NotesManager: tiene una dependencia en NotesDatabase. Esta dependencia se inyecta a través del constructor (inicializador).

```

init(database: NotesDatabase) {
    self.database = database
}


```

2. MainApp: tiene una dependencia en NotesManager. Esta dependencia también se inyecta a través del constructor.

```
init(notesManager: NotesManager) {
    self.notesManager = notesManager
}


```

### Flujo del programa

1. Se crea una instancia de InMemoryNotesDatabase y se inyecta en NotesManager.

```

let database: NotesDatabase = InMemoryNotesDatabase()
let notesManager = NotesManager(database: database)


```

2. Se crea una instancia de NotesManager y se inyecta en MainApp.

```
let mainApp = MainApp(notesManager: notesManager)

```

3. MainApp ahora puede utilizar NotesManager para manejar notas, sabiendo que está respaldado por una implementación en memoria de NotesDatabase.
swift


```
mainApp.run()


```

4. Se muestra la lista de todas las notas, y luego se actualiza al eliminar una nota.


### Ventajas

- Facilita las pruebas unitarias al permitir la sustitución de implementaciones reales con mockups.

- Aumenta la modularidad y reutilización del código.

### Ejecución

1. Compilar: swift build

2. Ejecutar: swift run


## Swift vs Java

### Swift

- Incorporado en el Lenguaje: No requiere bibliotecas adicionales para inyección simple.

- Constructor: Uso común del inicializador para inyectar dependencias.

- Explicito: Generalmente, la inyección de dependencias se maneja en el código, sin necesidad de archivos de configuración.

### Java

- Frameworks: Ampliamente utilizado con frameworks como Spring para gestionar inyecciones.

- Anotaciones: Usa anotaciones como @Autowired para inyectar dependencias automáticamente.

- Configuración Externa: A menudo permite la configuración externa a través de archivos XML o anotaciones.

### Diferencias claves

- Swift tiende a ser más manual y explícito, mientras que Java ofrece enfoques más automatizados mediante frameworks.

- Java permite más flexibilidad en la configuración externa, mientras que Swift se centra más en la configuración dentro del código.