---
title: Ficheros importantes en la resolución de nombres
---

## /etc/hosts

Fichero para la resolución estática de nombres (normalmente de la red local).

* Incluye nuevas líneas en este fichero para la resolución de nombres de la red local. Las líneas de `/etc/hosts` tienen el formato:

        dirección\_IP nombre\_largo nombre_corto
        127.0.0.1 localhost.localdomain localhost
        192.168.45.123 sauron.mordor.com sauron

* Comprueba su funcionamiento haciendo ping a las máquinas que has incluido.

## /etc/resolv.conf

Fichero que especifica los servidores DNS y los dominios de búsqueda.

* Edita el fichero y cambia la línea `nameserver` por otro servidor DNS que conozcas.
* Mediante la instrucción `host` (del paquete `bind9-host`) o `dig` (del paquete `dnsutils`) comprueba si el funcionamiento es correcto y qué servidor DNS tiene un tiempo de respuesta menor.