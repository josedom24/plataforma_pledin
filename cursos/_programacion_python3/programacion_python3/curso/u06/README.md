---
title: "Mi primer programa en python3"
permalink: /cursos/programacion_python3/curso/u06/index.html
---


Vamos a escribir nuestro primer programa para estudiar la estructura de un programa en python3.

## Pseudocódigo

El programa que vamos a realizar es el siguiente: **Programa que pida la edad y diga si es mayor de edad.** Después de realizar el análisis y el diseño realizamos un pseudocódigo como este:

    Proceso mayor_edad
    	Definir edad como entero;
    	Escribir "Dime tu edad:";
    	Leer edad;
    	Si edad>=18 Entonces
    		Escribir "Eres mayor de edad";
    	FinSi
    	Escribir "Programa terminado";
    FinProceso

## Codificación

A partir de este pseudocódigo podemos realizar un programa en python3 que sería similar a este:

    # Programa que pida la edad y diga si es mayor de edad.
    edad=int(input("Dime tu edad:"))
    if edad>=18:
        print("Eres mayor de edad")
    print("Programa Terminado")

## Estructura del programa

* Un programa python está formado por instrucciones que acaban en un carácter de "salto de línea".
* Una línea empieza en la primera posición, si tenemos instrucciones dentro de un bloque de una estructura de control de flujo habrá que hacer una identación.
* La identación se puede hacer con espacios y tabulaciones pero ambos tipos no se pueden mezclar. Se recomienda usar 4 espacios.
* La barra invertida "\" al final de línea se emplea para dividir una línea muy larga en dos o más líneas.
* Se utiliza el carácter # para indicar los comentarios.

