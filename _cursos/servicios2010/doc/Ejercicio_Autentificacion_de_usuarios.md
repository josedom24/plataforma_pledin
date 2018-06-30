---
title: "Ejercicio: Autentificación de usuarios
---

En este ejercicio vamos a ver distintas maneras de utilizar el servicio del proxy-cache. En primer lugar obligaremos al usuario a autentificarse para poder navegar por internet y a continuación introduciremos el concepto de proxy transparente, donde el cliente no tendrá que configurar el navegador y forzaremos que el acceso a internet pase por el proxy-cache.  

## Autentificación de usuarios  

En este primer modelo de uso de squid vamos a obligar a los usuarios a autentificarse para poder acceder a internet.  

1. Vamos a modificar el fichero de configuración de squid para indicar qué programa va a realizar la autentificación de usuarios, en nuestro caso va a realizarlo el programa `/usr/lib/squid/ncsa_auth`, para ello indicamos la siguiente directiva.  
  
        auth_param basic program /usr/lib/squid/ncsa_auth /etc/squid3/passwd

    El fichero `/etc/squid3/passwd` es el que va a contener los usuarios y las contraseñas.  
  
2. En el mismo fichero de configuración vamos a crear una regla ACL , que llamaremos pass_web, donde indicamos que es necesaria la autentificación y vamos a permitir su acceso:  
  
        acl pass_web proxy_auth REQUIRED
        .
        .
        .
        http_access allow hostpermitidos pass_web
  
Si te fijas hemos añadido el ACL pass_web al ACL `hostpermitidos`.  
  
3. Vamos a crear el fichero donde vamos a guardar los usuarios y las contraseñas, y vamos a darle los permiso y los propietarios adecuados.  
  
        # touch /etc/squid3/passwd
        # chmod 600 /etc/squid3/passwd
        # chown proxy:proxy /etc/squid3/passwd

4. Vamos a crear un usuario con la herramienta `htpasswd`, la cual nos pedirá una contraseña que se guardarán en el fichero anterior.  
  
        htpasswd /etc/squid3/passwd nombredeusuario

5. Reiniciamos el servidor squid.  
  
## Proxy transparente  

En contraposición a la navegación a través de un proxy con autenticación que hemos visto anteriormente, existe la posibilidad de configurar squid para que todos los usuarios de una red naveguen a través del proxy sin necesidad de tener que configurar cada una de sus aplicaciones, esto es lo que se denomina proxy transparente. Es más, se hace para que naveguen a través del proxy sin saberlo o sin quererlo, asumiendo todas las restricciones que éste imponga.  
  
La implementación de un proxy transparente se verá en el siguiente tema, ya que es necesario crear una regla de iptables para que todas las peticiones que se hagan al puerto 80 se redireccionen al puerto 3178."