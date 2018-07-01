---
title: Servicios en GNU/Linux (Nivel Intermedio) (2011)
---
## Objetivos

* Instalar y configurar servicios en GNU/Linux. (NIVEL INTERMEDIO)
* Configurar los componentes de un servidor de correo completo.
* Profundizar en el manejo del servidor web apache.
* Administrar de forma desatendida las zonas DNS mediante actualizaciones DHCP.
* Profundizar en el conocimiento de servicios en sistemas GNU/Linux, tratando aplicaciones habituales como Kerberos, LDAP o NFS4.
* Monitorizar el servidor y realizar tareas de actualización y copias de seguridad.

## Contenidos

* Servidor de correo con postfix, dovecot, spamassasin, clamav, amavis y squirrelmail.
* Servidor apache: Módulos. HTTPS
* Sincronización de ISC DHCP3 y Bind9: DNS dinámico.
* Sistema centralizado de cuentas: Kerberos, OpenLDAP y NFS4.
* Estado del sistema, actualizaciones, copias de seguridad.

[![](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/)

Servicios en GNU/Linux (Nivel intermedio) de Alberto Molina Coballes, José Domingo Muñoz Rodríguez y José Luis Rodríguez Rodríguez tiene licencia [Creative Commons Reconocimiento-Compartir bajo la misma licencia 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).

## Unidad 0.- Puesta en marcha

* [Preguntas y respuestas](doc/Preguntas_y_respuestas.html)
* [Instalación del sistema operativo](doc/Instalacion_del_sistema_operativo.html)

## Unidad 1.- Sincronización de ISC DHCP3 y Bind9: DNS dinámico

* [Índice: DNS dinámico](doc/Indice_DNS_dinamico.html)
    * [Utilización de DNS dinámico en una red local](doc/Utilizacion_de_DNS_dinamico_en_una_red_local.html)
    * [DNS dinámico](files/ddns.pdf)
    * [Tarea: DNS dinámico](doc/Tarea_DNS_dinamico.html)

### Recursos de interés 

* [Documentación: Instalacion y configuración del servidor DHCP [dhcp.pdf]](http://www.josedomingo.org/web/mod/resource/view.php?id=2057)
* [Documentación: Servidor de Nombres de Dominio: bind9 [pdf]](http://www.josedomingo.org/web/mod/resource/view.php?id=2062)
* [Consultas a un servidor DNS con dig](doc/Consultas_a_un_servidor_DNS_con_dig.html)
* [Esquema: Proceso [jpeg]](files/EsquemaProceso.jpeg)
* [Esquema: Servidor DHCP [jpeg]](files/EsquemaFicherosDHCP.jpeg)
* [Esquema: Servidor DNS [jpeg]](files/EsquemaFicherosDNS.jpeg)

## Unidad 2.- Sistema centralizado de cuentas: Kerberos, OpenLDAP y NFS4

* [Índice de Sistema centralizado de cuentas: Kerberos, OpenLDAP y NFS4](doc/Indice_de_Sistema_centralizado_de_cuentas_Kerberos,_OpenLDAP_y_NFS4.html)
    * [Sistema de cuentas de usuario centralizadas con Kerberos 5, OpenLDAP y NFS4](files/krb_ldap.pdf)
    * [Tarea: Sistema de cuentas centralizadas](doc/Tarea_Sistema_de_cuentas_centralizadas.html)

### Recursos de interés

* [Apache Directory Studio. The Eclipse based LDAP browser and directory client](http://directory.apache.org/studio/)
* [Wikipedia - Kerberos](http://es.wikipedia.org/wiki/Kerberos)

## Servidor apache: Módulos. HTTPS

* [Índice de Servidor apache: Módulos. HTTPS](doc/Indice_de_Servidor_apache_Modulos._HTTPS.html)
    * [Utilización de módulos en Apache](files/apache-modular.pdf)
    * [HTTPS en Apache2](files/https.pdf)
    * [Acceso cifrado en Joomla](files/joomla-cifrado.pdf)
    * [Tarea Servidor apache](doc/Tarea_Servidor_apache.html)

### Recursos de interés

* [Esquema: Ficheros HTTPS](files/EsquemaFicherosHTTPS.jpeg)

## Servidor de correo

* [Índice](doc/Indice.html)
    * [Correo electrónico](files/correo-e.pdf)
    * [Tarea Correo](doc/Tarea_Correo.html)

### Recursos de interés

* [Sitios recomendados](doc/Sitios_recomendados.html)
* [Esquema: Ficheros Postfix](files/1-estructuraficheros.jpg)
* [Esquema: Ficheros Postfix con smarthost](files/16-FicherosSmarthost.jpeg)
* [Esquema: Ficheros Postfix + Dovecot (y smarthost)](files/18-FicherosDovecot.jpeg)

## Unidad 5.- Gestión remota, estado del sistema, actualizaciones y copias de seguridad

* [Índice de gestión remota, estado del sistema, actualizaciones y copias de seguridad](doc/Indice_de_gestion_remota,_estado_del_sistema,_actualizaciones_y_copias_de_seguridad.html)
    * [Utilización elemental de ssh](files/ssh.pdf)
    * [Ejercicio: Gestión remota usando SSH](doc/Ejercicio_Gestion_remota_usando_SSH.html)
    * [Ejercicio: Registro de actividades del sistema: logcheck](doc/Ejercicio_Registro_de_actividades_del_sistema_logcheck.html)
    * [Ejercicio: Herramientas para gestionar las actualización de paquetes](doc/Ejercicio_Herramientas_para_gestionar_las_actualizacion_de_paquetes.html)
    * [Ejercicio: Planificación y realización de copias de seguridad del servidor](doc/Ejercicio_Planificacion_y_realizacion_de_copias_de_seguridad_del_servidor.html)
    * [Ejercicio: Sincronización de directorios con Unison](doc/Ejercicio_Sincronizacion_de_directorios_con_Unison.html)
    * [Tarea: Gestión remota, estado del sistema, actualizaciones y copias de seguridad](doc/Tarea_Gestion_remota,_estado_del_sistema,_actualizaciones_y_copias_de_seguridad.html)


### Recursos de interés

* [Configuración de una tarea Cron](http://www.linuca.org/body.phtml?nIdNoticia=256)
* [Programación en BASH](http://xinfo.sourceforge.net/documentos/bash-scripting/bash-script-2.0.html)
