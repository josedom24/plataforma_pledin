# Utilización de DNS dinámico en una red local

## DNS dinámico

### Ventajas de utilizar DNS dinámico

Suponemos que actualmente tenemos instalado en nuestro servidor avatar un servidor DNS caché que da servicio a los ordenadores de nuestra intranet y además actúa como servidor maestro (master) de un dominio DNS (`example.com` será el que utilizaremos siempre puesto que está reservado para pruebas y documentación), de forma que todos los equipos de la red local tengan un nombre DNS completo o FQHN (Full Qualified Host Name). Por otra parte, tenemos instalado en avatar un servidor DHCP para que asigne direcciones IPv4 únicas a los equipos de la red local y les facilite el resto de parámetros necesarios para tengan conectividad y salida a Internet.

 Las características del servidor DNS serán:

* El nombre del servidor DNS para la zona `example.com` será nuestro servidor, es decir, `avatar.example.com` (registro NS).
* En un primer momento el único nombre que resuelve nuestro servidor será el suyo propio, `avatar.example.com`, que corresponde a la dirección 192.168.2.1.

Las características del servidor DHCP instalado serán:

* Tiempo de concesión: 1 mes
* Rango de direcciones: 192.168.2.100 - 192.168.2.150
* Puerta de enlace: 192.168.2.1
* Servidores DNS: 8.8.8.8 y 8.8.4.4

En este tema se presenta la forma de coordinar ambos servicios de manera que cuando el servidor DHCP ceda una dirección IPv4 del rango que tiene asignado a los clientes, realice una actualización de la zona directa `example.com` y de la zona inversa `2.168.192.in-addr.arpa` gestionadas por el servidor DNS, de manera que sea posible acceder a los equipos de la red local mediante su nombre.

### Pasos previos

Hay varios mecanismos de resolución de nombres y los que utilice una máquina GNU/Linux se especifican en el fichero `/etc/nsswitch.conf`, que contiene una línea como:

    hosts: files dns

que indica los métodos que se van a utilizar para la resolución de nombres de equipos y el orden en el que se va a hacer, es decir, en primer lugar se va a consultar el fichero `/etc/hosts` y si no se consigue resolver el nombre del equipo se va a consultar a los servidores DNS que estén configurados en el fichero `/etc/resolv.conf`.

Para que los registros que incluyamos en el servidor DNS de forma dinámica sean efectivos, debemos comprobar que no existe ninguna línea para los equipos avatar y cliente en los ficheros `/etc/hosts` de ambos equipos y verificar que ambos tienen como servidor DNS sólo a avatar.

La forma de configurar Bind9 y DHCP3-server para que actualicen de forma dinámica los nombres de los equipos de la red local se detalla en el documento pdf siguiente.