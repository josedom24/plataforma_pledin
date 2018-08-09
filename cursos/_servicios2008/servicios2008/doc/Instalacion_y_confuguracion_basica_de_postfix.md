---
title: Instalación y confuguración básica de postfix
---

Vamos a explicar los pasos que se deben seguir para instalar en mortadelo un servidor de correos del dominio `brenes.homelinux.net`, dominio registrado el el servicio gratuito dyndns.org y asociado en este momento a la dirección IP pública del router ADSL del centro.

El primer paso consiste en la instalación de postfix, que se realiza mediante la sencilla instrucción:

    aptitude install postfix

El programa de configuración de paquetes de debian (debconf) hará dos preguntas durante la instalación a las que se debe responder de la siguiente manera:

* Configuración del equipo como "Internet site", que significa que no utiliza ningún otro equipo para enviar el correo con SMTP
* Como nombre de correo ponemos `brenes.homelinux.net`

Estas características se incluyen en el fichero de configuración de postfix (`/etc/postfix/main.cf`), que hay que comprobar que quede de la siguiente manera:

    # See /usr/share/postfix/main.cf.dist for a commented, more complete version
    # Debian specific: Specifying a file name will cause the first
    # line of that file to be used as the name. The Debian default
    # is /etc/mailname.
    #myorigin = /etc/mailname

    smtpd_banner = $myhostname ESMTP $mail_name (Debian/GNU)
    biff = no

    # appending .domain is the MUA’s job.
    append_dot_mydomain = no

    # Uncomment the next line to generate "delayed mail" warnings
    #delay_warning_time = 4h
    readme_directory = no

    # TLS parameters
    smtpd_tls_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
    smtpd_tls_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
    smtpd_use_tls=yes
    smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
    smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache

    # See /usr/share/doc/postfix/TLS_README.gz in the postfix-doc package for
    # information on enabling SSL in the smtp client.

    myhostname = brenes.homelinux.net
    alias_maps = hash:/etc/aliases
    alias_database = hash:/etc/aliases
    myorigin = /etc/mailname
    mydestination = $myhostname, localhost, localhost.localdomain
    relayhost =
    mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
    mailbox_command = procmail -a "$EXTENSION"
    mailbox_size_limit = 0
    recipient_delimiter = +
    inet_interfaces = all

Y que el fichero `/etc/mailname` tiene el siguiente contenido:

    brenes.homelinux.net

Si modificamos algún parámetro de postfix habrá que hacer que el demonio que se está ejecutando vuelva a leer el fichero de configuración mediante:

    /etc/init.d/postfix reload

## Pruebas de funcionamiento

Para comprobar que un servidor de correo está funcionando correctamente hay que hacer pruebas de envío y recepción de correo, tanto el envío como la recepción de correo quedará registrada en el fichero `/var/log/mail.log`, por lo que conviene abrirlo de forma continua en una terminal:

    tail -f /var/log/mail.log

Puesto que mortadelo es un equipo que no tiene entorno gráfico hay que utilizar un cliente de correo en modo texto y el más sencillo es el programa `mail` que se incluye en el paquete `bsd-mailx`. Un ejemplo de utilización sería:

    mortadelo:~# mail usuario
    Subject: Asunto
    Prueba de envío local
    [CTRL-D]
    Cc:

donde se envía un mensaje al usuario "usuario" del propio equipo y [CTRL-D] indica la señal de EOF (End of file) que se le ha mandado para indicar que se ha terminado de escribir el cuerpo del mensaje.

* Realiza las mismas pruebas de funcionamiento que aparecen en el documento del tema. Interpreta si el funcionamiento es correcto o no leyendo el fichero de registros `/var/log/mail.log`. Avisa a alguno de los ponentes cuando vayas a enviar un mensaje desde el exterior a mortadelo para configurar el cortafuegos y que pueda llegar el correo.