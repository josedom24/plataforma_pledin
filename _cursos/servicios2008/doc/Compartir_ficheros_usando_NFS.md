---
title: Compartir ficheros usando NFS
---

## Instalación de un servidor NFS

Para instalar un servidor NFS es necesario instalar los siguientes paquetes:
    
    # apt-get install nfs-kernel-server nfs-common portmap 

* Instala un servidor NFS en mortadelo.

En los clientes es suficiente con los siguientes paquetes:
    
    # apt-get install nfs-common portmap
  
* Instala filemon como cliente NFS.

## Compartiendo ficheros con NFS
  
Los directorios que queremos compartir con NFS los indicamos en el fichero `/etc/exports` donde se indica el directorio a compartir, el rango de maquinas que pueden acceder y las opciones.
  
El rango de máquinas lo podemos indicar de la siguiente forma:
  
* *una sola máquina* — Cuando una máquina en particular es especificada con nombre completo de dominio, nombre de máquina o dirección IP. 
* *comodines* — Cuando usamos un carácter `*` o `?` para referirnos a un grupo de nombres completos de dominio o direcciones IP o que coincidan con una cadena particular de letras. 
    Sin embargo, tenga cuidado cuando especifique comodines con nombres de dominio completos, pues tienden a ser más exactos de lo que usted cree. Por ejemplo, el uso de `*.example.com` como comodín, permitirá a ventas.domain.com acceder al sistema de archivos exportado, pero no a bob.ventas.domain.com. Para permitir ambas posibilidades, así como a sam.corp.domain.com, debería usar `*.example.com *.*.example.com`. 
* *redes IP* — Permite el acceso a máquinas basadas en sus direcciones IP dentro de una red más grande. Por ejemplo, `192.168.0.0/24`.

Y las opciones:

* `ro` — Sólo lectura (read-only). Las máquinas que monten este sistema de archivos no podrán cambiarlo. Para permitirlas que puedan hacer cambios en el sistema de archivos, debe especificar la opción `rw` (lectura-escritura, read-write). 
*  `async` — Permite al servidor escribir los datos en el disco cuando lo crea conveniente. Mientras que esto no tiene importancia en un sistema de sólo lectura, si una máquina hace cambios en un sistema de archivos de lectura-escritura y el servidor se cae o se apaga, se pueden perder datos. Especificando la opción `sync`, todas las escrituras en el disco deben hacerse antes de devolver el control al cliente. Esto puede que disminuya el rendimiento. 
* `wdelay` — Provoca que el servidor NFS retrase el escribir a disco si sospecha que otra petición de escritura es inminente. Esto puede mejorar el rendimiento reduciendo las veces que se debe acceder al disco por comandos de escritura separados. Use `no_wdelay` para desactivar esta opción, la cual sólo funciona si está usando la opción `sync`. 
* `root_squash` — Previene a los usuarios root conectados remotamente de tener privilegios como root asignándole el userid de 'nobody'. Esto reconvierte el poder del usuario root remoto al de usuario local más bajo, previniendo que los usuarios root remotos puedan convertirse en usuarios root en el sistema local. Alternativamente, la opción `no_root_squash` lo desactiva. Para reconvertir a todos los usuarios, incluyendo a root, use la opción `all_squash`. Para especificar los ID de usuario y grupo para usar con usuarios remotos desde una máquina particular, use las opciones `anonuid` y `anongid`, respectivamente. De esta manera, puede crear una cuenta de usuario especial para usuarios NFS remotos para compartir y especificar (anonuid=`<uid-value>`,anongid=`<gid-value>`), donde `<uid-value>` es el número ID de usuario y `<gid-value>` es el número ID de grupo.
* `subtree_check | no_subtree_check`: indica si sera recursivo en el arbol de directorios.

Por ejemplo:
  
    /home/ftp 10.0.0.0/24(ro,all_squash)
    /media/disk 10.0.0.0/24(rw,no_root_squash,async)
    
  
* Configura el servidor NFS para compartir dos directorios:
      
    * `/home/curso/public`: Que sea accesible desde todas las máquinas con permisos de lectura y escritura.
    * `/srv/www/ies`: Que sea accesible sólo desde fillemón y de sólo lectura.

* Reinicia el servidor, reiniciando el demonio o con la instrucción:
        
        # exportfs -ra
    
## Accediendo a los recursos compartidos
  
Desde el cliente podemos acceder a los recursos compartidos por el servidor montando el sistema de fichero:
  
    mount -t nfs IP_REMOTA:/directorio/compartido /directorio/local


Si queremos que estos cambios sean definitivos y se realicen cada vez que arranquemos la máuina tenem,os que añadir en el fichero `/etc/fstab` otro punto de montaje:

    IP_REMOTA:/directorio/compartido /directorio/local nfs rw,hard,intr 0 0

* Vamos a montar los dos directorios compartidos en dos directorios `/mnt/compartido` y `/mnt/ies`. Crea estos directorios.
* Prueba a montar con la instrucción `mount` los dos directorios. Recuerda que con `umount` puedes desmontarlos.
* Modifica el fichero `/etc/fstab` para que el montaje de los dos directorios se haga de forma permanente.
