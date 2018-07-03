---
title: "Configuración del servidor DHCP"
---

## Configuración del servidor
 
El fichero de configuración de DHCP es:  
  
    /etc/dhcp3/dhcpd.conf

El fichero de configuración está dividido en dos partes:  
  

* Parte principal (valores por defecto): especifica los parámetros generales que definen la concesión y los parámetros adicionales que se proporcionarán al cliente.  
* Secciones (concretan a la principal)
    * Subnet: Especifican rangos de direcciones IPs que serán cedidas a los clientes que lo soliciten.
    * Host: Especificaciones concretas de equipos.  
    
En la parte principal podemos configurar los siguientes parámetros, que más tarde podremos reescribir en las distintas secciones:  
  
* `max-lease-time`: Tiempo de concesión de la dirección IP  
* `option routers`: Indicamos la dirección red de la puerta de enlace que se utiliza para salir a internet.
* `option domain-name-server`: Se pone las direcciones IP de los servidores DNS que va a utilizar el cliente.
* `option domain­name`: Nombre del dominio que se manda al cliente.
* `option subnet­mask`: Subred enviada a los clientes.
* `option broadcast­address`: Dirección de difusión de la red.
 
Al indicar una sección Subnet tenemos que indicar la dirección de la red y la mascara de red, por ejemplo:  

    subnet 192.168.0.0 netmask 255.255.255.0

A continuación y entre llaves podemos poner los siguientes parámetros:  

* `range`: Indicamos el rango de direcciones IP que vamos a asignar.
* Alguno de los parámetros que hemos explicado en la sección principal.  

Ejemplo de configuración de la sección subnet puede ser:  

    subnet 192.168.0.0 netmask 255.255.255.0 {
    option routers 192.168.0.254;
    option domain­name­servers 80.58.0.33, 80.58.32.97;
    range 192.168.0.60 192.168.0.90;
    } 

* Lo primero que vamos a hacer es cambiar el tiempo de concesión de las direcciones IP cambiando el parámetro `max-lease-time` del fichero de configuración (hay que indicarlo en segundo). Pon el tiempo a 24 horas.
* A continuación crea una sección subnet con los siguientes datos:  
    * Rango:  
    * Puerta de enlace:  
    * Servidores DNS:
* Arranca el servicio DHCP y comprueba que se está ejecutando.
* Vamos a configurar el cliente DHCP. Comprueba antes si está instalado en el ordenador cliente.
* Tenemos que indicarle al servidor la interfaz de red por donde va a ofrecer direcciones IP. Para ello edita el fichero `/etc/default/dhcp3-server` e indica la intefaz de red en el parámetro INTERFACES.
* Configura el servidor para que od direcciones IP dinámicamente. Cuando lo hagas, y tras haber arrancado de nuevo la red del cliente, comprueba que ha tomado una IP del rango del servidor DHCP.  

## Reservas

Veamos la sección host, en ella configuramos un host para reservar una dirección IP para él.  
  
En una sección host debemos poner el nombre que identifica al host y los siguientes parámetros:  

* `hardware ethernet`: Es la dirección MAC de la tarjeta de red del host.
* `fixed-adress`: La dirección IP que le vamos a asignar.
* Podemos usar también las opciones ya explicadas en la sección principal.

Ejercicios a realizar:

* Utilizando la instrucción `ifconfig` obtén la dirección MAC de la interfaz de red de tu cliente.
* Crea en el servidor DHCP una sección HOST para conceder a tu cliente una dirección IP determinada.
* Obtén una nueva dirección IP en el cliente y comprueba que es la que has asignado por medio de la sección host.

