#!/usr/bin/env python
def sumar(*args):
	resultado=0
	for i in args:
		resultado+=i
	return resultado

def saludar(nombre="pepe",**kwargs):
	cadena=nombre
	for valor in kwargs.values():
		cadena+=" "+valor
	return "Hola "+cadena