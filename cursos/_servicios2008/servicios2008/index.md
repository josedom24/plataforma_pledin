---
title: Introducción a los Servicios en GNU/Linux (2008)
---

## Contenidos

1. Introducción a los servicios en GNU/Linux
2. DNS con Bind9
3. DHCPv3
4. OpenLDAP
5. Correo electrónico
6. FTP
7. Puesta en marcha de un servidor LAMP: Linux, Apache, MySQL y PHP
8. Acceso compartido a Internet: proxy y NAT
9. Ficheros en red: NFS, CIFS y mDNS
10. Cortafuegos con iptables

![](img/plantilla0.jpg)


[![](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/)

Introducción a los servicios en GNU/Linux de Alberto Molina Coballes y José Domingo Muñoz Rodríguez tiene licencia [Creative Commons Reconocimiento-Compartir bajo la misma licencia 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/). La versión inicial de este trabajo está en [www.loracep.org](http://www.loracep.org/moodle/course/view.php?id=27).

* [Guia General](files/GuiaGeneral.pdf)
* [Contenido del curso](doc/Contenido_del_curso.html)
* [Solicitud ayuda por desplazamiento](files/BOLSA_DE_AYUDA.pdf)
* [Actividad no presencial](doc/Actividad_no_presencial.html)
* [Curso completo comprimido para exportar a plataforma Moodle](http://www.josedomingo.org/web/file.php/1/cursos_comprimidos/Introduccion_a_los_Servicios_en_GNULinux.zip)

![](img/plantilla1.jpg)

## Introdución

* [Índice de introducción](doc/Indice_de_introduccion.html)

### Documentación

* [Manejar paquetes en Debian](doc/Manejar_paquetes_en_Debian.html)
* [Estructura básica del paquete "servicio"](doc/Estructura_basica_del_paquete_"servicio".html)

### Enlaces recomendados

* [APT HOWTO](http://www.debian.org/doc/manuals/apt-howto/index.es.html#contents)
* [Manual de APTITUDE](http://www.esdebian.org/foro/22093/tutorial-aptitude)
* [All about Linux - A concise apt-get/dpkg primer for new Debian users](http://linuxhelp.blogspot.com/2005/12/concise-apt-get-dpkg-primer-for-new.html)
* [Debian-administration - An introduction to run-levels](http://www.debian-administration.org/articles/212)
* [LinuxTotal - Manual básico de administración de procesos](http://www.linuxtotal.com.mx/index.php?cont=info_admon_012)
* [Configuración de la red Ethernet en Debian](http://ftp.cl.debian.org/man-es/ethernet.html)

### Prácticas

* [Uso básico de APT](doc/Uso_basico_de_APT.html)
* [Trabajando con los repositorios](doc/Trabajando_con_los_repositorios.html)
* [Más opciones de APT](doc/Mas_opciones_de_APT.html)
* [Trabajando con paquetes. Instalando servicios](doc/Trabajando_con_paquetes._Instalando_servicios.html)
* [Niveles de ejecución. Arranque y parada de los servicios](doc/Niveles_de_ejecucion._Arranque_y_parada_de_los_servicios.html)
* [Logs: obteniendo información del sistema](doc/Logs_obteniendo_informacion_del_sistema.html)
* [Configuración básica de red](doc/Configuracion_basica_de_red.html)

![](img/plantilla2.jpg)

## Servidor DNS

* [Índice de DNS](doc/Indice_de_DNS.html)

### Documentación

* [dns.pdf](files/dns.pdf)

### Enlaces recomendados

* [Javier Smaldone - Cómo funciona el DNS](http://blog.smaldone.com.ar/2006/12/05/como-funciona-el-dns/)

### Prácticas

* [Ficheros importantes en la resolución de nombres](doc/Ficheros_importantes_en_la_resolucion_de_nombres.html)
* [Consultas a un servidor DNS con dig](doc/Consultas_a_un_servidor_DNS_con_dig.html)
* [Instalación y configuración de DNSmasq como DNS cache/forward en una red local](doc/Instalacion_y_configuracion_de_DNSmasq_como_DNS_cache_forward_en_una_red_local.html)
* [Instalación y configuración de Bind9 como servidor DNS master en una red local](doc/Instalacion_y_configuracion_de_Bind9_como_servidor_DNS_master_en_una_red_local.html)

![](img/plantilla3.jpg)

## Servidor DHCP

* [Indice de DHCP](doc/Indice_de_DHCP.html)

### Documentación

* [Desde lo alto del Cerro - dns dinámico](http://albertomolina.wordpress.com/dns-dinamico/)

### Enlaces recomendados

* [Servidor DHCP](files/DHCP.pdf)
* [Wikipedia - APIPA](http://es.wikipedia.org/wiki/APIPA)

### Prácticas

* [Instalación del servidor DHCP](doc/Instalacion_del_servidor_DHCP.html)
* [Configuración del servidor DHCP](doc/Configuracion_del_servidor_DHCP.html)
* [DNS dinámico](doc/DNS_dinamico.html)
* [Configuración de un servidor PXE para instalación por red](doc/Configuracion_de_un_servidor_PXE_para_instalacion_por_red.html)
* [postfix_ldap_ou.ldif](doc/postfix_ldap_ou.ldif.html)

![](img/plantilla4.jpg)

## Servidor LDAP

* [Índice de OpenLDAP](doc/Indice_de_OpenLDAP.html)

### Documentación

* [Autenticación LDAP en GNU/Linux](files/autenticacion_ldap.pdf)

### Enlaces recomendados

* [Wikipedia - Listado de servidores LDAP](http://en.wikipedia.org/wiki/List_of_LDAP_software#Server_software)
* [Zytrax.com - LDAP - Object Classes and Attributes](http://www.zytrax.com/books/ldap/ape/)
* [Esquemas de LDAP](http://technology.artifact-software.com/LDAPSchema/ldapschema.html)

### Prácticas

* [Crear manualmente un usuario en UNIX](doc/Crear_manualmente_un_usuario_en_UNIX.html)
* [Crear la estructura básica de un directorio para la autenticación de usuarios](doc/Crear_la_estructura_basica_de_un_directorio_para_la_autenticacion_de_usuarios.html)
* [Configurar un equipo cliente para autenticación mediante LDAP](doc/Configurar_un_equipo_cliente_para_autenticacion_mediante_LDAP.html)

![](img/plantilla5.jpg)

## Servidor de Correo Electrónico

* [Índice de correo electrónico](doc/Indice_de_correo_electronico.html)

### Documentación 

* [Servidor de correo en GNU/Linux con postfix](files/correo-e.pdf)

### Enlaces recomendados

* [Ejemplo de una comunicación SMTP (wikipedia)](doc/Ejemplo_de_una_comunicacion_SMTP__wikipedia_.html)
* [Appendix E: OpenLDAP authldap.schema](http://www.zytrax.com/books/ldap/ape/courier.html)

### Prácticas

* [Instalación y confuguración básica de postfix](doc/Instalacion_y_confuguracion_basica_de_postfix.html)
* [Alias y redirecciones](doc/Alias_y_redirecciones.html)
* [Servidor IMAP y POP](doc/Servidor_IMAP_y_POP.html)
* [webmail](doc/webmail.html)
* [Configuración de postfix para el uso de usuarios virtuales de un directorio LDAP](doc/Configuracion_de_postfix_para_el_uso_de_usuarios_virtuales_de_un_directorio_LDAP.html)
* [Configurar postfix para enviar a través de un relay host autenticado](doc/Configurar_postfix_para_enviar_a_traves_de_un_relay_host_autenticado.html)

![](img/plantilla6.jpg)

# Servidor FTP

* [Indice de servidor FTP](doc/Indice_de_servidor_FTP.html)

### Documentación

* [Servidor FTP: proFTPd](files/proftp2.pdf)

### Enlaces recomendados

* [Instalar proFTPd anónimo bajo Debian](http://null-lab.hacklabs.org/mediaw/index.php/Instalar_Proftp_anonimo_bajo_Debian_en_3,56_minutos)

### Prácticas

* [Instalación y puesta en marcha del servidor proFTPd](doc/Instalacion_y_puesta_en_marcha_del_servidor_proFTPd.html)
* [Servidor proFTPd: Usuarios virtuales con LDAP](doc/Servidor_proFTPd_Usuarios_virtuales_con_LDAP.html)
* [Creación de un FTP Anónimo](doc/Creacion_de_un_FTP_Anonimo.html)

![](img/plantilla7.jpg)

## LAMP: Linux, Apache, mySql, PHP

* [Indice de LAMP](doc/Indice_de_LAMP.html)

### Documentación

* [Presentación Servidor Web](files/pres_apache.pdf)
* [Servidor Apache2. Virtual Hosting. Awstats y webalizer.](files/apache.pdf)
* [Instalación de Apache+PHP+MySQL](doc/Instalacion_de_Apache+PHP+MySQL.html)
* [Presentación: Introducción a la programación de páginas Web dinámicas](files/pressphp.ppt)
* [Instalación de un CMS: Moodle, Joomla](files/web_dinamica2.pdf)

### Enlaces recomendados

* [Qué significa LAMP...](http://es.wikipedia.org/wiki/LAMP)
* [Guía básica sobre Apache](http://dns.bdat.net/documentos/apache/)
* [Manual de referencia de PHP](http://es2.php.net/manual/es/index.php)
* [Manual de referencia de MySql](http://dev.mysql.com/doc/refman/5.0/es/index.html)
* [Instalación de moodle](http://www.cepazahar.org/recursos/file.php/2/tema6/cap06/moodle.html)
* [moodle.org - LDAP authentication](http://docs.moodle.org/en/LDAP_authentication)

### Prácticas

* [Virtual Hosting: Creación y gestión de dos subdominios](doc/Virtual_Hosting_Creacion_y_gestion_de_dos_subdominios.html)
* [Uso de módulos en Apache2: userdir.mod](doc/Uso_de_modulos_en_Apache2_userdir.mod.html)
* [Configuración de awstats para virtual hosting](doc/Configuracion_de_awstats_para_virtual_hosting.html)
* [Instalación de un CMS: Moodle](doc/Instalacion_de_un_CMS_Moodle.html)
* [Autenticación mediante LDAP en moodle](doc/Autenticacion_mediante_LDAP_en_moodle.html)

### Practicas adicionales

* [Instalación de phpmyadmin](doc/Instalacion_de_phpmyadmin.html)
* [Instalación de phpldapadmin](doc/Instalacion_de_phpldapadmin.html)
* [Instalación de squirrelmail](doc/Instalacion_de_squirrelmail.html)

![](img/plantilla8.jpg)

## NAT y Proxy

* [Índice de NAT y proxy](doc/Indice_de_NAT_y_proxy.html)

### Documentación

* [Desde lo alto del Cerro - NAT con iptables](http://albertomolina.wordpress.com/2009/01/09/nat-con-iptables/)
* [Squid, un proxy caché para GNU/Linux](files/squid.pdf)

### Enlaces recomendados

* [Infosofía - Servidor proxy de archivos Debian, Approx](http://infosofia.blogdns.com:8089/2008/01/24/servidor-proxy-de-archivos-debian-approx/)

### Prácticas

* [Configuración de SNAT para la red virtual](doc/Configuracion_de_SNAT_para_la_red_virtual.html)
* [Instalación y configuración de squid](doc/Instalacion_y_configuracion_de_squid.html)
* [Proxy transparente con squid e iptables](doc/Proxy_transparente_con_squid_e_iptables.html)
* [Configuración de un proxy APT con approx](doc/Configuracion_de_un_proxy_APT_con_approx.html)

![](img/plantilla9.jpg)

## NFS, SAMBA y Mdns

* [Índice de ficheros en red: NFS, SAMBA y Mdns](doc/Indice_de_ficheros_en_red_NFS,_SAMBA_y_Mdns.html)

### Documentación

* [Desde lo alto del Cerro - Utilizando mdns en una red local](http://albertomolina.wordpress.com/2008/07/07/utilizando-mdns-en-una-red-local/)
* [Desde lo alto del Cerro - Compartir ficheros con avahi](http://albertomolina.wordpress.com/2008/07/09/compartir-ficheros-con-avahi/)

### Enlaces recomendados

* [wikipedia.org - Portmap](http://en.wikipedia.org/wiki/Portmap)
* [Como compartir directorios NFS con Debian](http://usuarios.lycos.es/caralbornozc/nfs.pdf)
* [Usando SAMBA](http://es.tldp.org/Manuales-LuCAS/USANDO-SAMBA/usando-samba.pdf)
* [Samba HOWTO](http://us1.samba.org/samba/docs/man/Samba-HOWTO-Collection/)

### Prácticas

* [Compartir ficheros usando NFS](doc/Compartir_ficheros_usando_NFS.html)
* [Centralización de usuarios usando LDAP y NFS](doc/Centralizacion_de_usuarios_usando_LDAP_y_NFS.html)
* [Compartir ficheros usando SAMBA](doc/Compartir_ficheros_usando_SAMBA.html)
* [Compartir fichero con Mdns y avahi](doc/Compartir_fichero_con_Mdns_y_avahi.html)

![](img/plantilla10.jpg)

## Cortafuegos con iptables

* [Índice de cortafuegos: iptables](doc/Indice_de_cortafuegos_iptables.html)

### Documentación

* [Script de iptables con política por defecto DROP](files/firewall.sh)

### Enlaces recomendados

* [Pello Altadill - iptables. Manual práctico](http://es.tldp.org/Manuales-LuCAS/doc-iptables-firewall/doc-iptables-firewall-html/)

### Prácticas

* [Cortafuegos elemental con política por defecto ACCEPT](doc/Cortafuegos_elemental_con_politica_por_defecto_ACCEPT.html)
* [Cortafuegos con política por defecto DROP](doc/Cortafuegos_con_politica_por_defecto_DROP.html)
