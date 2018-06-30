---
title: "Ejercicio: Control de acceso"
---

## Control de acceso  

En este ejercicio vamos a restringir el acceso a determinadas páginas y vamos a impedir la descargas de algunos tipos de ficheros.  
  
### Control de acceso a páginas webs  
  
1. Creamos una ACL del tipo url_regex que se llame descargas_directas y que nos permita restringir el acceso a páginas como rapidshare, megaupload, gigasize  
  
        acl descargas_directas url_regex megaupload rapidshare gigasize
        ...
        http_access deny descargas_directas

  
2. Comprueba en el el fichero de log `/var/log/squid3/access.log` que dichas páginas han sido denegadas.  
  
### Control de acceso por tipos MIME  
  
**MIME** es el acrónimo inglés de (_**M**ultipurpose **I**nternet **M**ail **E**xtensions_), (Extensiones Multipropósito de Correo de Internet). Consiste en una serie de convenciones o especificaciones dirigidas a que se puedan intercambiar a través de Internet todo tipo de archivos (texto, audio, vídeo, etc.) de forma transparente para el usuario.  
  
En nuestro caso vamos a denegar el acceso a contenido de videos flash, para ello vamos a crear una ACL de tipo `rep_mime_type` y vamos a usar la directiva `http_reply_access` ya que vamos a denegar la respuesta del servidor.  
  
1. Creamos una ACL del tipo rep_mime_type para denegar el acceso a contenido flash. El tipo MIME de flash es `application/x-schockwave-flash`

        acl flash rep_mime_type -i ^application/x-shockwave-flash$
        ...
        http_reply_access deny flash


2. Comprueba el acceso desde el cliente a una página web que contenga contenido flash.  