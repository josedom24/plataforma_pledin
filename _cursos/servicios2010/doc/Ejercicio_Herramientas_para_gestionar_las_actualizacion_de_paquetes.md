---
title: "Ejercicio: Herramientas para gestionar las actualización de paquetes "
---

Las actualizaciones automáticas de los paquetes del sistema, o la notificación de los mismos, es una tarea importante que deben realiza los administradores de sistema. Lo que pretendemos con este ejercicio es aprender herramientas que nos permiten automatizar las tareas de actualización que puede ser mas que beneficioso, sobre todo por el ahorro de tiempo.  
  
## Apticron

`Apticron` es un pequeño script que se encarga de comprobar las actualizaciones del sistema, descargarlas (pero no instalarlas), generar un informe y enviarlo por correo al administrador.  
  
* Instala el paquete apticron  
  
El fichero de configuración lo encontramos en `/etc/apticron/apticron.conf`, donde podremos indicar la cuenta de correos donde se envían los informes que por defecto es al usuario root (en el ejercicio anterior habíamos hecho las modificaciones necesarias para redirigirlo a otro usuario).  
  
Y a partir de aquí, apticron estará listo para comenzar a enviar correos electrónicos una vez al día, con la información de los nuevos paquetes disponibles, el repositorio del paquete, la criticidad, etc.  
  

* Comprueba la configuración en el archivo etc/apticron/apticron.conf  
* Comprueba cuando se ejecuta el programa editando el archivo /etc/cron.d/apticron  
  
## Cron-apt

Esta herramienta permite automatizar las tareas de actualización. Mas precisamente, `cron-apt` es una aplicación que combina las utilidades de cron y apt de forma muy flexible, con el fin de manejar la automatización de apt a través de cron. De la misma forma que apticron, apt-cron también envía correos electrónicos al administrador con los informes obtenidos por la herramienta.  
  
Por defecto, `cron-apt` se ejecuta todos los días realizando dos tareas: primero un “apt-get update” del sistema; seguido de esto, si hubiese actualizaciones para descargar, un `apt-get dist-upgrade -d`.  
  
Es decir que realiza la actualización del sistema, descarga los paquetes necesarios resolviendo todas las dependencias necesarias, pero no instala nada de lo descargado. Este ultimo paso requiere la intervención del administrador, ya que cada vez que haya nuevas actualizaciones para instalar, la herramienta enviará un correo electrónico informando del hecho.  
  
* Instala el paquete `cron-apt`
* El archivo de configuración de la herramienta es `/etc/cron-apt/config`, modifícalo para usar `aptitude` en vez de `apt-get` y para que se manda las notificaciones por correo al root.  
* Comprueba cuando se ejecuta el programa editando el archivo `/etc/cron.d/cron-apt`  
  
De esta forma podremos evitarnos la tarea de buscar actualizaciones a daca uno de los paquetes que tenemos instalados en el sistema, ya que recibiremos toda esta información en nuestro correo. Y si estamos de acuerdo con las actualizaciones, solo restará un:  
  
    # apt-get dist-upgrade