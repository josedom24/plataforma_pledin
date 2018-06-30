---
title: "Uso de módulos en Apache2: userdir.mod"
---

El objetivo de esta práctica es usar el módulo `userdir.mod` de apache2 que nos va a permitir que cada usuario tenga un directorio público en su home (`public_html`) donde guardará su página personal.  
  
De esta manera los profesores o alumnos del departamento podrán tener su página personal en la dirección `http://informatica.ies.org/~usuario`.  
  
Los módulos se guardan en `/etc/apache2/mods-available` para activarlo lo que tenemos que hacer es crear los enlaces virtuales a los archivos necesarios dentro del directorio `/etc/apache2/mods-enabled`.  
  
En nuestro caso:  
  
    # cd /etc/apache2/mods-enabled
    # ln -s ../mods-available/userdir.conf userdir.conf
    # ln -s ../mods-available/userdir.load userdir.load

En este caso el módulo se activa para los dos dominios virtuales, para que solo funcione en informatica.ies.org:

* Dentro del fichero de configuración del dominio informatica.ies.org incluimos los ficheros necesarios para activar el módulo:  
  
        # Include /etc/apache2/mods-available/userdir.conf
        # Include /etc/apache2/mods-available/userdir.load

* Reinicia el servidor web.  
* Crea en el home de un usuario un directorio public_html con los permisos adecuados y un fichero `index.html` dentro de él. Comprueba desde un navegador que se puede visualizar la página en `informatica.ies.org/~usuario`