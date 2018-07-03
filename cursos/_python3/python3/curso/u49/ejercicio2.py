#!/usr/bin/env python
import csv
def LeerPartidos():
	"""Función que lee el fichero CSV y devuelve los datos del mismo en una 
	lista de diccionarios con los datos de la liga."""
	datos=[]
	keys=["fecha","equipo1","equipo2","final","mitad"]
	fichero = open("liga.csv")
	contenido = csv.reader(fichero)
	for row in list(contenido)[1:]:
		partido=dict(zip(keys,row))
		datos.append(partido)
	fichero.close()
	return datos

def impClasificacion(liga):
	"""recibe la lista de diccionarios con losnerado a parir del fichero csv, genera los datos
	 de la clasificación y los imprime por pantalla"""
	datos=InfoEquipos(liga,*Equipos(liga))
	
	contador=1
	line = '-' * 61
	print(line)
	print("|   №    |     Equipo      |   PG   |   PP  |  PE   |Puntos |")
	print(line)
	for dato in Clasificacion(datos):
		print('| {0:^6} | {1:^15} | {2:^6} |{3:^6} |{4:^6} |{5:^6} |'.format(contador,dato[0],dato[1],dato[2],dato[3],dato[4]))
		contador+=1
	print(line)

def Equipos(liga):
	"""Función que recibe la lista de diccionarios con los datos de la liga y devuelve un
	 conjunto con los equipos de la liga."""
	return(tuple(set([partido["equipo1"] for partido in liga])))

if __name__ == '__main__':
	liga=LeerPartidos()
	#impClasificacion(liga)
	print(Equipos(liga))