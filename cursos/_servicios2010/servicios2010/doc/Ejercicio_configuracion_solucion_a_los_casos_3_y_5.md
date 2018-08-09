---
title: "Ejercicio: configuración; solución a los casos 3 y 5."
---

Usa el fichero PDF para documentarte sobre la configuración a realizar ("Configuración de main.cf", "Datos de autenticación","Utilización del certificado adecuado")  

Casos: comprobación de la configuración realizada:

* Caso 3:

    * Repite los pasos indicados en el apartado “Ejemplos preliminares. Correo en Avatar“.
    * Echa un vistazo al fichero de log (`/var/log/mail.log`)
    * ¿Está el mensaje envíado desde Avatar en la carpeta de entrada del destinatario? Si el destinatario ha recibido el correo es que vas por buen camino y has logrado configurar Postfix. ¡Muy bien!

* Caso 5:

    * Repite los pasos indicados en el apartado “Avatar como servidor de correo de los clientes de nuestra red”.
    * Ojea el fichero de log.
    * Comprueba si llegó el mensaje. Si lo has logrado es porque tienes un servidor de correo local configurado adecuadamente que sirve tanto para el envío de correo entre usuarios de dominios locales como para el envío de correo a usuarios remotos. ¡ Enhorabuena! ;-).