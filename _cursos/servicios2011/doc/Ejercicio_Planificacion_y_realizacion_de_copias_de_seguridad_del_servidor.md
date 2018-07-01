# Ejercicio: Planificación y realización de copias de seguridad del servidor

## Realización de script para realizar la copia de seguridad del servidor

En este ejercicio vamos a realizar un script en bash para realizar las copias de seguridad de nuestro servidor avatar, que cumpla las siguientes especificaciones:  
  
1. Realiza el proceso de forma completamente automático: Para ello vamos a hacer que el script de copia de seguridad se ejecute en el cron diariamente.  
2. Decidir qué información es necesaria guardar: Con los servicios que hemos ido instalando durante este curso, hemos decidido hacer copia de seguridad de los siguientes directorios:  
  
    * `/etc` `/home` `/root` `/var/cache/bind` `/var/log` `/var/lib` `/usr/local` `/var/www`,  
    
    además vamos a hacer una copia de seguridad de la lista de paquetes actualmente instalado en el sistema. La lista de directorios la podemos guardar en una variable $DIRS.  
3. Utilizar la herramienta tar: La sintaxis que se ha usado para el comando `tar` es:  
    * Completa: `tar czf $FICHERO_TGZ $DIRS`
    * Incremental: `tar czf $FICHEROTGZ $DIRS -N $FECHA_AYER`
  La variable `$FICHEROTGZ` contiene el nombre de la copia de seguridad y la variable `$FECHA_AYER`. Una copia de seguridad incremental sólo guarda los archivos que se han modificado desde la fecha indicada.  
4. Incluir la fecha de realización en el nombre del fichero de copia: El nombre del fichero donde guardamos la copia de seguridad será de la forma `backup_fecha.tar.gz`, para poner la fecha en el nombre del fichero utilizaremos el comando `bash date +%F`
5. Almacenar la copia de seguridad en el directorio local `/backup`
6. Transferir la copia de seguridad en otro dispositivo de almacenamiento: Para mayor seguridad lo lógico es guardar la copia de seguridad que vamos a realizar en otro dispositivo de almacenamiento, por ejemplo en otro servidor de nuestra red, en un dispositivo NAS, etc., pero con nuestro esquema de trabajo lo más fácil es usar a nuestro ordenador cliente para guardar la copia. Para ello, vamos a utilizar ssh usando claves públicas para la autentificación y usando el comando `scp` para hacer la copia.
7. Semanalmente realizar una copia completa: Para llevar a cabo esta acción, podemos controlar qué día es cuando se ejecuta el script. Así, con sentencias de control (`if`) realizaremos un tipo de copia u otra. Para averiguar si es domingo o cualquier otro día he usado: `date +%w`. El comando anterior devuelve '0' en caso de ser domingo. En caso contrario devuelve números del 1 al 6 (de lunes de sábado respectivamente).  
8. Diariamente realizar una copia incremental: La ventaja principal de usar la copia incremental es el poco tamaño que ocupa cada copia incremental (depende de cuántos ficheros se modifiquen). La desventaja principal es que deben existir todas las copias incrementales previas a la del último día para mantener todos los datos cuando haya que restaurarla. En este caso se hará una copia incremental cada día tomando como intervalo de modificación de un fichero el día anterior. Es decir, en cada copia se guardarán los ficheros que hayan sido modificados desde el día anterior (manteniendo su estructura en el sistema de directorios). La sintaxis para realizar la copia la hemos indicado anteriormente, pero para poder obtener el día anterior de la fecha actual se ha usado el siguiente comando: `date -d yesterday +%F`  

    Al realizar copias incrementales, no se puede permitir que no exista la copia de un día. Para ello se ha creado un fichero de control llamado 'lastcopy' que tendrá en cuenta cuándo fue el último día que se realizó una copia. Así, la copia incremental se realizará desde dicho día.
  
Algunas observaciones a tener en cuenta:  

1. Toda la información que devuelva un proceso, ejecutado en el cron, por la salida estándar será enviada por correo. Por lo tanto todos los mensajes que escribamos en la salida estándar con el comando echo se mandarán por correo.
2. Se debe realizar el script sabiendo que en el cliente existe un directorio donde se van a almacenar las copias de seguridad generadas en el servidor. El nombre de ese directorio se guardará en la variable `$DIR_REM`
3. Se deben realizar comprobaciones sobre la existencia de los directorios y los ficheros necesarios para el funcionamiento del script:

    * Crear el directorio `/backup` si no existe.
    * Si no existe el fichero `/backup/lastcopy` se creará con el valor de ayer (`date -d yesterday +%F`)

  
## Esquema del script copia de seguridad:
  
`backup.sh`

    #!/bin/bash
    ##Definiendo las constantes
    DIR_BACKUP='/backup'
    DIR_REM='copia'
    HOST='cliente.example.com'
    DIRS='etc home root usr/local var/cache/bind var/lib var/log var/www'
    DIR_TMP='/media/backup'
    FECHA=`date +%F`
    FECHA_AYER=`date -d yesterday +%F`
    ##Creando el directorio de backup en caso de no existir
    ...
    ##Comprobamos si existe un fichero en /backup llamado 'lastcopy'
    ##Su utilidad será la de registrar la última copia que se realizó.
    ##En caso de no existir se pone la fecha de ayer
    ...
    ##Realizando la acción dependiendo del día
    ##El 0 representa el domingo en el formato date +%w
    ## Si el día actual es domingo realizamos copia completa
    ...
    ##sino realizamos copia incremental
    ...