---
title: "Encapsulamiento en la programación orientada a objetos"
permalink: /cursos/programacion_python3/curso/u40/index.html
---

En la unidad anterior terminamos viendo que teníamos la posibilidad de cambiar los valores de los atributos de un objeto. En muchas ocasiones es necesario que esta modificación no se haga directamente, sino que tengamos utilizar un método para realizar la modificación y poder controlar esa operación. También puede ser deseable que la devolución del valor de los atributos se haga utilizando un método. La característica de no acceder o modificar  los valores de los atributos directamente y utilizar métodos para ello lo llamamos **encapsulamiento**.

## Atributos privados

Las variables que comienzan por un doble guión bajo `__` la podemos considerar como **atributos privados**. Veamos un ejemplo:

	>>> class Alumno():
	...    def __init__(self,nombre=""):
	...       self.nombre=nombre
	...       self.__secreto="asdasd"
	... 
	>>> a1=Alumno("jose")
	>>> a1.__secreto
	Traceback (most recent call last):
	  File "<stdin>", line 1, in <module>
	AttributeError: 'Alumno' object has no attribute '__secreto'

## Propiedades: getters y setters

Para implementar la encapsulación y no permitir el acceso directo a los atributos, podemos poner los atributos ocultos y declarar métodos específicos para acceder y modificar los atributos.

* En Python, las **propiedades (getters)** nos permiten implementar la funcionalidad exponiendo estos métodos como atributos.
* Los métodos **setters** son métodos que nos permiten modificar los atributos a través de un método.

	```
    class circulo():
    	def __init__(self,radio):
    		self.radio=radio
    
    	@property
    	def radio(self):
    		print("Estoy dando el radio")
    		return self.__radio	
    
    	@radio.setter
    	def radio(self,radio):
    		if radio>=0:
    			self.__radio = radio
    		else:
    			print("Radio debe ser positivo")
    			self.__radio=0
	```
	```
	>>> c1=circulo(3)
	>>> c1.radio
	Estoy dando el radio
	3
	>>> c1.radio=4
	>>> c1.radio=-1
	Radio debe ser positivo
	>>> c1.radio
	0
	```
