# Ejercicio: Sincronización de directorios con Unison

## Sincronización de directorios con Unison
  
Unison permite mantener actualizados árboles completos en el mismo ordenador (diferentes directorios) o en ordenadores remotos (usando ssh u otros métodos). Además propaga las modificaciones en ambos sentidos. Así es posible mantener sincronizados casi los ordenadores que queramos. Si no hay conflictos (i.e. el mismo fichero modificado en ordenadores distintos y que es imposible hacerles un "merge"), todos tendrán las mismas copias.  
  
Aunque Unison se usa fundamentalmente para sincronizar directorios en dos maquinas distintas podemos utilizarlo para realizar copias de seguridad, en nuestro caso el ejercicio que planteamos es hacer una copia del `home` de nuestro cliente en el servidor avatar (si nos trasladamos a un caso real podríamos hacer copias de todos los ordenadores de nuestra intranet).  
  
En nuestro caso vamos a sincronizar dos carpetas: el `home` del cliente y el directorio que elijamos donde guardar la copia en avatar, pero en este caso particular este segundo directorio nunca va cambiar.  
  
## Instalación de unison

* Como Unison hace uso de ssh, es necesario que el servidor openssh esté instalado en los dos ordenadores: avatar y cliente.  
* Igualmente es necesario instalar el paquete unison en ambas máquinas.  
  
Desde este momento podemos empezar a sincronizar, por ejemplo:  
  
    avatar:# unison /home/usurio/proyecto /var/bakup/proyecto
  
Tendríamos sincronizadas esas dos carpetas, y en el siguiente ejemplo:  

    avatar:# unison ssh://cliente.example.com//home/usuario/proyecto /var/bakup/proyecto
  
tendríamos sincronizadas una carpeta de cliente con otra de avatar.  
  
Aunque de esta forma podríamos hacer uso de esta herramienta, vamos a usar una características que nos da más flexibilidad como son los perfiles. Un perfil es un fichero con extensión `prf`, donde configuramos una tarea de sincronización, de esta manera es muy sencillo configurar varios trabajos de sincronización. En el perfil podemos especificar distintos parámetros, los más usuales pueden ser los siguientes:  

* `root`: Tendrá dos parámetros `root`, donde se especificarán los directorios que queremos sincronizar. Si uno de ello está en otro ordenador por el que vamos acceder por ssh, su valor tendrá la siguiente forma: 

        shh://usuario@maquina//path_del_directorio

* `auto = true`: Es un parámetro que cuando está a true hace el proceso automático, y no hace preguntas cuando se produce algún conflicto.
* `batch = true`: Similar a la anterior, para que el proceso pase de alto los posibles conflictos.
* `prefer`: Se indica un directorio por si hay algún conflicto se toma los ficheros de el.
* `perms = 0`: Cuando copia los ficheros mantiene los mismo permisos.
* `ignore`: Varios parámetros de este tipo donde se especifican directorio y ficheros que no se deben sincronizar, se pueden usar expresiones regulares.

Puedes encontrar todos los parámetros en la [documentación oficial](http://www.cis.upenn.edu/%7Ebcpierce/unison/download/releases/stable/unison-manual.html) de Unison.  
  
Ejemplo de fichero de perfil `backup.prf`:  

    auto = true
    batch = true
    root = ssh://cliente.example.com//home/usuario/proyecto
    root = /var/bakup/proyecto
    perms = 0
    prefer = ssh://cliente.example.com//home/usuario/proyecto
    ignore = Path */.directory
    ignore = Path */Olds
    ignore = Name {olds,*~,tmp,temp,.*} 

El fichero de perfil debe estar en el directorio del usuario dentro de un directorio llamado `.unison` y para ejecutar este perfil basta con ejecutar:  
  
    avatar:# unison backup

## Usar Unison para realizar copia de seguridad

Determinemos nuestro ejercicio: desde el servidor avatar vamos a usar el programa unison para que una vez al día (hay que programar unison en el cron) haga una copia del directorio del directorio home del cliente. Por lo tanto el servidor avatar va acceder al cliente por ssh, y como va a ser una tarea programada vamos a utilizar claves públicas para acceder.  
  
* Configura el sistema para que el root de avatar pueda acceder al cliente por medio de la generación de claves públicas. Durante el proceso de generación de las claves no indique ninguna frase para cifrarla, para que de este modo no nos la solicite cada vez que hagamos la copia.  
* Crea un perfil llamado `backup.prf` donde indiques el directorio que quieres copiar del cliente (`home`) (este directorio también tendrá que ponerlo en el parámetro `prefer`) y el directorio donde vamos a copiar `/var/backups/home_cliente`. Los demás parámetros los puedes dejar igual que en el ejemplo. Recuerda que debes guardar el fichero en `/root/.unison`.  
* Puedes comprobar la copia ejecutando desde avatar: `unison bacup` y a continuación puedes programar la tarea, pero comprobando si el cliente está encendido, por ejemplo:  

        0 7 * * * if ping -c 1 cliente.example.com; then unison backup; fi