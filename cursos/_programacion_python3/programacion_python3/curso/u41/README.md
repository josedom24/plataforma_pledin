---
title: "Herencia y delegación"
permalink: /cursos/programacion_python3/curso/u41/index.html
---
	
## Herencia

La herencia es un mecanismo de la programación orientada a objetos que sirve para crear clases nuevas a partir de clases preexistentes. Se toman (heredan) atributos y métodos de las clases bases y se los modifica para modelar una nueva situación.

La clase desde la que se hereda se llama clase base y la que se construye a partir de ella es una clase derivada.

Si nuestra clase base es la clase `punto` estudiadas en unidades anteriores, puedo crear una nueva clase de la siguiente manera:

	class punto3d(punto):
    	def __init__(self,x=0,y=0,z=0):
        	super().__init__(x,y)
        	self.z=z

	    @property
	    def z(self):
	        print("Doy z")
	        return self.__z

	    @z.setter
	    def z(self,z):
	        print("Cambio z")
	        self.__z=z

	    def mostrar(self):
	       return super().mostrar()+":"+str(self.__z)

	    def distancia(self,otro):
	        dx = self.__x - otro.__x
	        dy = self.__y - otro.__y
	        dz = self.__z - otro.__z
	        return (dx*dx + dy*dy + dz*dz)**0.5	

La clase `punto3d` hereda de la clase `punto` todos sus propiedades y sus métodos. En la clase hija hemos añadido la propiedad y el setter para el nuevo atributo z, y hemos modificado el constructor (sobreescritura) el método `mostrar` y el método `distancia`.

Creemos dos objetos de cada clase y veamos los atributos y métodos que tienen definido:

	>>> p=punto(1,2)
	>>> p3d=punto3d(1,2,3)
	>>> p.distancia(punto(5,6))
	5.656854249492381
	>>> p3d.distancia(punto3d(2,3,4))
	1.7320508075688772

## La función super()

La función `super()` me proporciona una referencia a la clase base. Como vemos en ejemplo hemos reescrito algunos métodos: `__init()__`, `mostrar()` y `distancia()`. En algunos de ellos es necesario usar el método de la clase base. Para acceder a esos métodos usamos la función `super()`.

	...
	def __init__(self,x=0,y=0,z=0):
       	super().__init__(x,y)
       	self.z=z
	...
	def mostrar(self):
	       return super().mostrar()+":"+str(self.__z)
	...
	
## Delegación

Llamamos delegación a la situación en la que una clase contiene (como atributos) una o más instancias de otra clase, a las que delegará parte de sus funcionalidades.

A partir de la clase `punto`, podemos crear la clase `circulo` de esta forma:

	class circulo():	

		def __init__(self,centro,radio):
			self.centro=centro
			self.radio=radio	

		def mostrar(self):
			return "Centro:{0}-Radio:{1}".format(self.centro.mostrar(),self.radio)	

Y creamos un objeto `circulo`:

	>>> c1=circulo(punto(2,3),5)
	>>> print(c1.mostrar())
	Centro:2:3-Radio:5
