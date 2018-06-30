---
title: Logs: obteniendo información del sistema
---

## ¿Qué es un log(registro)?

No es más que una entrada en un fichero donde se detalla el funcionamiento de alguna aplicación del sistema o del propio kérnel, normalmente con el formato "Día Hora Equipo Aplicación: Mensaje", por ejemplo:

    Nov 23 10:10:00 talut dhclient: DHCPREQUEST on eth0 to 10.127.37.28 port 67

Estos ficheros se ubican en el directorio `/var/log/`, en diferentes ficheros o en el genérico `/var/log/syslog` (en otras distros `/var/log/messages`) y en general son manejados por el demonio del sistema syslogd. Existen también aplicaciones que tienen sus propias aplicaciones de control de estas entradas y sus propios ficheros (directorios) de almacenamiento, como son apache, MySQL, etc.

## Comprobando el funcionamiento del equipo

A la hora de realizar cualquier modificación en un servicio, es una práctica habitual tener abierto el fichero syslog de forma continua. Esto puede realizarse de muchas maneras, por ejemplo con la instrucción:

    tail -f /var/log/syslog

  
* Abre dos terminales de tu equipo y colócalas en el escritorio para verlas simultáneamente. Abre en la primera terminal de forma continua el fichero syslog y en la otra reinicia alguno de los demonios de la máquina (por ejemplo cron).  
  
## Prioridad del log

El nivel de detalle de los registro se denomina prioridad y es configurable, los valores de prioridad de menor a mayor son:  

1.  debug
2.  info
3.  notice
4.  warning (warn)  
5.  error (err)
6.  crit
7.  alert
8.  panic (emerg)

Si configuramos una aplicación con la prioridad "debug", aparecerán gran cantidad de registros, de ahí su nombre, ya que se utilizan para depurar el funcionamiento de una aplicación. Por el contrario si configuramos una aplicación con la prioridad "panic" sólo se producirán registros en casos de emergencia.  
  
* Edita el fichero de configuración del servidor ssh, busca la directiva donde se determina la prioridad de log de ese servicio y modifícala a "debug".  
* Reinicia el servicio y abre de forma continua el fichero `/var/log/auth.log`  
* Realiza una conexión ssh desde otra sesión y comprueba el detalle de los registros que se generan.  
* Vuelve a poner la prioridad al nivel que estaba y reinicia el servicio.