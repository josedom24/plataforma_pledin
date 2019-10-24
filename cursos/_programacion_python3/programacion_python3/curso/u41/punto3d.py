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
    def y(self,y):
        self.__y=y

    def mostrar(self):
        return str(self.__x)+":"+str(self.__y)
    
    def distancia(self, otro):
        """ Devuelve la distancia entre ambos puntos. """
        dx = self.__x - otro.__x
        dy = self.__y - otro.__y
        return math.sqrt((dx*dx + dy*dy))


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
        
# Programa principal
punto1=punto3d()
print(type(punto1))
print ("La X del punto 1 es",punto1.x)
print ("La Z del punto 1 es",punto1.z)
print("El punto 1 es",punto1.mostrar())
punto2=punto3d(4,5,3)
print(punto1.distancia(punto2))
punto1.x=3
print ("La X del punto 1 es",punto1.x)