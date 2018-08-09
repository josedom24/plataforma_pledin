---
title: Compartir fichero con Mdns y avahi
---

Vamos a instalar avahi, que es una implementación de multicastDNS:

1. Comprueba que tienes instalado en mortadelo y en filemon el paquete `avahi-daemon` y `libnss-mdns`
2. Modifica el fichero `/etc/nsswitch.conf` como indica la documentación, en cada una de las máquinas.
3. Comprueba que se esta resolviendo el nombre de la máquina y la IP con la siguiente instrucción (desde cualquiera de las dos máquinas):

        # getent hosts mortadelo.local
        # getent hosts filemon.local


A continuación vamos a compartir directorios usando avahi, vamos a utilizar una herramienta gráfica por lo que vamos a instalarlo en el host con ubuntu.

1. Comprueba que en el host Ubuntu está instalado y configurado avahi.
2. Instala el paquete `gnome-user-share` que nos va a permitir compartir tu directorio público.
3. Comparte tu directorio público con la aplicación que encontrarás en Sistema->Preferencias->Personal File Sharing. Recuerda que tu directorio público lo tendrás que crear y será $HOME/Public
4. Comprueba desde Lugares->Red las carpetas que están compartidas.
