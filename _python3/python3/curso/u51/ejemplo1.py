class Alumno():
	contador=0
	def __init__(self,nombre=""):
		self.nombre=nombre
		self.__secreto="asdasd"
		Alumno.contador+=1