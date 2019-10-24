import math
class punto():
    """ Representación de un punto en el plano, los atributos son x e y
    que representan los valores de las coordenadas cartesianas."""

    def __init__(self,x=0,y=0):
        self.x=x
        self.y=y
    
    @property
    def x(self):
    	return self.__x
    
    @property
    def y(self):
    	return self.__y
       
    @x.setter
    def x(self,x):
    	self.__x=x
    @y.setter
    def y(self,x):
    	self.__y=y

    def mostrar(self):
        return str(self.__x)+":"+str(self.__y)
    
    def distancia(self, otro):
        """ Devuelve la distancia entre ambos puntos. """
        dx = self.__x - otro.__x
        dy = self.__y - otro.__y
        return math.sqrt((dx*dx + dy*dy))

# Programa principal
punto1=punto()
punto2=punto(4,5)
print ("La X del punto 1 es",punto1.x)
print("El punto 1 es",punto1.mostrar())
print(punto1.distancia(punto2))
print("Cambio la coordenada x del punto 1")
punto1.x=3
print ("La X del punto 1 es",punto1.x)