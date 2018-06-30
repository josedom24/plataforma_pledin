---
title: Estructura básica del paquete "servicio"
---

Binarios propios:

* `/usr/bin` (`/usr/sbin`)

Bibliotecas propias:

* `/usr/lib/servicio/`

Ficheros configurables:

* `/etc/servicio/`: Directorio de ficheros de configuración
* `/etc/default/servicio`: Opciones extra para el inicio o parada del demonio

Ficheros de funcionamiento:

* `/var/log/servicio` (`/var/log/syslog`): Registro de actividad
* `/var/lib/servicio`: Datos modificados durante la ejecución
* `/var/run`: PID y socket
* `/var/lock`: Bloqueos


Documentación:

* `/usr/share/doc/servicio/`: Información del paquete
* `/usr/share/man/`: Páginas del manual

Otros:

* `/etc/init.d/servicio`: Script de manejo del demonio