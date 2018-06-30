---
title: "Tarea: Creación de un sistema de cuentas centralizadas"
---

1. Instala y configura los servicios ntp, slapd y kerberos en avatar y cliente siguiendo las indicaciones de la documentación.
2. Realiza un login con el usuario pruebau (o cualquier otro que hayas creado en Kerberos/LDAP) en cliente y avatar.
3. Instala y configura NFS4 para que se pueda montar de forma remota y autenticada el directorio `/home/users/`.
4. Cuando todo funcione correctamente, sube un fichero que contenga:

    * Las líneas del fichero de registros `/var/log/auth.log` de avatar y cliente que demuestren que el login se realiza correctamente.
    * La salida de la instrucción `mount` en cliente.