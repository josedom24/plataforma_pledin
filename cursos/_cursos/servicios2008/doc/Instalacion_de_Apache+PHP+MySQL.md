---
title: Instalación de Apache+PHP+MySQL
---

Instalando Apache:  
  
    # apt-get install apache2  
  
Instalando MySQL:  
  
    # apt-get install mysql-common mysql-client mysql-server  
  
Instalando Php 5.0:  
  
    # apt-get install php5 libapache-mod-php5 php5-mysql  
  
Eso es todo, como gestor de la base de datos podemos utilizar phpmyadmin, programa php que me permite acceder a todas las funciones de mySql  
  
    # apt-get install phpmyadmin.  


Para probar el funcionamiento de apache y PHP, crea un documento `index.php` y cópialo en la carpeta `/var/www`:

    <html>  
    <body>  
    <? echo phpinfo(); ?>  
    </body>  
    </html>


Cuando en un navegador pongamos [http://localhost](http://localhost/), debe aparecer información sobre la versión PHP instalada.