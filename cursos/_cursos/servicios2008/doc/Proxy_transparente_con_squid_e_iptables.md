---
title: Proxy transparente con squid e iptables
---

Supongamos que en una red local tenemos acceso a Internet mediante SNAT, pero instalamos un servidor proxy para agilizar la navegación y controlar el acceso. Si queremos que los equipos de la red utilicen el proxy hay, en principio, dos opciones:

* Cerramos el puerto destino 80/tcp para paquetes que salgan de la red local, de manera que todos los equipos que quieran salir a Internet tendrán que hacerlo a través del proxy configurándolo manualmente.
* Redirigimos todos los paquetes que salgan de la red local con destino el puerto 80/tcp al puerto local donde está escuchando el proxy (3128/tcp normalmente en squid), que se denomina "proxy transparente".

La última es muy cómoda y efectiva porque no hay que configurar nada en los equipos de la red local y todos atravesarán el proxy.

## proxy transparente con squid e iptables

Edita el fichero `/etc/squid/squid.conf` y modifica la línea `http_port` de la siguiente manera:

    http_port 3128 transparent
    
Escribe la siguiente línea de iptables en el host de VMware:

    iptables -A PREROUTING -s 10.0.0.0/24 -i vmnet8 -p tcp --dport 80 -j REDIRECT --to-port 3128

Comprueba que mortadelo y filemon pasan a través del proxy intentando acceder a algún dominio no permitido.
