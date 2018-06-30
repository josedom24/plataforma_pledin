---
title: "Directivas a configurar 
---

Revisemos las directivas a tener en cuenta en nuestra configuración (`/etc/postfix/main.cf`): 

!\[directivas\](../img/directivas.jpg "directivas") 

Observa que en la configuración anterior se usa el nombre `avatar.doesntexist.org` y no `avatar.dynalias.com`. Usaremos este nombre en toda esta unidad. 

* Observa que en la directiva `mydestination` se indican los dominios que serán propios del servidor Avatar, es decir, el correo enviado a estos dominios está dirigido a usuarios del propio servidor Avatar. Si el usuario existe, el mensaje será almacenado, sino el servidor devolverá un mensaje de error. 

> Observación: en la figura anterior se ha incluído el destino `avatar.doesntexist.org` (`usuario-x@avatar.doesntexist.org`) para conseguir que Avatar recepcione correo de usuarios de este dominio. Como aprenderás a lo largo de la unidad, se enviará correo desde cualquier puesto de la red MZ con destino a usuarios del dominio `avatar.doesntexist.org`. También podremos recibir correo desde Internet con destino este dominio. No obstante si queremos disponer de otro dominio interno (`example.com` que configuramos en la unidad de DNS) bastaría con añadir `avatar.example.com` a la lista de la directiva `mydestination`. 

* Con la directiva `relay_domains` indicamos los dominios que serán reenviados. Por lo tanto se permitirán el envío de correos a usuarios de estos dominios. En nuestro ejemplo, se permite el envío a usuarios de `gmail.com`. Avatar recibirá el mensaje y lo reenviará al servidor que gestiona estos dominIos. Prueba a añadir otros dominios. 

* Con `mynetworks` se indican las IPs desde las que pueden enviarse mensajes. En esta configuración sólo se admiten desde el propio servidor de correo Avatar. 

* Por último, con `myorigin` se indica el dominio con el que el servidor enviará correo, el cual está configurado en `/etc/mailname` y cuyo contenido es `avatar.doesntexist.org`."