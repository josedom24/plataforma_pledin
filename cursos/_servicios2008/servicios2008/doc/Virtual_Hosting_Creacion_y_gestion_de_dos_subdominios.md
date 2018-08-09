---
title: "Virtual Hosting: Creación y gestión de dos subdominios"
---

El objetivo de esta práctica es la construcción de un sitio web que se pueda asemejar a las necesidades de un centro educativo. En las prácticas posteriores iremos mejorando la solución.  
  
## Definición del problema  
  
Suponemos que el centro educativo ha comprado el siguiente dominio: `ies.org`.  
  
Nosotros vamos a crear dos subdominios (`www.ies.org` y `informatica.ies.org`) que van a ser gestionado por un servidor web Apache2 usando dominios virtuales.  
  
En el primer subdominio (`www.ies.org`) vamos a tener la página del centro donde en una práctica posterior instalaremos un CMS.  
  
El segundo subdominio (`informatica.ies.org`) es donde vamos a alojar la página del departamento de informática y donde los profesores del departamento van a tener sus páginas personales.  
  
Además de esto vamos a tener un servidor ftp (`ftp.ies.org`) que nos permita el mantenimiento de las distintas páginas desde el exterior.  
  
Queremos conseguir la siguiente funcionalidad:  
  
1. La página alojada en el dominio `www.ies.org` sólo la podrán gestionar lel usuario admin.
2. La página alojada en el dominio `informatica.ies.org` sólo la podrán gestionar los usuarios que pertenezcan al grupo profesor.
3. Los profesores o alumnos del departamento tendrá un directorio público `html_public` en su home donde se alojarán sus páginas personales, que se podrán acceder a ellas en la dirección `informatica.ies.org/~usuario` (Esto se realizará usando el módulo `userdir.mod` que veremos en una práctica posterior).
4. En otra práctica implementaremos que cada página ofrezca sus estadísticas usando awstats. 
5. En la última práctica veremos como construir el sistema usando usuario s virtuales guardadores en un directorio LDAP. 
 
## Paso previo 

* Si estamos en un caso real, en el servidor DNS de nuestro proveedor de internet crearemos los tres subdominios apuntando a nuestra IP pública. En nuestro router tendremos redirigido el puerto 80 al oredenador que haga la función de servidor Web. Del mismo modo el router tendrá redirigidos los puertos 20 y 21 al ordenador que funcione como servidor ftp (`ftp.ies.org`).
* En nuestro caso vamos a usar estos nombres de dominios en nuestra red local (mortadelo será el servidor web y ftp, y filemón o nuestra maquina real (Ubuntu) la utilizaremos como cliente. Tenemos dos posibilidades: si tenemos el servidor DNS funcionando crearemos los tres nombres de subdominios apuntando a mortadelo, o tendremos que indicar esa relación en el fichero `/etc/hosts` de los ordenadores donde vamos a probar el servidor.


## Creación de los usuarios y grupos
  
* Crea el usuario admin, que gestionará la página www.ies.org  
* Crea el grupo profesores  
* Crea dos usuarios:  

    * Felisa: que va a ser profesora del departamento y va a tener como grupo principal profesores (`adduser felisa --ingroup profesores`)  
    * Jaime: Que va a ser un usuario normal, por lo que no podrá acceder a la gestión de `informatica.ies.org`  
    
## Configuración de Apache2 para la creación de los subdominios  
  
* Instala apache2 y sigue la documentación para crear dos sitios virtuales (Virual Hosting):  
    *   `www.ies.org`: Que se guardará en `/srv/www/ies`
    *   `informatica.ies.org`: Que se guardará en `/srv/www/infomatica`

    Como ejemplo del fichero de configuración de `www.ies.org` podría quedar:  
  
        <VirtualHost *:80>
         ServerAdmin admin@ies.org
         ServerName www.ies.org
         DocumentRoot /srv/www/ies
        <Directory />
         Options FollowSymLinks
         AllowOverride None
        </Directory>
        <Directory /srv/www/ies>
         Options Indexes FollowSymLinks MultiViews
         AllowOverride None
         Order allow,deny
         allow from all
        </Directory>

* Dentro de cada directorio, puedes crear una página `index.html` donde se de la bienvenida a la página. Prueba desde un navegador que tienes acceso a las dos páginas.  
  
## Pasos finales  
  
* Como el usuario admin va a ser el que vamos a utilizar para gestionar `www.ies.org` desde FTP vamos a modificar el fichero `/etc/passwd` para que su home sea `/srv/www/ies`
* Como la página `informatica.ies.org` sólo se va a poder gestionar por FTP por los usuarios que pertenecen al grupo profesores, el directorio `/srv/www/informatica` lo tenemos que asignar al grupo profesores y poner los permisos adecuados:  

        # chgrp -R profesores /srv/www/informatica
        # chmod -R 770 /srv/www/informatica

  En el home de felisa tendremos que crear un enlace simbólico a `/srv/www/informatica` para que desde el ftp pueda acceder al directorio donde está alojada la página `informatica.ies.org`.  
  
      # ln -s /srv/www/informatica informatica

  Nota: Aunque creemos este enlace simbólico en el home del usuario Jaime, este no podrá acceder al directorio `/srv/www/informatica`, ya que al no pertenecer al grupo profesores no tendrá acceso al directorio.  

  
* Accede por un cliente FTP con los tres usuarios y prueba las funcionalidades que tienen cada uno.