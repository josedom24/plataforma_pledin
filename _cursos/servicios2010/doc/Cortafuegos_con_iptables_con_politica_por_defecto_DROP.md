---
title: "Cortafuegos con iptables con política por defecto DROP
---

Sube un fichero de texto (.txt) con las líneas de iptables necesarias para crear un cortafuegos con las siguientes características:  

* Cliente puede acceder utilizar los protocolos HTTPS, SMTP, DNS, POP3 y LDAP
* Cliente tiene redireccionados los puertos 4662/tcp y 4672/udp para poder utilizar un programa tipo eMule/aMule.
* Cliente utiliza el protocolo HTTP mediante proxy transparente con squid

Añade en el fichero con todas las reglas la salida de las instrucciones después de haber probado todos los protocolos desde cliente:  
  
    iptables -t nat -L -n -v
    iptables -L -n -v
"