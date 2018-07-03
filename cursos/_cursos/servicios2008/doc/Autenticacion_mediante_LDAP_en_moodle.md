---
title: Autenticación mediante LDAP en moodle
---

Muchos CMS incluyen módulos para diferentes mecanismos de autenticación, como un ejemplo de ellos veremos la autenticación de usuarios en moodle sobre LDAP. La ventaja principal de esto es que permite tener un sistema único de auntenticación para todas las aplicaciones de una organización.

Vamos a seguir los pasos que se describen en "LDAP Authentication" de la documentación oficial de Moodle y que aparece en *Enlaces recomendados*.

Entramos en moodle con el perfil de administrador y vamos a *Administración del sitio >> Usuarios >> Autenticación >> Administrar autenticación* y en la tabla que aparece activamos *"Usar un servidor LDAP"* y hacemos click en *Configuración*.

Obtendremos la pantalla en la que tendremos que introducir todos los datos de la conexión con el servidor y las características de nuestros usuarios.

La mayoría de las opciones están claras y bien explicadas en la documentación, sólo vamos a comentar las que presentan dudas.

**Ajustes de servidor LDAP**

(Sin comentarios)

**Fijar ajustes**

Hay que especificar el dn del usuario que se conecta al LDAP (por ejemplo admin), debe ser alguno que tenga como mínimo permiso de lectura sobre los atributos "userPassword" y de lectura y escritura si queremos que se puedan modificar las contraseñas desde moodle.

**Ajustes de búsqueda de usuario**

Tipo de usuario (posixAccount)
Contexto es el dn de la rama que contiene los usuarios (la unidad organizativa People por ejemplo).
Buscar subcontextos: Sí
Atributo del usuario: uid (porque usamos posixAccount)

 **Forzar cambio de contraseña**

(Sin comentarios) 

**Ajustes de caducidad de la contraseña LDAP.**

(Sin comentarios) 

**Habilitar creación por parte del usuario**

(Sin comentarios) 

**Creador de curso**

(Sin comentarios) 

**Script de sincronización del Cron**

(Sin comentarios) 

**Mapeado de datos**

Estos campos varían mucho de un directorio LDAP a otro, por lo que tendremos que especificar el nombre de los atributos en nuestro caso para que Moodle los pueda encontrar. Por ejemplo:

    Dirección de correo -> mail
    Teléfono 1-> telephoneNumber
    Etcétera

Finalmente le damos a guardar cambios e intentamos acceder a moodle con un usuario que tengamos en el directorio LDAP.