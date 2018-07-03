---
title: Más opciones de APT
---

## Actualizando los paquetes de nuestro sistema  

    apt-get update

Para actualizar la lista de paquetes disponibles con la información del fichero `/etc/apt/sources.list`

    apt-get upgrade

Con esta instrucción actualizamos la instalación de los paquetes a su última versión sin tener en cuenta las dependencias.  
  
    apt-get dist-upgrade

Con esta instrucción actualizamos la instalación de los paquetes a su última versión pero teniendo en cuenta las dependencias.  
  
Algunas consideraciones:  
  
1. Si estamos trabajando en la rama estable (etch) las dependencias de los paquetes no cambian por lo que es lo mismo usar un upgrade que un dist-upgrade.  
2. En la versión testing las dependencias pueden ir cambiando por lo que si utilizamos upgrade los paquetes cuyas dependencias han cambiado se retienen y no se actualizan, por lo que es conveniente usar el dist-upgrade para ir resolviendo las dependencias.  
  

Nosotros estamos trabajando con la rama testing (lenny)  
  
1. Ejecuta un upgrade y comprueba si existe algún paquete retenido.  
2. Si existe algún paquete retenido, ejecuta un `dist-upgrade` para resolver las depedencias.  
  

## Buscando paquetes en los repositorios: apt-cache

Con la siguiente instrucciones podemos buscar paquetes en los repositorios:  
  
    # apt-cache search <busqueda>

Busca todos los paquetes que tengan relaciones con las palabras que hayas indicado en la busqueda.

    # apt-cache show <paquete>

Te da información del paquete indicado, si tienes instalado el paquete te da información del instalado y de la nueva versión.

    # apt-cache showpkg <paquete> 

Te da información más detallada del paquete indicado.  
  
    # apt-cache depends <paquete> 

Te da la lista de dependencias del paquete indicado.  
  
  
1. Busca todos lo paquetes que tengan la palabra "apache2"  
2. Obtén información del paquete ssh que hemos instalado  
3. Lista los paquetes de los que depende el paquete phpmyadmin  
  
## Aptitude

Siguiendo el manual de Aptitude realiza las siguientes tareas:  
  
1. Busca paquetes que tengan la palabra "ldap"  
2. Desinstala el paquete "ssh" que habiamos instalado anteriormente.  
3. Instala un paquete.  
4. Aptitude también se puede usar desde la línea de comandos: realiza una instalación, una eliminación, una búsqueda, una actualización del sistema y una actualización de la lista de paquetes desde la línea de comandos usando aptitude.  
5. ¿Cuál es la diferencia más importante entre usar aptitude y apt?  
