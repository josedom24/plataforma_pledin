---
title: "Otros usos del almacenamiento en Docker"
permalink: /cursos/docker2024/contenido/modulo4/07_otrosusos.html
---

En los ejemplos anteriores hemos usado los volúmenes como copia de seguridad de la información, para hacer persistente los contenedores. En este apartado vamos a ver dos ejemplos explicando otros dos usos que le podemos dar al almacenamiento en Docker.

## Compartir información entre contenedores

En este caso vamos a usar un volumen o bind mount para compartir información entre dos contenedores. Si seguimos el principio de que un contenedor tiene que ejecutar un sólo proceso, en ocasiones nos puede hacer falta que otro contenedor haga una operación auxiliar y genere una información que compartirá con el primero por medio de almacenamiento que estará montado en los dos contenedores.

Un ejemplo podría ser un servicio web que está ofreciendo información que tiene que ir leyendo de un repositorio Git. En este caso podríamos poner un contenedor secundario que cada cierto tiempo leyera el repositorio y le pasara la información al primer contenedor por medio de almacenamiento compartido.

En nuestro ejemplo vamos a hacer algo mucho más sencillo: el contenedor principal es un servidor web que ofrece un fichero `index.html` y este fichero se va actualizando por el segundo contenedor, que en el ejemplo lo único que va a hacer es escribir la fecha y la hora cada segundo en ese fichero. Vemos el ejemplo usando volúmenes Docker:

Lo primero creamos el volumen:

```bash
$ docker volume create datos_compartidos
```

Creamos el primer contenedor con el volumen montado en el *DocumentRoot* del servidor web y el tipo de acceso **solo lectura**, opción `ro`:

```bash
$ docker run -d -p 8081:80 --name contenedor1 -v datos_compartidos:/var/www/html:ro php:7.4-apache
```

A continuación creamos el segundo contenedor con un proceso que va a modificar el fichero `index.html` que guarda en el volumen cada un segundo:

```bash
$ docker run -d  --name contenedor2 --mount type=volume,src=datos_compartidos,dst=/srv debian bash -c "while true; do date >> /srv/index.html;sleep 1;done"
```

Accedemos al puerto 8081/tcp del Host Docker y comprobamos cómo se va actualizando el fichero `index.html`.

Lo podríamos hacer también con bind mount:

```bash
$ docker run -d -p 8081:80 --name contenedor1 -v /opt/compartido:/var/www/html:ro php:7.4-apache
$ docker run -d  --name contenedor2 -v /opt/compartido:/srv debian bash -c "while true; do date >> /srv/index.html;sleep 1;done"
```

Y podríamos ver el contenido del fichero `/opt/compartido/index.html`.


## Comprobar compatibilidad de código entre distintas versiones de un lenguaje de programación

Otro utilidad que le podemos dar al almacenamiento, en este caso a los bind mount, es la posibilidad de comprobar la compatibilidad de un código en diferentes versiones de un lenguaje de programación.

Veamos un ejemplo en PHP: imaginemos que tenemos un código que es compatible y funciona bien en PHP5 y queremos comprobar como se comporta en la versión PHP7. 

Siguiendo la documentación [Migración de PHP 5.6.x a PHP 7.0.x](https://www.php.net/manual/es/migration70.php), he escogido la función [list](https://www.php.net/manual/es/function.list.php) que se comporta de manera distinta en PHP5 que en PHP7: en PHP5, `list()` asigna los valores empezando desde el parámetro más a la derecha y en PHP7, empieza desde el parámetro más a la izquierda. 

Imaginemos que tenemos un directorio `/opt/codigo` con nuestra aplicación `index.php`:

```php
<?php
echo 'Versión actual de PHP: ' . phpversion(). "<br/>";

// Funciona bien en php5 ya que list hace la asignación desde el último al primero
$info = array('cafeína','marrón', 'café');

// Enumerar todas las variables
list($datos[], $datos[], $datos[]) = $info;
echo "El $datos[0] es $datos[1] y la $datos[2] lo hace especial.\n";
?>
```

A continuación vamos a crear dos contenedores que sirvan este código usando imágenes distintas , para cada versión de PHP y usando puertos distintos para acceder a cada versión de la aplicación:

```bash
$ docker run -d -p 8082:80 --name php56 -v /opt/codigo:/var/www/html:ro php:5.6-apache
$ docker run -d -p 8083:80 --name php74 -v /opt/codigo:/var/www/html:ro php:7.4-apache
```

Y ya podemos acceder a las dos aplicaciones que hemos desplegado y comprobar cómo se comportan según la versión de PHP que hemos usado.
