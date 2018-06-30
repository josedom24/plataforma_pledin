---
title: Uso básico de APT
---

## Instalar paquetes

Vamos a instalar un servicio de ejemplo, utilizando la herramienta apt-get. El servicio que vamos a instalar es ntp, que nos permite la sincronización del reloj del sistema.  
  
Para ello vamos a utilizar la instrucción:  

    # apt-get install ntp

    Leyendo lista de paquetes... Hecho
    Creando árbol de dependencias
    Leyendo la información de estado... Hecho
    Paquetes sugeridos:
     ntp-doc
    Se instalarán los siguientes paquetes NUEVOS:
     ntp
    0 actualizados, 1 se instalarán, 0 para eliminar y 8 no actualizados.
    Necesito descargar 434kB de archivos.
    After this operation, 1065kB of additional disk space will be used.
    Des:1 http://192.168.1.1 lenny/main ntp 1:4.2.4p4+dfsg-7 \[434kB\]
    Descargados 434kB en 0s (5872kB/s)
    Seleccionando el paquete ntp previamente no seleccionado.
    (Leyendo la base de datos ...
    112173 ficheros y directorios instalados actualmente.)
    Desempaquetando ntp (de .../ntp\_1%3a4.2.4p4+dfsg-7\_i386.deb) ...
    Processing triggers for man-db ...
    Configurando ntp (1:4.2.4p4+dfsg-7) ...
    Starting NTP server: ntpd.

Veamos algunos conceptos antes de contestar:  

* ¿Qué son los paquetes extras? Son las depeNdencias, los paquetes necesarios para que funcione el paquete que queremos usar.
* ¿Qué son los paquetes sugeridos? Son paquetes relacionados con el que queremos instalar y que ofrecen alguna funcionalidad extra.

La herramienta `apt-get` descarga de los repositorios los paquetes necesarios y utilizando `dpkg` los instala y configura. Una vez concluida la instalación el servicio ntp estará funcionando.

* Instala ahora otro servidor que vamos a utilizar durante el curso: el SSH, que nos permite la conexión remota de forma segura a nuestro ordenador.  
  
## Desinstalar paquetes

La opción de apt-get que debemos usar para desinstalar nuestro paquete es la siguiente:  

    # apt-get remove ntp

Esta opción no elimina los ficheros de configuración del servicio, para hacerlo tenemos que usar la siguiente opción:  

    # apt-get remove --purge ntp

Atención!!!: Cuando desinstalamos un paquete, ¿se desinstalan las dependencias?  
  
* Desinstala el servidor SSH con `apt-get remove`. Comprueba que no se han borrado los ficheros de configuración.  
* Vuelve instalarlo, y desinstala ahora utilizando la opción `purge`. Comprueba que todos los ficheros relacionados se han borrado.  
* Vuelve a instalar el servidor SSH, ya que lo vamos a utilizar durante el curso. ¿Por qué a partir de la segunda instalación el proceso es más rápido?
