# OBSERVABLES EN KOTLIN

- Este proyecto de ejemplo utiliza RxJava 3 para demostrar conceptos avanzados de programación reactiva en Kotlin. El programa crea varios Observables y un Single, además de un PublishSubject para emitir eventos. Todos estos elementos se combinan y se manipulan utilizando varios operadores de RxJava para lograr diferentes resultados.

## RCJAVA en Kotlin

1. Crear Observables: Usar Observable.just() o list.toObservable() para crear.
2. Operadores: Modificar datos con map, filter, etc.
3. Suscribirse: Usar subscribe() para recibir elementos.
4. Desuscribirse: Llamar a dispose() para detener la suscripción.
5. RxKotlin añade funciones de extensión y simplifica el código. Funciona bien con las características modernas de Kotlin como lambdas y corrutinas.

## Componentes y código

### Observables

- observable1

    1. Descripción: Este Observable emite números del 1 al 5.
    ```

    val observable1 = Observable.interval(1, TimeUnit.SECONDS)
    .take(5)
    .map { it + 1 }

    ```

    2. Subscripciones: Imprime cada número emitido y notifica cuando se completa.
    ```
    observable1.subscribe(
    { value -> println("observable1 onNext: $value") },
    { error -> println("observable1 onError: $error") },
    { println("observable1 onComplete") }
    )

    ```

- observable2

    1. Descripción: Este Observable toma eventos de un PublishSubject y los convierte a mayúsculas.
    ```
    val subject = PublishSubject.create<String>()
    val observable2 = subject.map { it.toUpperCase(Locale.getDefault()) }

    ```

    2. Subscripciones: Imprime cada cadena en mayúsculas y notifica errores si los hay.
    ```

    observable2.subscribe(
    { value -> println("observable2 onNext: $value") },
    { error -> println("observable2 onError: $error") }
    )

    ```

## Subject

- Tipo: PublishSubject<String>

```
subject.onNext("hola")
subject.onNext("mundo")


```

## Single

- zippedSingle

    1. Descripción: Este Single se forma mediante la combinación del último elemento emitido por observable1 y el primer elemento emitido por observable2.

    ```

    val zippedSingle = Single.zip(
    observable1.lastOrError(),
    observable2.firstOrError(),
    BiFunction<Long, String, String> { num, str -> "Last of observable1: $num, First of observable2: $str" }
    )

    
    ```

    2. Subscripciones: Imprime la combinación de los elementos y notifica errores si los hay

    ```

    zippedSingle.subscribe(
    { value -> println("zippedSingle onSuccess: $value") },
    { error -> println("zippedSingle onError: $error") }
    )

    
    ```

## Gestión de recursos

- Para liberar recursos se usa CompositeDisposable.

```

val disposables = CompositeDisposable()

disposables.addAll(
    observable1.subscribe(/*...*/),
    observable2.subscribe(/*...*/),
    zippedSingle.subscribe(/*...*/)
)

// Al final del ciclo de vida
disposables.dispose()

```

## Flujo de Ejecución

1. Se inician las subscripciones a observable1, observable2, y zippedSingle.
2. El PublishSubject emite las cadenas "hola" y "mundo".
3. observable1 emite números del 1 al 5 cada segundo.
4. zippedSingle combina el último número emitido por observable1 y la primera cadena emitida por observable2.
5. CompositeDisposable se utiliza para liberar todos los recursos.


## Diferencias con Java

1. Sintaxis: Kotlin es más conciso, lo que facilita la lectura y escritura del código relacionado con Observables.

2. Extensiones: Kotlin permite funciones de extensión, como en RxKotlin, que hacen más fácil trabajar con Observables.

3. Seguridad de Tipos Nulos: Kotlin maneja nulos de manera más segura, lo que puede afectar al manejo de errores en Observables.

- En resumen, el concepto de "Observable" es el mismo en Java y Kotlin, pero las diferencias en sintaxis y características del lenguaje hacen que la experiencia de trabajar con ellos sea ligeramente diferente.


## Ejecución

- Ejecuta gradle run o ./gradlew run si estás utilizando Gradle.