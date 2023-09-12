# 🧑‍💼 Gestión de Personas en Kotlin 🧑‍💼

---

## 📌 Índice 📌

1. [📚 Descripción General](#descripción-general)
2. [🔍 Cómo Funciona](#cómo-funciona)
    - [📦 Clase y Propiedades](#clase-y-propiedades)
    - [🔧 Métodos](#métodos)
3. [🐑 Uso de Lambdas en Kotlin](#uso-de-lambdas-en-kotlin)
4. [🔄 Técnicas de Refactorización](#técnicas-de-refactorización)
5. [🏁 Cómo Ejecutar el Código](#cómo-ejecutar-el-código)
6. [🛠 Requisitos](#requisitos)

---

## 📚 Descripción General 📚

Este proyecto en Kotlin demuestra la utilización de **funciones de orden superior**, **lambdas**, **colecciones** y **clases de datos** para manipular y procesar una lista de personas.

---

## 🔍 Cómo Funciona 🔍

### 📦 Clase y Propiedades 📦

```kotlin
data class Person(val name: String, val age: Int, val city: String)
```

Esta clase define las propiedades básicas que tendrán todas las personas:

- name: El nombre de la persona (String).
- age: La edad de la persona (Int).
- city: La ciudad donde vive la persona (String).

### 🔧 Métodos 🔧

- validate(person: Person): Valida la información de una persona.
- mostrarResultados(): Muestra múltiples resultados con etiquetas para fácil identificación.
- filterOlderThan(): Filtra personas mayores que una cierta edad.
- transformToNames(): Extrae solo los nombres de las personas.
- groupPeopleByCity(): Agrupa las personas por su ciudad.
- ... y más


## 🐑 Uso de Lambdas en Kotlin 🐑

Las lambdas son funciones anónimas que se pueden pasar como argumentos a funciones de orden superior. Ejemplo:

```kotlin
people.filter { it.age > age }
```

Aquí, { it.age > age } es una lambda que se pasa a filter.


## 🐑 Diferencias entre Lambdas en Kotlin y Java 🐑

- Kotlin: Más conciso, permite referencias de funciones ::funcName
- Java: Requiere una interfaz funcional para el tipo de lambda.

## 🔄 Técnicas de Refactorización 🔄

- Desacoplamiento: Cada operación específica se ha separado en su propia función.
- Validación: Se ha añadido una función de validación para asegurarse de que los datos sean válidos antes de operar con ellos.
- Función de Mostrar Resultados: Para hacer el código más reutilizable y limpio.

## 🏁 Cómo Ejecutar el Código 🏁

1. Abre una terminal en tu editor de código.
2. Navega hasta el directorio donde se encuentra el archivo Lambdas.kt.
3. Ejecuta los siguientes comandos:

```bash
kotlinc Lambdas.kt -include-runtime -d Lambdas.jar
java -jar Lambdas.jar
```

## 🛠 Requisitos 🛠

- Kotlin SDK instalado.
- IDE compatible con Kotlin, como IntelliJ IDEA o Visual Studio Code con la extensión de Kotlin.