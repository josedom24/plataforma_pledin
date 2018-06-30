---
title: "4.- Configuración inicial del sistema
---

Durante la instalación del sistema la mayoría de los parámetros que comentamos en esta sección quedarán definidos, aunque es conveniente repasar todos ellos para verificar la correcta configuración del sistema y familiarizarnos con algunos ficheros de configuración.  

## Definición de los parámetros de red

Siguiendo el primer esquema de red propuesto:  

![1](../img/alt1.png "1")  

Vamos a determinar la configuración de cada interfaz de red de avatar:  

* eth0: Es la interfaz de red conectada al router o módem (cable-módem), la configuración dependerá del acceso a Internet y el dispositivo que tengamos, podemos tener algunas de estas opciones:

    * Tenemos un router en modo multipuesto: En este caso el equipo avatar debe tener una dirección IP privada, y aunque nuestro router tenga servidor dhcp incorporado, los más adecuado es configurar una dirección IP fija en el mismo segmento que la IP privada del router. Suponiendo que la dirección IP del router es la 192.168.1.1, configuraríamos avatar con los siguientes datos:

        * Dirección IP de eth0: 192.168.1.2
        * Máscara de red: 255.255.255.0
        * Dirección de red: 192.168.1.0
        * Dirección de broadcast: 192.168.1.255
        * Puerta de enlace: 192.168.1.1

    * Tenemos un router monopuesto, módem o cable-módem: En ese caso tendremos la dirección IP pública que nos facilite el ISP en la interfaz de red eth0 de avatar.

* eth1: Será la interfaz a la que se conectará el cliente, tenemos que tener en cuenta que esta interfaz debe estar en otro segmento de red, nosotros vamos a escoger la red 192.168.2.0/24, por lo tanto la configuración de red será la siguiente:

    * Dirección IP de eth1: 192.168.2.1
    * Mascara de red: 255.255.255.0
    * Dirección de red: 192.168.2.0
    * Dirección de broadcast: 192.168.2.255
    * Puerta de enlace: No tiene

El cliente sólo tiene una intefaz de red:

* eth0: Que estará conectada a la misma red que la eth1 de avatar y tendrá la siguiente configuración:

    * Dirección IP de eth0: 192.168.2.2
    * Máscara de red: 255.255.255.0
    * Dirección de red: 192.168.2.0
    * Dirección de broadcast: 192.168.2.255
    * Puerta de enlace: 192.168.2.1


## Configuración de la red

Editamos el fichero:

    /etc/network/interfaces

### IP estática

Un ejemplo de este fichero puede ser el siguiente (las líneas que empiezan por # son comentarios):  

    # The loopback network interface
    auto lo
    iface lo inet loopback

    # The primary network interface
    auto eth0
    iface eth0 inet static
     address 200.89.74.17
     netmask 255.255.255.0
     network 200.89.74.0
     broadcast 200.89.74.255
     gateway 200.89.74.1

La primera interfaz loopback (lo) es una interfaz especial que permite hacer conexiones internas y no debe modificarse. La segunda interfaz definida es eth0, que corresponde a la primera interfaz Ethernet.  

* La entrada `address` corresponde a la dirección IP de la interfaz de red
* La entrada `netmask` corresponde a la máscara de red.
* Las entradas `network` y `broadcast` corresponden al primer y último número del rango del segmento de direcciones IP y son opcionales ya que se pueden deducir de la dirección IP y máscara de red.
* La entrada `gateway` define la dirección IP de la puerta de enlace.

Las modificaciones realizadas en un fichero no tienen nunca efectos sobre el sistema (salvo sobre directorios especiales como `/proc`), para que estas modificaciones se apliquen hay que decir al proceso correspondiente que se lea de nuevo el fichero de configuración, en este caso es el "demonio" networking, el encargado de leer el fichero `/etc/network/interfaces` y podemos invocarlo mediante la instrucción:  

    # /etc/init.d/networking restart

### IP dinámica

Para configurar la red para que toma una dirección dinámica de un servidor DHCP, la configuración de eth0 debe ser:  

    # The primary network interface
    auto eth0
    iface eth0 inet dhcp 

## Instrucciones para gestionar las interfaces de red

### ifconfig  
  
Con esta instrucción puedes visualizar la configuración actual de red o puedes modificarla sin que los cambios permanezcan tras reiniciar el equipo.  
  
### ifup y ifdown  
  
Con estas instrucciones haces que se configure (ifup) o desconfigure (ifdown) una interfaz de red de acuerdo con los parámetros del fichero /etc/network/interfaces, de hecho cuando se invoca al demonio networking, éste realmente utiliza estas dos instrucciones para realizar la configuración de la red.  

    # ifdown eth0
    # ifup eth0

## Configurar avatar como router

Los equipos GNU/Linux no permiten por defecto que los paquetes pasen de una interfaz de red a otra, lo que se conoce como "IP forwarding", para cambiar este comportamiento y que avatar se pueda comportar como un router, hay que activar lo que se denomina el "bit de forward" (darle valor igual a 1). Esto puede hacerse de varias maneras, por ejemplo:  

    echo "1" > /proc/sys/net/ipv4/ip_forward

Si tras ejecutar esta instrucción reiniciásemos el equipo, el bit de forward volvería a su valor nulo. Para que el cambio se mantenga tras reiniciar el equipo podemos incluir la instrucción anterior en algún script que se ejecute al inicio, o editar el fichero `/etc/sysctl.conf` y descomentar la línea:  

    net.ipv4.ip_forward=1

## Resolución de nombres  

Para empezar utilizaremos el servidor DNS de nuestro ISP, aunque posteriormente no será necesario porque el servidor avatar actuará como servidor DNS de toda nuestra red local.  
  
### /etc/hostname  
  
En este fichero se encuentra el nombre de la máquina. Para obtener el nombre de la máquina puedes utilizar la instrucción hostname.  
  
### /etc/hosts  
  
En este fichero se especifican las relaciones entre direcciones IP y nombres de forma estática (sin utililizar DNS). Tras la instalación del sistema este fichero contendrá dos líneas para IPv4:  

    127.0.0.1 localhost
    127.0.1.1 avatar

### /etc/resolv.conf  
  
En este fichero se encuentra las direcciones de los servidores DNS, que nos van a permitir la traducción de nombres a direcciones IP y tendrá una línea por cada servidor DNS que queramos utilizar, por ejemplo utilizando los servidores DNS públicos de Google nos quedarían las líneas:  

    nameserver 8.8.8.8
    nameserver 8.8.4.4"