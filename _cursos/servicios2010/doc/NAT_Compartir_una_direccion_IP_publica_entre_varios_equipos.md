---
title: "1.- NAT: Compartir una dirección IP pública entre varios equipos
---

## NAT

NAT son las siglas del inglés _Network Address Translation_ o traducción de direcciones de red y es un mecanismo que se usa ampliamente hoy en día, fundamentalmente porque permite _compartir_ una dirección IP pública por muchos equipos y esto es imprescindible en muchas situaciones por la escasez de direcciones IPv4.

Existen diferentes tipos de NAT, dependiendo de si se cambia la dirección IP origen o la dirección IP destino del paquete que abre la conexión, incluso existe una extensión de NAT que permite modificar el puerto origen o destino. Estos tipos de variantes de NAT reciben diferentes nombres dependiendo de la implementación, aunque más que el nombre lo importante es saber las posibilidades de NAT y aquí presentamos los nombres más utilizados cuando se implementa NAT con iptables.

### Source NAT

Este tipo de NAT es en el que **se cambia la dirección IP de origen**, es la situación más utilizada cuando estamos utilizando una dirección IP privada (RFC 1918) en una red local y establecemos una conexión con un equipo de Internet. Un equipo de la red (normalmente la puerta de enlace) se encarga de cambiar la dirección IP privada origen por la dirección IP pública, para que el equipo de Internet pueda contestar. Los pasos que se seguirían serían algo como:

* Un equipo de una red local con una dirección IP privada (supongamos 192.168.3.14) quiere solicitar una página web (puerto 80/tcp) del equipo de Internet `www.wordpress.com`
* Realiza una consulta DNS y obtiene que el equipo que aloja dicha página tiene la dirección IP 76.74.254.126
* Consulta su tabla de encaminamiento y como no está en la misma red que el servidor web de wordpress, envía el paquete con la solicitud de la página al equipo que es su destino por defecto (puerta de enlace o gateway), que supongamos tiene la dirección 192.168.3.254.
* El gateway, que en este caso debe actuar como dispositivo de NAT, recibe el paquete y comprueba la dirección IP destino, como no es la suya, lo envía a su propio destino por defecto (gateway) que ya será una dirección IP pública.
* Antes de que el paquete salga por la interfaz de red externa, se le cambia la dirección IP origen (192.168.3.14) por la dirección IP pública (supongamos que fuese 80.58.1.14) y se guarda la petición en lo que se denomina tablas de NAT (anotando también el puerto origen, supongamos que fuese el 5015/tcp).
* El paquete viaja por Internet saltando de router a router hasta que llega a su destino
* El equipo 76.74.254.126 recibe una petición desde la dirección 80.58.1.14 y la contesta, por lo que el paquete de vuelta llevará ahora dirección IP origen 76.74.254.126, dirección IP destino 80.58.1.14, puerto origen 80/tcp y puerto destino 5015/tcp.
* La contestación del servidor web de `wordpress.com` llega a la interfaz externa del dispositivo de NAT, que consulta las tablas de NAT y comprueba (gracias al puerto origen) que corresponde con una petición realizada desde el equipo 192.168.3.14, por lo que modifica la dirección IP destino por ésta y se lo envía directamente.

### IP masquerading

Este tipo de NAT normalmente es sinónimo de SNAT, pero iptables distingue dos casos:

* SNAT: Cuando la dirección IP pública que sustituye a la IP origen es estática (SNAT también significa Static NAT).
* MASQUERADE: Cuando la dirección IP pública que sustituye a la IP origen es dinámica, caso bastante habitual en conexiones a Internet domésticas.

### Destination NAT o port forwarding

Este tipo de NAT se utiliza cuando tenemos algún servidor en una máquina detrás del dispositivo de NAT. En este caso será un equipo externo el que inicie la conexión, ya que solicitará un determinado servicio y el dispositivo de NAT, en este caso, debe **modificar la dirección IP destino**. Veamos paso a paso cuál sería la situación.

* Un equipo cualquiera de Internet, con dirección IP pública 150.212.23.6 desea conectarse por ssh (22/tcp) al equipo `estudio.mired.com`
* Realiza una consulta DNS y obtiene como respuesta que `estudio.mired.com` tiene la dirección IP 85.136.14.7
* Establece la conexión (supongamos puerto origen 23014/tcp) con el equipo 85.136.14.7, que resulta ser un dispositivo de NAT que no tiene ningún servicio ssh escuchando en el puerto 22/tcp, pero que tiene una regla de DNAT para que todo lo que llegue a ese puerto se lo envíe a un equipo de su red local (supongamos que fuese el 10.0.0.2), por lo que cambia la dirección IP destino (85.136.14.7) por la 10.0.0.2 y lo registra en sus tablas de NAT.
* Al equipo 10.0.0.2 llega un solicitud al puerto 22/tcp y la respuesta tiene las siguientes características: IP origen 10.0.0.2, puerto origen 22/tcp, IP destino 150.212.23.6 y puerto destino 23014/tcp.
* El dispositivo de NAT cambia ahora la dirección IP origen por su dirección IP pública (85.136.14.7) y el paquete llega de vuelta a su destino.

