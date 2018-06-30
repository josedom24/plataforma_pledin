---
title: Configuración de SNAT para la red virtual
---

Tenemos la siguiente estructura de red: ![red virtual inicial](../img/red-virtual1.png "red virtual inicial")  

Todos los equipos de la red virtual 10.0.0.0/24 están conectados a través del switch virtual. El acceso a la red externa de Mortadelo (10.0.0.10) es mediante el dispositivo de NAT de VMware, que aparece en la imagen con dirección IP 10.0.0.2. Podemos verificar esto viendo la tabla de encaminamiento de mortadelo:  

    route -n

donde comprobamos que la puerta de enlace para cualquier destino (0.0.0.0/0) es la 10.0.0.2 (dispositivo de NAT).  
  
Puesto que queremos aprender cómo hace NAT un equipo GNU/Linux, utilizaremos el equipo que actúa como host como dispositivo de NAT y prescindiremos del dispositivo de NAT de VMware.  

## Eliminar el dispositivo de NAT de VMware

En el host utilizamos la siguiente instrucción:  

    ps aux |grep -i NAT

localizamos el PID del proceso NAT de VMware y lo matamos con:  

    kill -9 PID

O simplemente ejecutamos:  

    kill $(ps aux |grep -i NAT| grep -v grep |awk '{print $2}')

Otra opción sería eliminar las líneas de configuración de VMware que levantan el dispositivo NAT.

## Activar el bit de forward

Por defecto un equipo GNU/Linux no permite que se pasen paquetes entre sus interfaces de red, pero si queremos que actúe como router o como dispositivo de NAT tenemos que cambiar este comportamiento, activando lo que se denomina bit de forward de alguna de las siguientes maneras:

### Directamente

Escribimos:

    echo 1 > /proc/sys/net/ipv4/ip_forward

### sysctl

De forma alternativa podemos utilizar `sysctl`, que permite configurar parámetros del kernel mientras se ejecuta:

    sysctl net.ipv4.ip_forward=1

### De forma definitiva: /etc/sysctl.conf

Los dos métodos anteriores son equivalentes pero no permanecen tras un reinicio del equipo, para que este cambio se efectúe cada vez que se arranca el equipo editamos el fichero `/etc/sysctl.conf`, buscamos la línea `net.ipv4.ip_forward=1` y la descomentamos.

## SNAT con iptables

En el host escribe la siguientes instrucciones para borrar todas las reglas de la tabla nat anteriores y poner los contadores a cero:

    iptables -t nat -F
    iptables -Z 

Ahora escribe la instrucción de iptables que hace que el host actúe como dispositivo de NAT para la red virtual:

    iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j SNAT --to 192.168.1.15

donde hemos supuesto que 192.168.1.15 es la dirección que tiene el host en la interfaz de red real conectada a la red local. Si la dirección IP externa del equipo que hace NAT fuese dinámica, tendríamos que sustituir la instrucción anterior por:

    iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE

## Modificar la puerta de enlace de los equipos de la red virtual

Puesto que ya no existe el dispositivo de NAT de VMware, tenemos la siguiente estructura de red:  

![red virtual final](../img/red-virtual2.png "red virtual final")  

Ahora tendremos que configurar los equipos de la red virtual para que tengan la dirección IP 10.0.0.1 como puerta de enlace (gateway) en lugar de la 10.0.0.2. Para ello, edita el fichero `/etc/network/interfaces` de las máquinas virtuales y reinicia el demonio de red:  

    /etc/init.d/networking restart

Comprueba la nueva tabla de encaminamiento y si el equipo tiene conexión con la red exterior.
