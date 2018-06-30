---
title: Crear manualmente un usuario en UNIX
---

Con idea de comprender qué significa crear un usuario en UNIX, crearemos un usuario de forma manual siguiendo los siguientes pasos.

Características del nuevo usuario:

* Nombre de usuario: felisa
* Nombre Completo: Felisa Gómez García
* Contraseña: 123456
* Grupo principal: curso
* UID: 1010
* GID:1010
* Directorio home: /home/felisa
* Shell: /bin/bash


1. Creamos el grupo principal del usuario, añadiendo la siguiente línea al fichero /etc/group:

        curso:x:1010:

2. Creamos el usuario (salvo su contraseña), añadiendo la siguiente línea al fichero /etc/passwd:

        felisa:x:1010:1010:Felisa Gómez García,,,:/home/felisa:/bin/bash

3. Ciframos la contraseña con el algoritmo MD5 (instalamos previamente el paquete grub):

        grub-md5-crypt
        Password:
        Retype password:

4. Incluimos la contraseña anterior en una línea del fichero /etc/shadow (por ejemplo):

        felisa:$1$01dvo$eW1kagvwzOAoSLdTJyaoo0:13730:0:99999:7:::

5. Creamos el directorio home de felisa

        mkdir /home/felisa

6. Copiamos el contenido del directorio /etc/skel

        cp /etc/skel/.* /home/felisa

7. Cambiamos el usuario propietario y el grupo propietario del directorio home de felisa y de todos los ficheros que contiene:

        chown -R 1010:1010 /home/felisa

8. Comprobamos que todo está bien haciendo un login en el sistema con el usuario felisa y listando el contenido de su directorio.