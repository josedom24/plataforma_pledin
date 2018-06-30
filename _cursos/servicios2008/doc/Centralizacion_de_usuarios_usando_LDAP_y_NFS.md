---
title: Centralización de usuarios usando LDAP y NFS
---

Cuando vimos el servidor LDAP hicimos una práctica donde aprendimos a centralizar la autentificación de usuarios. En esa práctica nuestra usuaria Felisa se podía autentificar en cualquier ordenador ya que el sistema de autentificación estaba centralizado en un directorio LDAP. Sin embargo Felisa tenía un directorio home diferente en cada ordenador, lo que tiene evidentes limitaciones.

Añadiendo a la práctica anterior la utilización de NFS podemos hacer que el directorio HOME de los usuarios esté centralizado en un servidor , se exporte por NFS y se pueda montar en cada máquina.

1. Crea el directorio `/home/nfs` en mortadelo para alojar los directorios personales de los usuarios virtuales (LDAP) y asigna los permisos y propietarios adecuados (los mismos que `/home`). Este directorio contendrá los directorios personales del tipo `/home/nfs/felisa`, esto se hace así para que puedan coexistir en el mismo equipo usuarios locales y virtuales.
2. Mueve el directorio `/home/felisa` a `/home/nfs/felisa`.
3. Configura mortadelo para que exporte por NFS el directorio `/home/nfs` con los permisos adecuados. (¿rw?,¿sync?,¿root_squash?)
4. Modifica la entrada de felisa en el directorio LDAP para que su directorio home sea `/home/nfs/felisa`
5. Crea el directorio `/home/nfs` en filemon y asigna los permisos y propietarios adecuados.
6. Monta el directorio `/home/nfs` de mortadelo en filemón.
7. Comprueba que al autenticarte como felisa tanto en mortadelo como filemon se utiliza exactamente la misma cuenta.
8. Para que el montaje de `/home/nfs` fuera automática habría que añadir una línea especificándolo en el fichero `/etc/fstab`.
