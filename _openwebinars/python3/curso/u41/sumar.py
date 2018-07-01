#!/usr/bin/env python

import sys
print("Has introducido",len(sys.argv),"argumento")
print(sys.argv)
suma=0
for i in range(1,len(sys.argv)):
	suma=suma+int(sys.argv[i])
print("La suma es ",suma)