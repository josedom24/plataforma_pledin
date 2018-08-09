---
title: Configuración de un servidor PXE para instalación por red
---

Este sistema tiene dos componentes:  

* Servidor DHCP que da una dirección de forma automática al equipo que se enciende.
* Servidor TFTP que envía al equipo una imagen similar a la que incluyen los CD de instalación.

## Instalación del servidor TFTP

* Instala el paquete tftpd-hpa
* Verifica que el fichero `/etc/defaults/tftpd-hpa` contiene las líneas:

        RUN_DAEMON="yes" OPTIONS="-l -s /var/lib/tftpboot" 

* Crea el directorio para alojar las imágenes:

        mkdir -p /var/lib/tftpboot

* Reinicia el servicio  
    
## Instalación por red de Debian Lenny

Muchas distribuciones GNU/Linux incluyen imágenes hechas para la instalación por red con PXE.  

* Descarga con wget la imagen de instalación por red de Debian Lenny, disponible en: [  
http://ftp.debian.org/debian/dists/lenny/main/installer-i386/current/images/netboot/netboot.tar.gz](http://ftp.debian.org/debian/dists/lenny/main/installer-i386/current/images/netboot/netboot.tar.gz)  
* Descomprime este archivo en el directorio `/var/lib/tftp/`

## Configuración del servidor DHCP

* Edita el fichero `/etc/dhcp3/dhcpd.conf` e incluye la línea:

        filename "pxelinux.0";

    Dentro del párrafo que identifica la red para la que quieras ofrecer el servicio de instalación por red.  
* Enciende un equipo en la red y comprueba que es capaz de cargar el sistema de instalación por red.

