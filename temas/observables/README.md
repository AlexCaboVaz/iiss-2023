# 📱 RxJava en Kotlin para Observables 📱

---

## 📌 Índice 📌

1. [📚 Descripción General](#descripción-general)
2. [🔍 Cómo Funciona](#cómo-funciona)
    - [🧰 Recursos y Observables](#recursos-y-observables)
    - [🔢 Primer Observable](#primer-observable)
    - [🔡 Segundo Observable](#segundo-observable)
    - [🔗 Combinar Observables](#combinar-observables)
3. [🎣 Uso de Subjects](#uso-de-subjects)
4. [♻️ Refactorización](#refactorización)
5. [🏁 Cómo Ejecutar el Código](#cómo-ejecutar-el-código)
6. [🛠 Requisitos](#requisitos)

---

## 📚 Descripción General 📚

Este proyecto demuestra cómo usar RxJava en Kotlin para trabajar con observables, subjects y cómo gestionar recursos mediante `CompositeDisposable`. El objetivo es mostrar cómo observables y subjects pueden emitir y transformar datos de manera eficiente.

---

## 🔍 Cómo Funciona 🔍

### 🧰 Recursos y Observables 🧰

Iniciamos con la creación de un `CompositeDisposable`, una bolsa para guardar todas nuestras suscripciones (disposables) de manera que se puedan liberar recursos fácilmente.

También creamos un `PublishSubject` que actuará como un puente para recibir y emitir eventos.

```kotlin
val disposables = CompositeDisposable()
val subject = PublishSubject.create<String>()
```

### 🔢 Primer Observable 🔢

Este observable emite números del 1 al 5 cada segundo. Utilizamos `Observable.interval` para la emisión continua, limitamos la emisión a 5 elementos con `.take(5)` y transformamos los elementos emitidos sumándoles 1 con `.map`.

```kotlin
val observable1 = Observable.interval(1, TimeUnit.SECONDS)
    .take(5)
    .map { it + 1 }
```

### 🔡 Segundo Observable 🔡

Este observable toma cadenas emitidas por el `PublishSubject` y las convierte en mayúsculas usando el operador `.map`.

```kotlin
val observable2 = subject.map { it.uppercase() }
```

### 🔗 Combinar Observables 🔗

Usamos `Single.zip` para combinar el último elemento emitido por `observable1` y el primer elemento emitido por `observable2`.

```kotlin
val zippedSingle = Single.zip(
    observable1.last(0),
    observable2.first(""),
    { num, str -> "Número: $num, Cadena: $str" }
)
```

## 🎣 Uso de Subjects 🎣

El `PublishSubject` se utiliza para emitir eventos que son recogidos y transformados por `observable2`.

```kotlin
subject.onNext("hola")
subject.onNext("mundo")
```

## ♻️ Refactorización ♻️

1. **Encapsulamiento de Lógica Común**: Hemos creado funciones específicas para encapsular lógicas comunes de creación y suscripción a observables.
2. **Uso de Constantes para Valores Mágicos**: Introducimos constantes para facilitar la lectura y gestión del código.
3. **Deprecación**: Hemos actualizado el uso de `toUpperCase()` a `uppercase()` para evitar advertencias de deprecación.
4. **Pruebas**: Corregimos el código de prueba para eliminar referencias no resueltas y garantizar que estén alineadas con la lógica de negocio.
5. **Documentación Mejorada**: Hemos mejorado los comentarios y documentación del código para una mejor comprensión.

---

## 🏁 Cómo Ejecutar el Código 🏁

1. Clone el repositorio
2. Navegue hasta el directorio del proyecto
3. Ejecute `./gradlew run`

## 🛠 Requisitos 🛠

- JDK 1.8 o superior
- RxJava 3.x

---
