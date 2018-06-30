---
title: Configuración de un proxy APT con approx
---

Instala el paquete approx en mortadelo mediante:

    aptitude install approx

Edita el fichero `/etc/approx/approx.conf` y define las réplicas http que quieres utilizar, por ejemplo:

    debian http://ftp.es.debian.org/debian
    security http://security.debian.org/debian-security

Reinicia el demonio de approx. Edita el fichero `/etc/apt/sources.list` de mortadelo y deja las siguientes líneas:

    deb http://127.0.0.1:9999/debian lenny main contrib non-free
    deb http://127.0.0.1:9999/security lenny/updates main contrib

Realiza una actualización del sistema con:

    aptitude update
    aptitude full-upgrade

Edita ahora el fichero `/etc/apt/sources.list` de filemon y deja las siguientes líneas:

    deb http://10.0.0.10:9999/debian lenny main contrib non-free
    deb http://10.0.0.10:9999/security lenny/updates main contrib

Repite la actualización del sistema como en mortadelo y disfruta con la velocidad de descarga :-)

