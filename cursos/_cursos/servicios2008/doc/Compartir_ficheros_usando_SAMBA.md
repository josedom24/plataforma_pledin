---
title: Compartir ficheros usando SAMBA
---

## Instalación de SAMBA  
  
Simplemente:  

    # apt-get install samba

Durante la instalación se nos pregunta en que grupo de trabajo o dominio se va a unir nuestra máquina. Se nos pregunta también si queremos compatibilidad con WINS a lo que respondemos que No.


* Instala en mortadelo un servidor Samba.  
  
## Configuración de Samba  
  
El fichero de configuración de Samba es `/etc/samba/smb.conf` y está formado por diferentes secciones (que se indican mediante `[seccion]`) de las que especificaremos las principales directivas  
  
    [global]  

    workgroup = MIGRUPO # Especifica el grupo de trabajo o dominio  
    server string = %h server # Identificación del servidor  
    ; security = ???? # Tipo de autenticación  
  
En este curso no vamos a ver la configuración de Samba dentro de un dominio, sino simplemente dentro de un grupo de trabajo para compartir ficheros, por lo que hay dos opciones de security útiles:  

* `security = user`: Es necesario utilizar un nombre de usuario y contraseña de samba en la conexión inicial.
* `security = share`: Es necesario utilizar una contraseña para cada recurso compartido.  
    
Ahora empezamos con las secciones de cada recurso compartido, por ejemplo para compartir algunos directorios basta con hacer:  
  
    [fotos]  
    path = /home/fotos  

    [videos]  
    comment = Vídeos compartidos  
    path = /home/felisa/videos  
  
Para compartir impresoras hay que tener en cuenta que las impresoras se comparten de modo predeterminado, así que solo hay que realizar algunos ajustes. Si se desea que se pueda acceder hacia la impresora como usuario invitado sin clave de acceso, basta con añadir **public = Yes** en la sección de impresoras del siguiente modo:  
  
    [printers]
     comment = All Printers
     path = /var/spool/samba
     printable = yes
     public = yes
     writable = no
     create mode = 0700

Para compartir directorios en el mismo fichero de configuración encontrará distintos ejemplos para distintas situaciones particulares. En general, puede utilizar el siguiente ejemplo que funcionará para la mayoría:

    [Lo_que_sea]
     comment = Comentario que se le ocurra
     path = /cualquier/ruta/que/desee/compartir

El directorio compartido puede utilizar cualquiera de las siguientes opciones:

* `guest ok: Define si ser permitirá el acceso como usuario invitado. El valor puede ser `Yes` o `No`.
* `public`: Es un **equivalente** del parámetro **guest ok**, es decir define si ser permitirá el acceso como usuario invitado. El valor puede ser `Yes` o `No`.
* `browseable`: Define si se permitirá mostrar este recurso en las listas de recursos compartidos. El valor puede ser `Yes` o `No`.
* `writable`: Define si se permitirá la escritura. Es el parámetro contrario de `read only`. El valor puede ser `Yes` o `No`. Ejemplos: `«writable = Yes»` **es lo mismo que** `«read only = No»`. Obviamente `«writable = No»` **es lo mismo que** `«read only = Yes»`
* `valid users`: Define que usuarios o grupos pueden acceder al recurso compartido. Los valores pueden ser nombres de usuarios separados por comas o bien nombres de grupo antecedidos por una @. Ejemplo: `fulano, mengano, @administradores`
* `write list`: Define que usuarios o grupos pueden acceder con permiso de escritura. Los valores pueden ser nombres de usuarios separados por comas o bien nombres de grupo antecedidos por una @. Ejemplo: `fulano, mengano, @administradores`
* `admin users`: Define que usuarios o grupos pueden acceder con permisos administrativos para el recurso. Es decir, podrán acceder hacia el recurso realizando todas las operaciones como super-usuarios. Los valores pueden ser nombres de usuarios separados por comas o bien nombres de grupo antecedidos por una @. Ejemplo: `fulano, mengano, @administradores`
* `directory mask`: Es lo mismo que `directory mode`. Define que permiso en el sistema tendrán los subdirectorios creados dentro del recurso. Ejemplos: `1777`
* `create mask`: Define que permiso en el sistema tendrán los nuevos ficheros creados dentro del recurso. Ejemplo: `0644`

Por ejemplo si quieres compartir el directorio público de un servidor FTP, que se almacene en `/home/ftp`, la configuración quedaría:  

    [ftp]
     comment = Directorio del servidor FTP
     path = /home/ftp
     guest ok = Yes
     read only = Yes
     directory mask = 0755
     create mask = 0644

  
* Configura SAMBA para compartir dos directorios:  
    * `/home/curso/public`: Que sea accesible desde todas las máquinas con permisos de lectura y escritura.
    * `/srv/www/ies`: Que sea accesible sólo por Felisa y de sólo lectura.

## Accediendo a los recursos compartidos  
  
Desde el cliente podemos acceder a los recursos compartidos por el servidor montando el sistema de fichero:  

    mount -t cifs -o username=el_necesario,password=el_requerido //alguna_maquina/algún_volumen /punto/de/montaje/
  
Nota: Es necesario tener instalado el paquete smbfs para poder montar y desmontar directorios compartidos con Samba.

Si queremos que estos cambios sean definitivos y se realicen cada vez que arranquemos la máuina tenem,os que añadir en el fichero `/etc/fstab` otro punto de montaje:
  
    IP_REMOTA:/directorio/compartido /directorio/local` `smbfs user,auto,guest,ro,gid=100 0 0
  
* Monta los dos directorios que has compartido con `mount` y comprueba que funciona. Cambia el modo de seguridad con la opción `user` y `share` y comprueba las diferencias.  
* Modifica el fichero `/etc/fstab` para que se monten los directorios cada vez que encendemos la máquina.  
* Comprueba desde un entorno gráfico que tienes acceso a los recursos compartidos:  
    * Desde el navegador firefox accede a la dirección: `smb://ip_servidor_samba/recurso`
    * Desde Lugares ->Conectar con el servidor...-> Lugar personalizado, y poniendo la dirección anterior.
