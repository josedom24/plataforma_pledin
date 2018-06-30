from os import listdir
from os.path import isfile, join

def ls(ruta = '.'):
    return [arch for arch in listdir(ruta) if isfile(join(ruta, arch)) and ".md" in arch]


for f in ls():
    with open(f) as fichero:
        cont=fichero.read()
        cont=cont[2:]
        cont="title: "+cont
        pos=cont.find("\n")
        cont=cont[:pos]+"\n---\n"+cont[pos+1:]
        cont="---\n"+cont
    with open(f,"w") as fichero:
        fichero.write(cont)