## NAT en nuestro entorno de trabajo

¿Qué vamos a implementar nosotros? Pues los dos tipos de NAT, aunque dependiendo de la configuración que tengamos haremos NAT con el router que nos da acceso a Internet o directamente en avatar.

### Utilización del router como dispositivo de NAT

En este caso avatar tiene una dirección IP privada en eth0 y el dispositivo encargado de hacer SNAT y DNAT es nuestro router doméstico. El SNAT viene activado por defecto, puesto que es el mecanismo que nos permite que cualquier equipo de la red local tenga acceso a Internet utilizando la dirección IP pública que tiene asignado el router de casa.

El caso de DNAT es diferente porque en principio está deshabilitado y hay que "ir abriendo puertos" de los servicios que queramos que estén accesible desde el exterior. En nuestro caso sólo queremos que esté accesible en principio el servidor web, por lo que deberemos configurar el router para que las peticiones que lleguen con destino el puerto 80/tcp se pasen a avatar. La forma de hacer esto es propia de cada router y aquí presentamos alguna captura de pantalla de un modelo concreto de router (Linksys WRT54G):

![linksys-dnat](../img/linksys-dnat.jpg "linksys-dnat")


Puedes encontrar información de otros routers en los siguientes enlaces:

Telefónica

**ZyXEL: [http://www.adslzone.net/tutorial-20.2.html](http://www.adslzone.net/tutorial-20.2.html)**
XAVI: [http://www.adslayuda.com/xavi7768-abrir_puertos.html](http://www.adslayuda.com/xavi7768-abrir_puertos.html)
Comtrend[: http://www.adslayuda.com/comtrend\_536-gestion\_puertos.html](http://www.adslayuda.com/comtrend_536-gestion_puertos.html) (este lo usa jazztel también).

Jazztel

[http://www.adslayuda.com/comtrend\_536-gestion\_puertos.html](http://www.adslayuda.com/comtrend_536-gestion_puertos.html)

*jazztel al igual que telefónica usan este modelo, y el 5361+ (para jazztelia e imagenio), pero con el tutorial de antes te vale, es el mismo.

Tele2

Tesley: [http://www.adslzone.net/tutorial-55.5.html](http://www.adslzone.net/tutorial-55.5.html)

Vodafone

[http://www.adslzone.net/tutorial-79.4.html](http://www.adslzone.net/tutorial-79.4.html)

Ono

Thompson: [http://www.adslzone.net/tutorial-52.1.html](http://www.adslzone.net/tutorial-52.1.html)
Xavi[: http://www.adslzone.net/postt189549.html](http://www.adslzone.net/postt189549.html)

Orange

Sagem: Es la misma interfaz que el comtrend: [http://www.adslzone.net/comtrend536.html](http://www.adslzone.net/comtrend536.html)

### Utilización de avatar como dispositivo de NAT

Si no tenemos un router que haga nat, por ejemplo porque accedemos con un módem o cable-módem, tendremos que configurar avatar como dispositivo de NAT con `iptables`. En este caso no hará falta configurar DNAT, puesto que las peticiones de Internet llegan directamente a avatar, para hacer SNAT tendremos que ejecutar la siguiente instrucción de `iptables` cada vez que iniciemos el equipo:

    iptables -t nat -A POSTROUTING -o eth0 -s 192.168.2.0/24 -j MASQUERADE

Una forma sencilla de ejecutar esta instrucción cuando levantemos la interfaz de red eth1 (la que se conecta con nuestra red local) es poner en el fichero `/etc/network/interfaces` lo siguiente:

    auto eth1
    iface eth1 inet static
     address 192.168.2.1
     netmask 255.255.255.0
     up iptables -t nat -A POSTROUTING -o eth0 -s 192.168.2.0/24 -j MASQUERADE
     down iptables -t nat -D POSTROUTING -o eth0 -s 192.168.2.0/24 -j MASQUERADE

(Los participantes del curso básico tendrán ocasión de "divertirse" con iptables en la unidad 5 :-) )"