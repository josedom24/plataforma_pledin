---
title: "Pasando de pseudocódigo a python3"
permalink: /cursos/programacion_python3/curso/u13/index.html
---

Antes de empezar hacer ejercicios con la estructura secuencial, vamos a ver como convertimos algunas instrucciones en pseudocódigo a python3:

## Leer variables por teclado

### Leer cadenas de caracteres

En pseudocódigo:

    Definir nombre Como Cadena;
	Escribir "Dime tu nombre:";
    Leer nombre;

En Python3:

    nombre = input("Dime tu nombre:")

### Leer números enteros

En pseudocódigo:

    Definir numero Como Entero;
	Escribir "Dime un número entero:";
    Leer numero;

En Python3:

    numero = int(input("Dime un número entero:"))

### Leer números reales

En pseudocódigo:

    Definir numero Como Real;
	Escribir "Dime un número real:";
    Leer numero;

En Python3:

    numero = float(input("Dime un número real:"))

## Escribir una variable en pantalla

En pseudocódigo:

    Escribir "Hola ",nombre;

En Python3:

    print("Hola",nombre)

## Escribir sin saltar a otra línea

En pseudocódigo:

    Escribir Sin Saltar var," ";

En Python3:

    print(var," ",end="")


## Asignar valor a una variable

En pseudocódigo:

    numero <- 7;

En Python3:

    numero = 7

Por ejemplo para incrementar el valor de una variable, en pseudocódigo:

    num <- num + 1

En python3 lo podemos hacer de dos maneras:

    num = num +1

O de esta forma:

    num += 1

## Calcular la parte entera de una división

En pseudocódigo:

    trunc(7/2)

En Python3:

    7 // 2

## Calcular la raíz cuadrada

En pseudocódigo:

    raiz(9)

En Python3:

    import math
    math.sqrt(9)

## Obtener el carácter de una cadena

En pseudocódigo:

    subcadena(cadena,0,0)

En Python3:

    cadena[0]

## Unir dos cadenas de caracteres

En pseudocódigo:

    cadena3 <- concatenar(cadena1,cadena2)

En Python3:

    cadena3 = cadena1 + cadena2

## Convertir una cadena a Mayúsculas

Lo veremos con detenimiento en las próximas unidades, pero vamos a usar el método de cadena `upper`:

En pseudocódigo:

    cadena <- Mayusculas(cadena)

En Python3:

    cadena = cadena.upper()


