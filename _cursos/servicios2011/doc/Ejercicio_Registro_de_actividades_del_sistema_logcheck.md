# Ejercicio: Registro de actividades del sistema: logcheck

## logcheck

`Logcheck` es una herramienta encargada de revisar periódicamente los logs del sistema y enviar un correo al administrador de lo que sea importante. `Logcheck` revisa periódicamente los logs del sistema, analizando cada una de las líneas y clasificándola según diferentes niveles de alerta, informando al administrador del sistema en un formato fácil de leer, descartando las líneas que no tengan relevancia, y --típicamente-- enviándolo por correo. `Logcheck` comprobará cada línea de los logs vigilados contra cuatro niveles de seguridad: Ignorar, actividad inusual, violación de seguridad y ataque.  
  

### Instalación y configuración de logcheck

* Instala el paquete logcheck en avatar  
* El fichero de configuración de logcheck se encuentra en el fichero `/etc/logcheck/logcheck.conf`, comprueba que el parámetro `SENDMAILTO` está configurado para enviar las notificaciones al usuario root.  
* Visualiza el fichero `/etc/cron.d/logcheck` y comprueba cunado se ejecuta por defecto `logcheck`.  
  
### Envío de correos a direcciones externas

Como hemos visto anteriormente el corro de la herramienta `logcheck` (y de las aplicaciones que vamos a ver más adelante en este mismo tema) mandan los correos electrónicos al root. Normalmente, aunque hagamos muchas tareas administrativas con el usuario root, nosotros trabajaremos normalmente con un usuario en el servidor con menos privilegios.

Para redirigir el correo que va dirigido al root a nuestro usuario, podemos modificar el fichero `/etc/aliases` y añadir la línea:

    root: usuario

Tan sólo nos queda ejecutar el comando `newaliases` para que los cambios se lleven a efecto.  

Además si tenemos instalado un servidor SMTP (`exim4`, `postfix`) y queremos que esa notificación sea redirigida a una dirección de correo externa, podemos crear en la cuenta de usuario un fichero llamado `.forward` donde indicaremos la cuenta de correo donde queremos recibir la notificación.