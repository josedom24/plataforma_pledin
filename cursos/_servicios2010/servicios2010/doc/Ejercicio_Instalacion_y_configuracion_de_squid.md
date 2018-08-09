---
title: "Ejercicio: Instalación y configuración de squid"
---

## Instalación del proxy-cache squid  

1. Instala el paquete squid en avatar  

## Configuración del proxy-cache squid  

Vamos a realizar la configuración inicial de squid indicando algunos parámetros que pueden mejorar el funcionamiento de la caché:  

1. Cambia la cantidad de memoria RAM asignada al funcionamiento de squid (`cache_mem`) a 64 MB.  
2. Cambia el tamaño máximo de los ficheros que va a guardar (`maximum_object_size`) a 20 MB.  
3. Cambia el tamaño de la cache a 500 MB (`cache_dir`)  
4. Vamos a darle acceso a los ordenadores que están en nuestra red local para ello vamos a crear una regla acl:  
  
        acl hostpermitidos src 192.168.2.0/24

    Y a continuación vamos a darle acceso con  
  
        http_access allow hostpermitidos

    Esta última directiva irá delante de `http_access deny all`
  
5. Reinicia el demonio squid  
  
    Recuerda que las # indican comentarios, por lo tantos las debes quitar para que tengan efecto las modificaciones.  

# Configuración del cliente para acceder a internet a través de squid  
  
En el navegador Mozilla-firefox del cliente, seleccionamos *Editar -> Preferencias -> Avanzado -> Red -> Configuración -> Configuración Manual* del Proxy y en los distintos protocolos ponemos el host correspondiente (avatar.example.com) con el puerto 3128 que es por el que escucha el squid peticiones de sus clientes. Podemos ponerlo en todos los protocolos menos en el socks.  
  
1. Configura el navegador web del cliente, para que utilice el proxy-cache squid de avatar.  
2. Comprueba el acceso del cliente a internet monitorizando el fichero de log de squid `/var/log/squid3/access.log`  
  
    Puedes utilizar la siguiente instrucción para ver el contenido de ese fichero en tiempo real:  

        tail -f /var/log/squid3/access.log

  
Los posibles códigos que nos podemos encontrar en las líneas de ese fichero de log son los siguientes:  

*   **TCP_MISS.** Indica que el objeto solicitado no estaba en la cache.
    
*   **TCP_HIT.** Nos informa de que teníamos en cache una copia válida del objeto que se había pedido. Este mensaje indica que el objeto solicitado estaba en nuestra cache pero había expirado. Realizamos una petición para comprobar si el objeto que contiene nuestra cache es todavía válido. La respuesta nos indica que no ha sido modificado desde que realizamos la anterior petición y por lo tanto se produce un acierto en cache.
    
*   **TCP_REFRESH_MISS.** El objeto solicitado estaba en cache pero su timeout había expirado por lo que se realiza una petición para comprobar si el objeto ha sido modificado desde la petición anterior. La respuesta contiene el nuevo objeto indicando que el objeto que contenía nuestra cache era antiguo y por lo tanto se produce un fallo en cache.
    
*   **TCP_MEM_HIT.** Indica que el objeto solicitado residía en cache y tambíén en memoria por lo que no se tiene que leer del disco,y por lo tanto, se produce un acierto.