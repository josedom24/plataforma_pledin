from os import listdir
from os.path import isfile, join,isdir

def ls(ruta = '.'):
    return [arch for arch in listdir(ruta) if isfile(join(ruta, arch)) and ".md" in arch]

def ls2(ruta = '.'):
    l = [arch for arch in listdir(ruta) if isdir(join(ruta, arch))]
    l2=[]
    for ll in l:
        if isfile(join(ruta, ll+"/README.md")):
            l2.append(ll+"/README.md")
    return l2

for f in ls2():
    with open(f) as fichero:
        cont=fichero.read()
        cont=cont[2:]
        cont='title: "'+cont
        pos=cont.find("\n")
        cont=cont[:pos]+'"\npermalink: /cursos/python3/curso/%s/index.html\n---\n'%f.replace("/README.md","")+cont[pos+1:]
        cont="---\n"+cont
    with open(f,"w") as fichero:
        fichero.write(cont)
