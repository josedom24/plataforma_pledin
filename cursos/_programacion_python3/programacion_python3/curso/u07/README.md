---
title: "Datos y tipos de datos"
permalink: /cursos/programacion_python3/curso/u07/index.html
---

## Literales, variables y expresiones

### Literales

Los literales nos permiten representar valores. Estos valores pueden ser de diferentes tipos, de esta manera tenemos diferentes tipos de literales:

**Literales numéricos**

* Para representar números enteros utilizamos cifras enteras (Ejemplos: 3, 12, -23).
* Para los números reales utilizamos un punto para separar la parte entera de la decimal (12.3, 45.6). Podemos indicar que la parte decimal es 0, por ejemplo 10., o la parte entera es 0, por ejemplo .001.

**Literales cadenas**

Nos permiten representar cadenas de caracteres. Para delimitar las cadenas podemos usar el carácter ' o el carácter ". También podemos utilizar la combinación ''' cuando la cadena ocupa más de una línea. Ejemplos.

	'hola que tal!'
	"Muy bien"
	'''Podemos \n
	ir al cine'''

El caracter `\n` es el retorno de carro (los siguientes caracteres se escriben en una nueva línea).

### Variables

Una variables es un identificador que referencia a un valor. Para que una variable referencia a un valor se utiliza el operador de asignación `=`.

El nombre de una variable, ha de empezar por una letra o por el carácter guión bajo, seguido de letras, números o guiones bajos. 
	
    >>> var = 5
	>>> var
    5

Hay que tener en cuanta que python distingue entre mayúsculas y minúsculas en el nombre de una variable, pero se recomienda usar sólo minúsculas.

### Expresiones

Una expresión es una combinación de variables, literales, operadores, funciones y expresiones, que tras su evaluación o cálculo nos devuelven un valor de un determinado tipo. 

Veamos ejemplos de expresiones:

	a + 7
	(a ** 2) + b


## Operadores. Precedencia de operadores en python

Los operadores que podemos utilizar se clasifican según el tipo de datos con los que trabajen y podemos poner algunos ejemplos:

* Operadores aritméticos: `+`, `-`, `*`, `/`, `//`, `%`, `**`.
* Operadores de cadenas: `+`, `*`
* Operadores de asignación: `=`
* Operadores de comparación: `==`, `!=`, `>=`, `>`, `<=`, `<`
* Operadores lógicos: `and`, `or`, `not` 
* Operadores de pertenencia: `in`, `not in`

La precedencia de operadores es la siguiente:

1. Los paréntesis rompen la precedencia.
2. La potencia (**)
3. Operadores unarios (`+` `-`)
4. Multiplicar, dividir, módulo y división entera (`*` `%` `//` )
5. Suma y resta (`+` `-`)
6. Operador binario AND (&)
7. Operadores binario OR y XOR (^ |)
8. Operadores de comparación (<= < > >=)
9. Operadores de igualdad (<> == !=)
10. Operadores de asignación (`=`)
11. Operadores de pertenencia (`in`, `in not`)
12. Operadores lógicos (not, or, and)

## Tipos de datos

En python existen muchos tipos de datos, nosotros en este curso vamos a trabajar con los siguientes:

* Tipos numéricos
	* Tipo entero (int)
	* Tipo real (float)
* Tipos booleanos (bool)
* Tipo de datos secuencia
	* Tipo lista (list)
	* Tipo tuplas (tuple)
* Tipo de datos cadenas de caracteres
	* Tipo cadena (str)
* Tipo de datos mapas o diccionario (dict)

### Función type() 

La función `type` nos devuelve el tipo de dato de un objeto dado. Por ejemplo:

	>>> type(5)
	<class 'int'>
	>>> type(5.5)
	<class 'float'>
	>>> type("hola")
	<class 'str'>
	>>> type([1,2])
	<class 'list'>
	