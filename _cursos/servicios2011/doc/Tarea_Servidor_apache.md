---
title: "Tarea Servidor apache"
---

Esta tarea consiste en configurar un sitio web con el CMS Joomla y configurarlo para que el proceso de autenticación se realice de forma segura cifrando el acceso con SSL, para ello deberás realizar los siguientes pasos:

1. Instala apache en avatar
2. Crea un certificado autofirmado con una clave RSA de 2048 bits
3. Configura apache con ssl con el certificado anterior
4. Instala joomla en el sitio web por defecto
5. Configura adecuadamente joomla para que el login de los usuarios se realice a través del protocolo https.

Ficheros a entregar:  

1. Captura de pantalla del navegador accediendo a `avatar.example.com` antes del login (acceso normal por http)
2. Captura de pantalla del proceso de login (https)
3. Captura de pantalla del certificado del sitio aceptado por el navegador