---
title: "Instalación de un CMS: Moodle"
---

En esta práctica vamos a instalar un gestor de contenido especializado para entornos educativo como es Moodle. Moodle está implementado con PHP y necesita una base de datos para guardar información.  

1. Siguiendo la documentación aportada instala php5 y mysql.  
2. Descarga la última versión de moodle:  

        wget http://download.moodle.org/download.php/stable19/moodle-weekly-19.tgz

3. Descomprime el fichero en el directorio `/srv/www/ies/moodle` y desde un navegado accede a `http://www.ies.org/moodle` e instala moodle siguiendo la documentación aportada.  
4. Podemos hacer una redirección para cuando entremos en `www.ies.org` se acceda directamente a moodle, una forma de hacerlo es mediante Php. Crea un fichero `index.php` en la ráiz del sitio (`/srv/www/ies`) con el siguiente código:  

        <? Header("Location:http://www.ies.org/moodle"); ?>