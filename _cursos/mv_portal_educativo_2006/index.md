---
title: Máquinas virtuales para la puesta en marcha de un portal educativo (2006)
permalink: /:collection/:path
---


## Objetivos

1. Uso de máquinas virtuales para el desarrollo del módulo *Redes de Área Local* y otros módulos orientados a la administración de sistemas informáticos.
2. Puesta en marcha de un portal educativo.
3. Configuración y securización de una infraestructura típica de un portal para un centro educativo (extensible para un entorno real de empresas): intranet/MZ, DMZ, router, cortafuegos, proxy, dns, web, ftp, etc. Puesta en marcha de una plataforma virtual educativa. Servicios securizados.
4. El objetivo de este curso no es dar una visión en profundidad de los servicios,  sino el cómo montarlos haciendo uso de máquinas virtuales, que posibilite el desarrollo de unas  prácticas más completas a los alumnos, y al mismo tiempo les permitan tener  una visión global  e integradora de una infraestructura real.
5. Homogeneizar la programación didáctica del módulo de Redes de Área Local y de otros módulos orientados a la administración de sistemas informáticos.
6. Los servicios se montarán en linux.

* [Contenido del curso](files/temario.pdf)

## Máquinas Virtuales

### Documentación del curso


* [Introducción a la virtualización](files/Intro_virt.pdf)
* [Instalación y configuración de Xen 3.0](files/xen_es_tldp.tgz)
* [Instalación Xen 3.0](files/curso_xen.pdf)
* [Instalación VMware Server 1.0](files/vmware_inst.pdf)
* [Configuraciones de red en sistemas virtuales](files/redes_xen_vmware.pdf)

### Documentación y recursos (inglés)

* [Manual de usuario de Xen 3.0](files/user-xen.pdf)
* [Wiki de Xen](http://wiki.xensource.com)
* [Documentación VMware Server](http://www.vmware.com/support/pubs/server_pubs.html)

### Actividades

* [Instalar Xen en modo puente](doc/Instalar_Xen_en_modo_puente.html)
* [Instalar VMware Server con la configuración de red por defecto](doc/Instalar_VMware_Server_con_la_configuracion_de_red_por_defect.html/)
* [Modificar GRUB para incluir otro núcleo para Xen](doc/Modificar_GRUB_para_incluir_otro_nucleo_para_Xen.html)

## Creación de una red virtual con DMZ y MZ

* [Crear una red virtual con Xen, segmentada en dos subredes.](doc/Crear_una_red_virtual_con,_segmentada_en_dos_subredes.html)
* [Crear una red virtual con VMware Server, segmentada en dos subredes.](doc/Crear_una_red_virtual_con_VMware_Server,_segmentada_en_dos_subredes.html)

## Cortafuegos con IPtables

* [Introducción a los cortafuegos (UOC)](files/UOC_cortafuegos.pdf)
* [Tutorial de IPtables de Pello Xabier Altadill](files/IPtables_pello.pdf)
* [Implementar un cortafuegos](doc/Implementar_un_cortafuegos.html)

## Servidor Apache. webalizer y awstats

* [Presentación Servidor Web](files/pres_apache.pdf)
* [Servidor Apache2. Virtual Hosting. Awstats y webalizer.](files/apache.pdf)
* [Configurar dos subdominios](doc/Configurar_dos_subdominios.html)
* [Configuración de awstats para virtual hosting](doc/Configuracion_de_awstats_para_virtual_hosting.html)

## Servidor ftp

* [Presentación Servidor Ftp](files/pres_proftpd.pdf)
* [Servidor ftp - proFTPd](files/proftp2.pdf)
* [Crear un ftp anónimo](doc/Crear_un_ftp_anonimo.html)

## Squid proxy-cache

* [Squid FAQ](http://www.squid-cache.org/Doc/FAQ/FAQ.html)
* [Squid, un proxy caché para Linux](files/squid.pdf)
* [Implementar squid como proxy transparente para la red local](doc/Implementar_squid_como_proxy_transparente_para_la_red_local/)

## Dnsmasq como servidor DNS para una RAL

* [Servidor de nombres DNS. DNSmasq](files/dns.pdf)

## Páginas web dinámicas. Implantación del portal educativo

* [Presentación webs dinámicas](files/pres_web_dinamicas.pdf)
* [Paginas web dinamicas. Implantacion del portal educativo. Moodle y Joomla!](files/web_dinamica2.pdf)
* [Instalar xoops](doc/Instalar_xoops/)

## Servidor de correo electrónico. Postfix

* [Servidor de correo en GNU/Linux con Postfix + MySQL + Courier
  IMAP + Courier POP + Squirrelmail + Amavis + Clamav + Spamassassin](files/correo-e.pdf)

## Seguridad

* [Seguridad en UNIX y en redes](files/unixsec-2.1.pdf)
* [Materiales libres. Máster de Software libre de la UOC](http://www.uoc.edu/posgrado/matricula_abierta/web/materiales_libres.html)
