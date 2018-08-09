---
title: Contenido del curso
---

1.Introducción a los servicios en GNU/Linux

* Manejo elemental de APT y dpkg
* Estructura habitual de un paquete de un demonio
* Niveles de ejecución, parada y puesta en marcha de los servicios, gestión de procesos, señales, etc.
* Aspectos fundamentales de configuración de red: ifconfig y ficheros de configuración.

2.DNS con Bind9

* Tipos de servidores DNS
* Consultas a servidores DNS mediante dig
* Configuración de un DNS master, forward o cache para una RAL

3.DHCPv3

* Configuración de un servidor DHCP en una RAL
* Integración de DHCP con DNS

4.OpenLDAP

* Aspectos fundamentales de LDAP
* Configurar un servidor openLDAP para la gestión centralizada de cuentas de usuario

5.Correo electrónico

* Tipos de servidores de correo, re-envío de correo (relay), redireccionamiento, etc.
* Configuración del SMTP postfix para envío de correo a través del SMTP de gmail.
* Configuración del resto de componentes de un servidor de correo: POP, IMAP, usuarios virtuales, filtrado de correo, webmail, etc.

6.FTP

* Configuración básica. FTP anónimo
* Usuarios virtuales en MySQL
* Usuarios virtuales en LDAP

7.Puesta en marcha de un servidor LAMP: Linux, Apache, MySQL y PHP

* Configuración de LAMP en un equipo propio
* Gestión de un LAMP remoto (hosting, housing, servidor dedicado, etc.)

8.Acceso compartido a Internet: proxy y NAT

* Squid como proxy web para una LAN
* Instalar un proxy para paquetes debian en la red local: approx
* Otros servicios a través de proxy
* NAT con iptables: SNAT y DNAT


9.Ficheros en red: NFS, CIFS y mDNS

* NFS3 y NFS4
* Redes heterogéneas: SAMBA
* mDNS con Avahi

10.Cortafuegos con iptables

* Configurar un cortafuegos con política por defecto DROP