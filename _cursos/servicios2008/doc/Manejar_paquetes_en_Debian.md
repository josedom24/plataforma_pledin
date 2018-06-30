---
title: Manejar paquetes en Debian
---

## Manejar paquetes en Debian

### El fichero sources.list
  
En este fichero es donde se guardan donde se han de buscar los paquetes que están disponibles para instalar. Como medios de instalación podemos tener servidores web, de ftp, cdrom, dvd ...  
  
En este archivo aquellas líneas que comienzan con # son las que son comentarios.  
Las que comienzan con deb indican que de esa ubicación se van a obtener paquetes binarios ya precompilados.  
Las líneas que empiezan con deb-src indican que de esa ubicación se van a obtener el código fuente del paquete que se le indique. Al bajar el código fuente podemos compilar el paquete de forma personalizada.  
  
Normalmente si se tiene una conexión a internet en este fichero vienen servidores en los que se buscan las cosas. La lista de mirrors disponibles para Debian se puede encontrar en la siguiente dirección:  
  
    http://www.debian.org/mirror/mirrors_full  
  
Si no se dispone de conexión a internet lo normal es que el fichero `sources.list` contenga líneas que apunten al medio de instalación que hemos usado para realizar la instalación. Si por ejemplo la hemos instalado desde un cd en el fichero podríamos encontrar líneas similares a esta:  
  
### Instalar paquetes
  
Para instalar paquetes en Debian se usa el comando `apt-get install paquete1 paquete2 paqueteN`. Por ejemplo si se quiere instalar el nautilus y el gdm se pondría:  
  
    apt-get install gdm nautilus

## Desinstalar paquetes
  
Para desinstalar paquetes en Debian se hace poniendo apt-get remove paquete1 paquete2 paqueteN. Por ejemplo para desinstalar el paquete gdm habría que poner lo siguiente:  
  
    apt-get remove gdm
  
Esto desinstalaría el paquete pero deja los archivos de configuración. Si se quiere desinstalar un paquete y remover sus archivos de configuración habría que hacerlo con el comando `apt-get remove --purge` paquete. Por ejemplo si queremos desinstalar el apache y sus archivos de configuración se pondría:  
  
    apt-get remove --purge apache

### Buscar paquetes
  
Para buscar un determinado paquete hay que ejecutar el comando `apt-cache search nombreDelPaquete`. Por ejemplo para buscar el paquete mysql habría que poner:  
  
    apt-cache search mysql
  
Esto mostrara una lista con todos los paquetes que tengan alguna relación con mysql.  
  

### Actualizar la lista de paquetes
  
Para actualizar la lista de paquetes con las últimas versiones disponibles se hace ejecutando el comando apt-get update. Esto buscara en los repositorios que tengamos configurados la lista con las últimos versiones de paquetes disponibles y actualizara nuestra lista de paquetes.  
 
### Actualizar paquetes
 
Si queremos actualizar los paquetes a las nuevas versiones disponibles basta con ejecutar el comando `apt-get upgrade`. Antes de ejecutar el comando lo normal suele ser combinarlo con el comando apt-get update para actualizar la lista de paquetes y una vez actualizada que se actualicen aquellos paquetes de los que haya una versión superior a la disponible. Un ejemplo sería:
  
    apt-get update && apt-get upgrade

Si quisiéramos solo actualizar un paquete del que hemos visto que hay una versión más nueva se hace de la siguiente forma:  
  
    apt-get install mysql-server-4.1

### Configurar apt
  
Para configurar apt si tener que tocar archivos de configuración se puede hacer con el comando `apt-setup`. Este comando nos permite seleccionar de donde queremos obtener los paquetes y en función de donde queremos que se obtengan los paquetes nos hará unas preguntas u otras. Este comando nos permite obtener los paquetes de los siguientes sitios:  
  
* cdrom  
* http  
* ftp  
* sistema de ficheros local  
* editar manualmente la lista de fuentes  

Para el caso de los cdrom nos ira solicitando los cds que queremos ir añadiendo.  
  
Para los casos de http y ftp nos mostrara una lista con los diferentes servidores que hay disponibles para que seleccionemos los que más nos guste.  
  
En el caso de sistema de ficheros local habrá que indicarle donde están los paquetes que deseamos que se instalen.  
  
Por último la opción de editar manualmente la lista de ficheros lo que hace es abrir el fichero `sources.list` con el editor que tengamos asociado para que lo configuremos manualmente a nuestro gusto.  
  
### Borrar paquetes de la cache
  
Cuando se usa apt para instalar programas estos se quedan cacheados en el directorio `/var/cache/apt/archives`.  
Estos archivos no se borran hasta que no se lo indiquemos. El que se queden cacheados sirve por si queremos instalar de nuevo el programa en vez de ir a buscarlo a internet o a nuestras fuentes de apt los busca en el directorio que se han quedado cacheados y así el proceso de instalación es más rápido.  
  
Al quedarse en ese directorio estos van ocupando cierto espacio que en ocasiones puede ser muy grande. Para borrarlos podemos o bien borrar el contenido del directorio o bien con la orden `apt-get clean`.  
  
Existe también el comando `apt-get autoclean` que lo que hace es borrar de la cache aquellos paquetes que sean inútiles.  

## dpkg. El programa utilitario del manejador de paquetes de bajo nivel

Para instalar un paquete deb usamos:  

    # dpkg -i nombredelpaquete.deb

Para remover el paquete instalado, debemos poner:  

    # dpkg -r nombredelpaquete

Como verán para remover el paquete solo necesitamos conocer el nombre del paquete  
  
También podemos usar para remover un paquete el parámetro `--purge` (`-P`)  

    # dpkg -P nombredelpaquete

Con esto removemos la aplicación y los archivos de configuración también, no así con el parámetro `r` (`--remove`) que solo removemos la aplicación y no los archivos de configuración. Ahora si solo queremos ver el contenido del paquete deb podemos poner:

    # dpkg -c nombredelpaquete.deb

  Para obtener información acerca del paquete tal como el nombre del autor, el año en que fue compilado y una descripción corta de su uso podemos poner  

    # dpkg -I nombredelpaquete.deb

Para conocer si tenemos instalado un determinado paquete podemos poner  

    # dpkg -s nombredelpaquete

Si nosotros queremos conocer que archivos nos instala una determinada aplicación podemos poner  

    # dpkg -L nombredelpaquete

Bueno estos son unos pequeños ejemplos de como podemos usar dpkg, si uds. quieren conocer un poco más podemos chequear las páginas man. Si uds son alérgicos a las excesivas líneas de comando pueden usar dselect que es un front-end de dpkg  
  
## GUI front-ends para apt-get

### Aptitude

Esta aplicación aparte de que podemos usar el GUI basado en texto podemos usarla en la linea de comando asi como el `apt-get`.

    # aptitude update
    # aptitude upgrade
    # aptitude dist-upgrade
    # aptitude search nombredelpaquete

Para poder instalar un programa usando aptitude ponemos  

    # aptitude install nombredelpaquete

Para poder quitar ponemos  

    # aptitude remove nombredelpaquete

### Synaptic

Esta es un aplicación gráfica para la gestión de los paquetes.