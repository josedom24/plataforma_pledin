---
title: Introducción a Docker
---

![osv4](https://www.josedomingo.org/pledin/assets/wp-content/uploads/2024/10/docker.png){: .align-center }

En los últimos años se ha ido extendiendo el uso de contenedores como elementos esenciales para el uso de aplicaciones en entornos en producción, tanto más cuanto más variable sea la demanda, la frecuencia con la que se actualizan o la necesidad de que funcionen de forma ininterrumpida.
Gestionar una aplicación sobre contenedores, que pueda actualizarse rápidamente, que sea escalable o tolerante a fallos, es una tarea compleja que se realiza mediante un software específico.

Docker es una empresa (Docker Inc.) que desarrolla un software con el mismo nombre, de forma más concreta el software denominado (docker engine), que ha supuesto una revolución en el desarrollo de software, muy ligado al uso de contenedores de aplicaciones, a las aplicaciones web y al desarrollo ágil.
Docker permite gestionar contenedores a alto nivel, proporcionando todas las capas y funcionalidad adicional y, lo más importante de todo, es que proporciona un nuevo paradigma en la forma de distribuir las aplicaciones, ya que se crean imágenes en contenedores que se distribuyen, de manera que el contenedor que se ha desarrollado es idéntico al que se utiliza en producción y deja de instalarse la aplicación de forma tradicional.

En este curso se va a introducir el concepto de la puesta en producción de aplicaciones web usando contenedores Docker.

Los siguientes contenidos forman parte de un curso que he impartido para [OpenWebinars](https://openwebinars.net/cursos/docker-introduccion/) en mayo de 2024.

Puedes obtener todo el contenido del curso en el repositorio [GitHub](https://github.com/josedom24/curso_docker_ow). Puedes acceder al [Repositorio con los ficheros de los ejercicios](https://github.com/josedom24/ejemplos_curso_docker_ow).


## Unidades

1. Introducción a Docker
    * [Introducción a los contenedores](contenido/modulo1/01_contenedores.html)
    * [Introducción a Docker](contenido/modulo1/02_docker.html)
    * [Instalación de Docker Engine en Linux](contenido/modulo1/03_instalacion_linux.html)
    * [Instalación de Docker Desktop en Linux](contenido/modulo1/04_desktop_linux.html)
    * [Instalación de Docker Desktop en Windows](contenido/modulo1/05_desktop_windows.html)
    
2. Ejecución de contenedores
    * [El "Hola Mundo" de Docker](contenido/modulo2/01_holamundo.html) 
    * [Ejecución simple de contenedores](contenido/modulo2/02_contenedor.html) 
    * [Más opciones en la ejecución de contenedores (1ª parte)](contenido/modulo2/03_masopciones.html)
    * [Más opciones en la ejecución de contenedores (2ª parte)](contenido/modulo2/04_masopciones2.html)
    * [Gestión de contenedores Docker](contenido/modulo2/05_gestion.html)
    * [Ejemplo: Creando un contenedor con un servidor web](contenido/modulo2/06_web.html)
    * [Ejemplo: Configuración de un contenedor con la imagen MariaDB](contenido/modulo2/07_mariadb.html)
    * [Etiquetando los contenedores con Labels](contenido/modulo2/08_labels.html)
    * [Limitando los recursos utilizados por un contenedor Docker](contenido/modulo2/09_limite.html)

3. Gestión de imágenes en Docker
    * [Imágenes Docker](contenido/modulo3/01_imagenes.html)
    * [Registro de imágenes: Docker Hub](contenido/modulo3/02_dockerhub.html)
    * [Gestión de Imágenes](contenido/modulo3/03_gestion.html)
    * [¿Cómo se organizan las imágenes?](contenido/modulo3/04_organizacion.html)
    * [Demostración: Almacenamiento de imágenes y contenedores](contenido/modulo3/05_almacenamiento.html)
    * [Ejemplo: Desplegando la aplicación MediaWiki](contenido/modulo3/06_mediawiki.html)

4. Almacenamiento en Docker
    * [Los contenedores son efímeros](contenido/modulo4/01_efimeros.html)
    * [Almacenamiento en Docker](contenido/modulo4/02_almacenamiento.html)
    * [Asociando almacenamiento a los contenedores: volúmenes Docker](contenido/modulo4/03_volumen.html)
    * [Asociando almacenamiento a los contenedores: bind mount](contenido/modulo4/04_bindmount.html)
    * [Ejemplo 1: Contenedor NextCloud con almacenamiento persistente](contenido/modulo4/05_nextcloud.html)
    * [Ejemplo 2: Contenedor MariaDB con almacenamiento persistente](contenido/modulo4/06_mariadb.html)
    * [Otros usos del almacenamiento en Docker](contenido/modulo4/07_otrosusos.html)

5. Redes en Docker
    * [Introducción a las redes en Docker](contenido/modulo5/01_redes.html)
    * [Uso de la red host en Docker](contenido/modulo5/02_host.html)
    * [Uso de la red bridge por defecto](contenido/modulo5/03_bridge.html)
    * [Redes bridge definidas por el usuario](contenido/modulo5/04_usuario.html)
    * [Uso de la red bridge definidas por el usuario](contenido/modulo5/05_usuario2.html)
    * [Ejemplo 1: Despliegue de la aplicación Guestbook](contenido/modulo5/06ejemplo1.html)
    * [Ejemplo 2: Despliegue de la aplicación Temperaturas](contenido/modulo5/07_ejemplo2.html)
    * [Ejemplo 3: Despliegue de WordPress + MariaDB](contenido/modulo5/08_ejemplo3.html)
    * [Ejemplo 4: Despliegue de Apache Tomcat + nginx](contenido/modulo5/09_ejemplo4.html) 

6. Creando escenarios multicontenedor con Docker Compose
    * [Creando escenarios multicontenedor con Docker Compose](contenido/modulo6/01_compose.html)
    * [El fichero compose.yaml](contenido/modulo6/02_docker_compose.html) 
    * [El comando docker compose](contenido/modulo6/03_comando.html) 
    * [Almacenamiento con Docker Compose](contenido/modulo6/04_almacenamiento.html)
    * [Redes con Docker Compose](contenido/modulo6/05_redes.html)
    * [Ejemplo 1: Despliegue de la aplicación Guestbook](contenido/modulo6/06_ejemplo1.html)
    * [Ejemplo 2: Despliegue de la aplicación Temperaturas](contenido/modulo6/07_ejemplo2.html)
    * [Ejemplo 3: Despliegue de WordPress + MariaDB](contenido/modulo6/08_ejemplo3.html)
    * [Ejemplo 4: Despliegue de Apache Tomcat + nginx](contenido/modulo6/09_ejemplo4.html)
    * [Uso de parámetros con Docker Compose](contenido/modulo6/10_variables.html)
    * [Ejemplos reales de despliegues usando Docker Compose](contenido/modulo6/11_ejemplos.html) 

7. Creación de imágenes en Docker
    * [Introducción a la construcción y distribución de imágenes Docker](contenido/modulo7/01_introduccion.html)
    * [Creación de imágenes a partir de un contenedor](contenido/modulo7/02_contenedor.html)
    * [El fichero Dockerfile](contenido/modulo7/03_docker-file.html)
    * [Creación de imágenes a partir de un Dockerfile](contenido/modulo7/04_build.html)
    * [Distribución de imágenes](contenido/modulo7/05_distribucion.html)
    * [Ejemplo 1: Construcción de imágenes con una página estática](contenido/modulo7/06_ejemplo1.html)
    * [Ejemplo 2: Construcción de imágenes con una una aplicación PHP](contenido/modulo7/07_ejemplo2.html)
    * [Ejemplo 3: Construcción de imágenes con una una aplicación Python](contenido/modulo7/08_ejemplo3.html)
    * [Ejemplo 4: Construcción de imágenes configurables con variables de entorno](contenido/modulo7/09_ejemplo4.html)
    * [Ejemplo 5: Configuración de imágenes con una aplicación Java](contenido/modulo7/10_ejemplo5.html)
    * [Creación de imágenes con Docker Compose](contenido/modulo7/11_compose_build.html)
    * [Uso de ficheros Dockerfile parametrizados](contenido/modulo7/12_variables.html)
    * [Ciclo de vida de nuestras aplicaciones con Docker](contenido/modulo7/13_ciclodevida.html)
    * [Eliminar objetos Docker no utilizados](contenido/modulo7/14_prune.html)

8. Docker Desktop
    * [Introducción a la interfaz de Docker Desktop](contenido/modulo8/01_introduccion.html)
    * [Gestión de imágenes en Docker Desktop](contenido/modulo8/02_imagen.html)
    * [Gestión de contenedores en Docker Desktop](contenido/modulo8/03_contenedor.html)
    * [Gestión de volúmenes en Docker Desktop](contenido/modulo8/04_volumen.html)
    * [Gestión de creación de imágenes en Docker Desktop](contenido/modulo8/05_build.html)
    * [Extensiones en Docker Desktop](contenido/modulo8/06_extensiones.html)

