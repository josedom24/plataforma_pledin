---
title: Trabajando con paquetes. Instalando servicios
---

Cuando usamos APT para instalar paquetes hace dos tareas por separado: en un primer paso descarga de los repositorios los paquetes que va a instalar, para a continuación usar la instrucción dpkg para desempaquetar y configurar cada paquete. Veamos algunas cuestiones relacionadas con estas dos tares.  
  
## Descarga de los paquetes para su instalación
 
Todos los paquetes descargados por APT se almacenan en un directorio, para posteriormente poder instalarlo con dpkg. El directorio donde podemos encontrar los paquetes bajados es:  
  
    /var/cache/apt/archives
 
Para borrar esta cache de paquetes podemos usar la opción siguiente de APT:  
  
    # apt-get clean

* Comprueba los paquetes deb que tienes en tu cache de paquetes.  
* ¿Qué ocurre si desinstala un paquete y lo vuelves a instalar, si el paquete está en la cache?  
* Borra la cache de paquetes y comprueba que se han borrado. Te en cuenta que a continuación deberás instalar algún paquete para tener paquetes en la cache y seguir haciendo las tareas.  

## dpkg: Trabajando con paquetes .deb


Recordamos algunas opciones de dpkg:  
  
Para instalar un paquete deb usamos:  

    # dpkg -i nombredelpaquete.deb

Para eliminar el paquete instalado, debemos poner:  

    # dpkg -r nombredelpaquete

También podemos usar para eliminar un paquete el parámetro --purge(-P)  

    # dpkg -P nombredelpaquete

Con esto borramos la aplicación y los archivos de configuración.  
  
Ahora si solo queremos ver el contenido del paquete deb podemos poner  

    # dpkg -c nombredelpaquete.deb

Para obtener información acerca del paquete tal como el nombre del autor, el año en que fue compilado y una descripción corta de su uso podemos poner  

    # dpkg -I nombredelpaquete.deb


Para conocer si tenemos instalado un determinado paquete podemos poner  

    # dpkg -s nombredelpaquete

Si nosotros queremos conocer que archivos nos instala una determinada aplicación podemos poner  

    # dpkg -L nombredelpaquete 

Si queremos saber a qué paquete pertenece un fichero, podemos poner:  

    # dpkg -S nombredefichero

* Escoge un paquete que tengas en la cache, elimínalo con dpkg y a continuación vuelve a instalarlo.  
* Escoge un paquete que tengas en cache y visualiza su contenido y la información de dicho paquete.  
* Vamos a identificar los ficheros instalados en el sistema de un paquete "servicio", para ello vamos a instala con apt-get el servidor de correo "postfix" y a continuación usando la opción -L de dpkg identifica los ficheros y directorios instalando usando como guía el siguiente [documento]().  
* Comprueba en qué paquete del sistema está el fichero `/etc/dhcp3/dhclient.conf`  
  
## dpkg-reconfigure: Reconfigurando los paquetes instalados
  
Cuando instalamos un paquete con APT, se descarga, se descomprime y por último se configura. Si queremos configurar de nuevo un paquete ya instalado usamos la instrucción `dpkg-reconfigure`.  
  
Con la opción -p podemos indicar el nivel de detalle que se hará la configuración: low (bajo) o high (alto).  
  
* Reconfigura el paquete debconf, que se encarga precisamente de la configuración de los paquetes debian.  

        dpkg-reconfigure debconf  