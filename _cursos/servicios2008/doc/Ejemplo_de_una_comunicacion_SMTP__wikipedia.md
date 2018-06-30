---
title: Ejemplo de una comunicación SMTP (wikipedia)
---

En primer lugar se ha de establecer una conexión entre el emisor (cliente) y el receptor (servidor). Esto puede hacerse automáticamente con un programa cliente de correo o mediante un simple cliente telnet.

En el siguiente ejemplo se muestra una conexión típica. Se nombra con la letra C al cliente y con S al servidor.

    S: 220 Servidor ESMTP
    C: HELO
    S: 250 Hello, please meet you
    C: MAIL FROM: yo@midominio.com
    S: 250 Ok
    C: RCPT TO: destinatario@sudominio.com
    S: 250 Ok
    C: DATA
    S: 354 End data with &lt;CR&gt;&lt;LF&gt;.&lt;CR&gt;&lt;LF&gt;
    C: Subject: Campo de asunto
    C: From: yo@midominio.com
    C: To: destinatario@sudominio.com
    C:
    C: Hola,
    C: Esto es una prueba.
    C: Adios.
    C: .
    S: 250 Ok: queued as 12345
    C: quit
    S: 221 Bye
    
