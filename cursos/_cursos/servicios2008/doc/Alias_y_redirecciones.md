---
title: Alias y redirecciones
---

## Alias

Cuando se define un alias para un determinado usuario se redirige el correo que llegue a otro usuario de la misma máquina. Los alias de correo se utilizan principalmente para gestionar el correo de las "cuentas de administración" y se definen en el fichero /etc/aliases, que tiene el siguiente aspecto:

    # /etc/aliases
    mailer-daemon: postmaster
    postmaster: root
    nobody: root
    hostmaster: root
    usenet: root
    news: root
    webmaster: root
    www: root
    ftp: root
    abuse: root
    noc: root
    security: root
    www-data: root
    logcheck: root
    root: alberto, jose, jesus, raul

En este caso el correo que llega a los usuarios postmaster, webmaster, etc. se redirige a la cuenta de root, que a su vez se redirige a los usuarios reales alberto, jose, jesus y raul, que son los administradores del equipo.

Cada vez que se modifica el fichero /etc/aliases hay que ejecutar la instrucción `newaliases` para que los cambios tengan efecto.

* Edita el fichero `/etc/aliases` de mortadelo para que todo el correo de administración llegue al usuario curso.

## Redirecciones

Una redirección se utiliza para enviar el correo que llegue a un usuario a una cuenta de correo exterior. Para usuarios reales las redirecciones se definen en el fichero `~/.forward` y el formato de este fichero es simplemente un listado de cuentas de correo a las que se quiere redirigir el correo.

  * Crea el fichero `.forward` en el directorio home del usuario curso para se redirija todo el correo que le llegue a tu cuenta de correo.
  