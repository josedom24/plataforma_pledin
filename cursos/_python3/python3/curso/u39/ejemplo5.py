
def dividir(x,y):
	try:
		return x/y
	except ZeroDivisionError:
		return "No se puede dividir"

def dividir2(x,y):
	try:
		return x/y
	except ZeroDivisionError:
		raise 


print(dividir(2,0))
try:
	print(dividir2(2,0))
except:
	print("No se puede dividir")