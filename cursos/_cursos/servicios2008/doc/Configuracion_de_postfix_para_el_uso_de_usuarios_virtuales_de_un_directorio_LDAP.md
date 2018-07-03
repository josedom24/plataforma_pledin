---
title: Configuración de postfix para el uso de usuarios virtuales de un directorio LDAP
---

El objetivo de esta práctica es configurar el servidor de correo postfix, para que utilice usuarios virtuales del sistema almacenados en un directorio open LDAP. Para ello vamos a seguir los siguientes puntos:  
  
## Instalación necesaria

En primer lugar necesitamos tener instalado el paquete postfix-ldap, que nos da la funcionalidad para que el servidor de correo utilice el servidor LDAP.  

* Instala el paquete postfix-ldap  
  
## Esquema para el directorio LDAP  
  
La organización que vamos a construir en nuestro directorio es muy similar a la que hicimos en el capítulo donde estudiamos LDAP. En este caso tendríamos tres unidades organizativas:  
  
* Rama "people": la cual contendrá información sobre las cuentas de usuario. Aquí se almacenarán todos los datos obligatorios de las cuentas: direcciones de correo electrónico, directorio Maildir, etc.
    
* Rama "groups": almacenará la información relativa a grupos de usuarios.
    
* Rama "postfix": que contendrá la información necesaria para Postfix. Por ejemplo dentro de esta unidad podemos crear una unidad organizativa "alias" par crear alias y redireccionamientos. (En esta práctica no vamos a implementar esta característica).  
  
* Utilizando el siguiente fichero ldif [](../img/postfix_ldap_ou.ldif)crea las unidades organizativas en el directorio ldap:  
  
        dn:ou=people,dc=ldap,dc=web-personal,dc=org
        objectClass: organizationalunit
        ou: people

        dn:ou=groups,dc=ldap,dc=web-personal,dc=org
        objectClass: organizationalunit
        ou: groups

        dn:ou=postfix,dc=ldap,dc=web-personal,dc=org
        ou: postfix
        objectClass: organizationalUnit

  
> Nota 1: Si ya tienes las unidades organizativas people y groups del capitulo anterior sólo tendrás que crear la unidad organizativa postfix.  
  
* Comprueba la estructura del directorio con la instrucción slapcat.  
  
## Directorios para el almacén de correos  

Las cuentas de correo tendrán su buzón de correo bajo el directorio `/home/vmail/<nombre de usuario>`

* Todos los usuarios de correo pertenecerán al grupo _vmail_, por lo que tendremos que crear un nuevo grupo en el directorio LDAP con el siguiente fichero ldif:  

        dn:cn=vmail,ou=groups,dc=ldap,dc=web-personal,dc=org
        cn: vmail
        gidNumber: 10004
        objectClass: top
        objectClass: posixGroup

> Nota: Elija el GID del grupo de acuerdo a la configuración de su sistema.  
  
* A continuación debemos crear los directorios donde se guardarán los correos:  

        mkdir /home/mail/felisa
        chown 10001:10004 /home/vmail/felisa
        chmod 2755 /home/mail/felisa

## Configurando openLDAP para gestionar el correo

OpenLDAP necesita un esquema específico para poder manejar información acerca del correo electrónico, este esquema se encuentra en el paquete _courier-authlib-ldap._

* Instala el paquete _courier-authlib-ldap.  
* Se copian los esquemas necesarios al directorio de esquemas de LDAP _(el esquema está comprimido):_

        zcat /usr/share/doc/courier-authlib-ldap/authldap.schema.gz > /etc/ldap/schema/authldap.schema

* Por último se ha de añadir el nuevo esquema al archivo de configuración del demonio slapd y reiniciar el demonio.

    Para ello, añada la siguiente línea en la sección de definiciones de _objectClass_ y _Schemas_:

        include /etc/ldap/schema/authldap.schema

    Inicializamos el demonio:

        /etc/init.d/slapd restart

## Añadir un usuario de correo

* Vamos a añadir un nuevo usuario de correo con el siguiente fichero ldif:  

        dn:uid=felisa,ou=people,dc=ldap,dc=web-personal,dc=org
        uid: felisa
        cn: Felisa
        sn: Perez Lopez
        userPassword:{CRYPT}mdkQsdBAQepDU
        uidNumber: 10001
        gidNumber: 10004
        homeDirectory: /home/vmail/felisa
        objectClass: top
        objectClass: person
        objectClass: posixAccount
        objectClass: CourierMailAccount
        mail: felisa@josedomingo.web-personal.org
        mailbox: felisa/
        quota: 0

    Fijate que el gidNumber corresponde con el grupo vmail que creamos anteriormente.  
  
## Modificación de la configuración de Postfix

A continuación vamos a configurar postfix para que las cuentas de correo no corresponde a usuarios locales de la máquina sino a los usuarios virtuales que hemos guardado en el directorio ldap.  

* Modifica el fichero de configuración de postfix main.cf con las siguiente líneas, que a continuación explicaremos:  

        virtual_mailbox_domains = josedomingo.web-personal.org
        virtual_mailbox_base = /home/vmail
        virtual_minimum_uid = 100

        #Virtual User

        virtual_mailbox_maps = ldap:vuser

        vuser_server_host = 127.0.0.1
        vuser_search_base = ou=people,dc=ldap,dc=web-personal,dc=org
        vuser_query_filter = (&(mail=%s)(!(quota=-1))(objectClass=CourierMailAccount))
        vuser_result_attribute = mailbox
        vuser_bind = no

         #Virtual User uid

        virtual_uid_maps = ldap:uidldap

        uidldap_server_host = 127.0.0.1
        uidldap_search_base = ou=people,dc=ldap,dc=web-personal,dc=org
        uidldap_query_filter = (&(mail=%s)(!(quota=-1))(objectClass=CourierMailAccount))
        uidldap_result_attribute = uidNumber
        uidldap_bind = no

        #Virtual User gid

        virtual_gid_maps = ldap:gidldap

        gidldap_server_host = 127.0.0.1
        gidldap_search_base = ou=people,dc=ldap,dc=web-personal,dc=org
        gidldap_query_filter = (&(mail=%s)(!(quota=-1))(objectClass=CourierMailAccount))
        gidldap_result_attribute = gidNumber
        gidldap_bind = no

  
    Veamos los distintos parámetros:  

    * `virtual_mailbox_domains`: Es el dominio que postfix va a utilizar como virtual, es decir los usuarios van a ser virtuales. Es necesario quitar el dominio dell parametro mydestination de la configuración.
    * `virtual_mailbox_base`: Es el directorio base donde va a estar el buzón de los usarios virtuales.
    * A continuación hay que indicar donde se va a encontrar los usuarios virtuales (apartado Virtual User), indicando, entre otros, la dirección del servidor ldap, la unidad organizativa donde se encuentran los usuarios y el atributo que identifica el directorio donde vamos a guardar los correos.  
    * De manera similar hay que indicar donde se busca el id y el gid de los usarios virtuales.  
    
* Reincia el servidor postfix, y has una prueba de envio de correo a Felisa. Comprueba en el log que se ha enviado con éxito y comprueba que se ha creado el directorio `/home/vmail/felisa`.
