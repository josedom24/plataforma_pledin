---
title: "Ejercicio: Instalación y configuración de Bind9 como servidor DNS maestro"
---

## Instalación y funcionamiento como dns cache

* Instala el paquete bind9 en avatar
* Modifica el fichero `/etc/resolv.conf` indicando la dirección IP de avatar (servidor DNS)
* Comprueba con dig que el servidor está funcionando como DNS cache y que es capaz de realizar consultas directas a los servidores raíz DNS.

## Instalación y funcionamiento como dns cache maestro

El servidor DNS maestro para acceder a nuestra web desde internet está gestionado por la empresa dyndns.

* Realiza una consulta a tu redirección de dyndns, en nuestro caso:

        dig avatar.dynalias.com

Para nuestra red local vamos a crear un servidor DNS maestro con las siguientes características:

* Dominio DNS: `example.com`
* Segmento de red: 192.168.2.0/24
* Zona de resolución directa: `example.com` en el fichero `db.example`
* Zona de resolución inversa: `168.192.in-addr.arpa` en el fichero `db.192.168`

En las zonas de resolución habrá que poner las siguientes entradas:

* Una entrada donde se indique que avatar es la dirección 192.168.2.1
* Una entrada donde se indique que cliente es la dirección 192.168.2.2

Para poder acceder a nuestra página web desde la red local vamos a crear otra zona de resolución directa avatar.dynalias.com (dominio de dyndns que hayáis reservado) para hacer un alias a avatar. Esta zona estará en el fichero `db.dyndns` y contendrá una entrada:

* Una entrada donde se haga un alias para redirigir nuestro nombre dyndns (`avatar.dynalias.com`) hacia `avatar.example.com`, de esta forma podremos acceder desde el cliente a nuestra página web.
* Una entrada donde se indique que la dirección de nuestro nombre dyndns (`avatar.dynalias.com`) corresponde a 192.168.2.1 (dirección IP de AVATAR), de esta forma podremos acceder desde el cliente a nuestra página web.

**Notas**

1. Modifica los ficheros `/etc/resolv.conf` de avatar y el cliente indicando la dirección IP del servidor DNS (avatar)
2. En el tema anterior hemos conseguido que el cliente tome una dirección IP dinámica, para realizar esta tarea configura una IP fija en el cliente (192.168.2.2). Para ver como sincronizar el servidor DHCP con el DNS mira el tema correspondiente en el nivel intermedio.
3. El fichero `/etc/hosts`, tanto de avatar como del cliente no debe haber indicada ninguna resolución estática.