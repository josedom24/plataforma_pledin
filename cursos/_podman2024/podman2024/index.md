---
title: Introducción a Podman
---

## Ejemplos

* [Repositorio con el código de los ejemplos](https://github.com/josedom24/ejemplos_curso_podman_ow)

## Contenido

1. Introducción a Podman    
    * [Introducción a los contenedores OCI](contenido/modulo1/01_contenedores.html)
    * [Aplicaciones para trabajar con contenedores OCI](contenido/modulo1/02_aplicaciones.html)
    * [Introducción de Podman](contenido/modulo1/03_podman.html)
    * [Instalación de Podman en Linux](contenido/modulo1/04_linux.html)
    * [Instalación de Podman en Windows/macOS](contenido/modulo1/05_windows.html)
2. Ejecución de contenedores OCI con Podman
    * [El "Hola Mundo" en Podman](contenido/modulo2/01_holamundo.html)
    * [Ejecución simple de contenedores](contenido/modulo2/02_contenedor.html)
    * [Ejecución de contenedores interactivos](contenido/modulo2/03_interactivo.html)
    * [Ejecución de contenedores demonios](contenido/modulo2/04_demonio.html)
    * [Ejecución de un contenedor demonio con un servidor web](contenido/modulo2/05_web.html)
    * [Obteniendo información de los contenedores](contenido/modulo2/06_informacion.html)
    * [Configuración de contenedores](contenido/modulo2/07_configuracion.html)    
    * [Ejecución de un contenedor con un servidor de base de datos](contenido/modulo2/08_mariadb.html)    
    * [Modos de funcionamiento de los contenedores](contenido/modulo2/09_funcionamiento.html)
    * [¿Cómo funcionan los contenedores rootless?](contenido/modulo2/10_rootless.html)
3. Gestión de imágenes OCI en Podman
    * [Introducción a las imágenes OCI](contenido/modulo3/01_imagenes.html)
    * [Introducción al formato de imagen OCI](contenido/modulo3/02_formato.html)
    * [Almacenamiento de imágenes](contenido/modulo3/03_almacen_img.html)
    * [Ahorro de espacio de almacenamiento](contenido/modulo3/04_ahorro_almacenamiento.html)
    * [Almacenamiento de contenedores](contenido/modulo3/05_almacen_cont.html)
    * [Almacenamiento de contenedores rootless](contenido/modulo3/06_rootless.html)
    * [Gestión de imágenes](contenido/modulo3/07_gestion.html)
    * [Obteniendo información de las imágenes](contenido/modulo3/08_informacion.html)
    * [Ejemplo: Desplegando la aplicación Drupal](contenido/modulo3/09_drupal.html)
4. Almacenamiento y redes en Podman
    * [Almacenamiento en Podman](contenido/modulo4/01_almacenamiento.html)
    * [Trabajando con volúmenes](contenido/modulo4/02_volumen.html)
    * [Trabajando con bind mount](contenido/modulo4/03_bindmount.html)
    * [Trabajando con almacenamiento en contenedores rootless](contenido/modulo4/04_almacenamiento_rootless.html)
    * [Redes en Podman](contenido/modulo4/05_redes.html)
    * [Uso de la red bridge por defecto](contenido/modulo4/06_bridge.html)
    * [Gestión de redes definidas por el usuario](contenido/modulo4/07_usuario.html)
    * [Uso de la red bridge definidas por el usuario](contenido/modulo4/08_usuario2.html)
    * [Uso de la red host en Podman](contenido/modulo4/09_host.html)
    * [Redes en contenedores rootless](contenido/modulo4/10_red_rootless.html)
    * [Despliegue de la aplicación Guestbook](contenido/modulo4/11_guestbook.html)
    * [Despliegue de la aplicación Temperaturas](contenido/modulo4/12_temperaturas.html)

5. Gestión de Pods en Podman
    * [Trabajando con Pods en Podman](contenido/modulo5/01_pod.html)
    * [Gestión de Pods](contenido/modulo5/02_gestion.html)
    * [Funcionamiento de la red en un Pod](contenido/modulo5/03_red.html)
    * [Almacenamiento compartido entre los contenedores de un Pod](contenido/modulo5/04_almacenamiento.html)
    * [Ejemplo: Despliegue de WordPress + MariaDB en un Pod](contenido/modulo5/05_wordpress.html)
    * [Ejemplo: Despliegue de WordPress + MariaDB en un escenario multipod](contenido/modulo5/06_wordpress2.html)
    * [Ejemplo: nginx + fpm-php](contenido/modulo5/07_nginx.html)
    * [Generación de un archivo YAML de Kubernetes con Podman](contenido/modulo5/08_kubernetes.html)
    * [Ejecutando recursos de Kubernetes en Podman](contenido/modulo5/09_kubernetes2.html)

6. Gestionando recursos de Podman con Systemd y Quadlet
    * [Introducción a Quadlet](contenido/modulo6/01_quadlet.html)
    * [Ejecución de contenedores con Systemd y Quadlet](contenido/modulo6/02_contenedor.html)
    * [Gestionando volúmenes y redes con Systemd y Quadlet](contenido/modulo6/03_vol_redes.html)
    * [Ejecución de Pods con Systemd y Quadlet](contenido/modulo6/04_pod.html)
    * [Ejemplo: Despliegue de WordPress + MariaDB con Systemd y Quadlet](contenido/modulo6/05_wordpress.html)

7. Gestionando escenarios multicontenedor con podman-compose
    * [Creando escenarios multicontenedor con Compose](contenido/modulo7/01_compose.html)
    * [El fichero compose.yaml](contenido/modulo7/02_compose_yaml.html)
    * [El comando podman-compose](contenido/modulo7/03_podman_compose.html)
    * [Almacenamiento y redes con Compose](contenido/modulo7/04_almacenamiento_redes.html)
    * [Uso de parámetros con Compose](contenido/modulo7/05_variables.html)
    * [Creación de contenedores rootless conectados a la red slirp4netns](contenido/modulo7/06_rootless.html)
    * [Despliegue de la aplicación Guestbook](contenido/modulo7/07_guestbook.html)
    * [Despliegue de la aplicación Temperaturas](contenido/modulo7/08_temperaturas.html)
    
8. Gestión de imágenes OCI con Podman
    * [Construcción y distribución de imágenes OCI](contenido/modulo8/01_introduccion.html)
    * [Construcción de imágenes a partir de un contenedor](contenido/modulo8/02_contenedor.html)
    * [El fichero Containerfile](contenido/modulo8/03_containerfile.html)
    * [Construcción de imágenes con podman build](contenido/modulo8/04_build.html)
    * [Construcción de imágenes configurables con variables de entorno](contenido/modulo8/05_configuracion.html)
    * [Construcción de imágenes con Compose](contenido/modulo8/06_compose.html)
    * [Distribución de imágenes OCI](contenido/modulo8/07_distribucion.html)
    * [Uso de ficheros Containerfile parametrizados](contenido/modulo8/08_variables.html)
    
9. Gestión de imágenes OCI con Buildah y Skopeo
    * [Introducción a Buildah y Skopeo](contenido/modulo9/01_introduccion.html)
    * [Construcción de imágenes desde una imagen base con Buildah](contenido/modulo9/02_base.html)
    * [Construcción de imágenes desde cero con Buildah](contenido/modulo9/03_scratch.html)
    * [Construcción de imágenes desde un Containerfile con Buildah](contenido/modulo9/04_build.html)
    * [Distribución de imágenes con Buildah](contenido/modulo9/05_distribucion.html)
    * [Gestión de imágenes con Skopeo](contenido/modulo9/06_skopeo.html)
    
10. Podman Desktop
    * [Introducción a Podman Desktop](contenido/modulo10/01_introduccion.html)
    * [Gestión de imágenes en Podman Desktop](contenido/modulo10/02_imagenes.html)
    * [Gestión de contenedores en Podman Desktop](contenido/modulo10/03_contenedor.html)
    * [Gestión de Pods en Podman Desktop](contenido/modulo10/04_pod.html)
    * [Gestión de volúmenes en Podman Desktop](contenido/modulo10/05_volumenes.html)
    * [Construcción de imágenes en Podman Desktop](contenido/modulo10/06_build.html)