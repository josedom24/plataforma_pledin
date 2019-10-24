---
title: "Estructuras de control repetitivas: while"
permalink: /cursos/programacion_python3/curso/u17/index.html
---

La instrucción `while` ejecuta una secuencia de instrucciones mientras una condición sea verdadera.

    while <condición>:
        <instrucciones>

* Al ejecutarse esta instrucción, la condición es evaluada. Si la condición resulta verdadera, se ejecuta una vez la secuencia de instrucciones que forman el cuerpo del ciclo. Al finalizar la ejecución del cuerpo del ciclo se vuelve a evaluar la condición y, si es verdadera, la ejecución se repite. Estos pasos se repiten mientras la condición sea verdadera.
* Se puede dar la circunstancia que las instrucciones del bucle no se ejecuten nunca, si al evaluar por primera vez la condición resulta ser falsa.
* Si la condición siempre es verdadera, al ejecutar esta instrucción se produce un ciclo infinito. A fin de evitarlo, las instrucciones del cuerpo del ciclo deben contener alguna instrucción que modifique la o las variables involucradas en la condición, de modo que ésta sea falsificada en algún momento y así finalice la ejecución del ciclo.

## Ejemplo

Crea un programa que pida al usuario una contraseña, de forma repetitiva mientras que no introduzca "asdasd". Cuando finalmente escriba la contraseña correcta, se le dirá "Bienvenido" y terminará el programa.

    secreto = "asdasd"
    clave = input("Dime la clave:")
    while clave != secreto:
        print("Clave incorrecta!!!")
        clave = input("Dime la clave:")
    print("Bienvenido!!!")
    print("Programa terminado")

## Instrucciones break y continue

### break

Termina la ejecución del bucle, además no ejecuta el bloque de instrucciones.

Veamos un programa similar al anterior pero que tiene otra condición de salida:

    secreto = "asdasd"
    clave = input("Dime la clave:")
    while clave != secreto:
        print("Clave incorrecta!!!")
        otra = input("¿Quieres introducir otra clave (S/N)?:")
        if otra.upper()=="N":
            break;
        clave = input("Dime la clave:")
    if clave == secreto:
        print("Bienvenido!!!")
    print("Programa terminado")

### continue
    
Deja de ejecutar las restantes instrucciones del bucle y vuelve a iterar.

Aunque podemos de hacerlo de varias formas, vamos a usar la instrucción `continue` para mostrar los número pares del 1 al 10:

    cont = 0
    while cont<10:
        cont = cont + 1
        if cont % 2 != 0:
            continue
        print(cont)

## Instrucción `Repetir - Hasta Que`

En pseudocódigo podemos encontrar una instrucción `Repetir - Hasta Que` que nos permite ejecutar una secuencia de instrucciones hasta que la condición sea verdadera. Con esta estructura la secuencia de instrucciones que forma el cuerpo del ciclo se ejecuta una vez y luego se evalúa la condición. Esta estructura de control la podemos encontrar en muchos lenguajes de programación, pero en Python no existe. Podemos simular el comportamiento de esta estructura utilizando un bucle con `while` y con la instrucción `break`:

### Ejemplo

Crea un programa que pida al usuario una contraseña, de forma repetitiva mientras que no introduzca "asdasd". Cuando finalmente escriba la contraseña correcta, se le dirá "Bienvenido" y terminará el programa.

En pseudocódigo:

    Proceso login
        Definir secreto, clave como cadena;
        secreto <- "asdasd";
        Repetir
            Escribir "Dime la clave:";
            Leer clave;
            Si clave<>secreto Entonces
                Escribir "Clave incorrecta!!!";
            FinSi
        Hasta Que clave=secreto
        Escribir "Bienvenido!!!";
        Escribir "Programa terminado";
    FinProceso

En python3:

    secreto = "asdasd"
    while True:
        clave = input("Dime la clave:")
        if clave != secreto:
            print("Clave incorrecta!!!")
        if clave == secreto:
            break;
    print("Bienvenido!!!")
    print("Programa terminado")
