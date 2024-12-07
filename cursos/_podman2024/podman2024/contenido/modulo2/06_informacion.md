---
title: "Obteniendo información de los contenedores"
permalink: /cursos/podman2024/contenido/modulo2/06_informacion.html
---

En esta ocasión vamos a usar la imagen `quay.io/libpod/banner` que nos ofrece un servidor web con una página predeterminada. Es una imagen muy liviana.

```
$ podman run -d --name webserver -p 8081:80 quay.io/libpod/banner
```

## Visualizar procesos que se ejecutan en un contenedor

Podemos visualizar los procesos que se están ejecutando en un contenedor con el comando `podman top`:

```
$ podman top webserver
```

## Obtener información de los contenedores

Para obtener información de cualquier objeto Podman vamos a usar el subcomando `inspect`. En el caso de los contenedores, ejecutamos:

```
$ podman inspect webserver
```
Nos muestra mucha información en formato JSON (JavaScript Object Notation):

* El id del contenedor.
* Los puertos abiertos y sus redirecciones.
* Los bind mounts y volúmenes usados.
* El tamaño del contenedor (si ejecutamos `podman inspect -s`).
* La configuración de red del contenedor.
* El comando que se esta ejecutando en el contenedor.
* El valor de las variables de entorno.
* Y muchas más cosas....

Como nos devuelve mucha información podemos filtrar los campos que nos interesan, por ejemplo:

El identificado del contenedor:

```
$ podman inspect --format='{% raw %}{{.Id}}{% endraw %}' webserver
```

El nombre de la imagen que hemos usado para crear el contenedor:

```
$ podman inspect --format='{% raw %}{{.Config.Image}}{% endraw %}' webserver
```

El valor de las variables de entorno definidas en el contenedor:

```
$ podman container inspect --format '{% raw %}{{range .Config.Env}}{% endraw %}{% raw %}{{println .}}{% endraw %}{% raw %}{{end}}{% endraw %}' webserver
```

El comando que hemos ejecutado en el contenedor:

```
$ podman inspect --format='{% raw %}{{range .Config.Cmd}}{% endraw %}{% raw %}{{println .}}{% endraw %}{% raw %}{{end}}{% endraw %}' webserver
```

La dirección IP que tiene el contenedor:

```
$ podman inspect --format='{% raw %}{{range .NetworkSettings.Networks}}{% endraw %}{% raw %}{{.IPAddress}}{% endraw %}{% raw %}{{end}}{% endraw %}' webserver
```

## Etiquetando los contenedores con Labels

Las etiquetas son un mecanismo para guardar metadatos en los objetos Podman: en contenedores, imágenes, volúmenes, redes, etc. Podemos utilizar etiquetas para organizar los distintos objetos Podman que estemos utilizando.

Una etiqueta es una información del tipo clave-valor, almacenado como una cadena. Para etiquetar un contenedor en su creación utilizaremos el parámetro `-l` (`--label`).

```
$ podman run -l servicio=bd -l entorno=produccion --name contenedor ubuntu
```

Hay que tener en cuenta que estos contenedores tendrán además de las etiquetas indicadas en su creación, las etiquetas que estén definidas en la imagen que hemos utilizado para su creación.

```
$ podman inspect --format '{% raw %}{{range $key, $value := .Config.Labels}}{% endraw %}{% raw %}{{$key}}{% endraw %}: {% raw %}{{$value}}{% endraw %}{% raw %}{{"\n"}}{% endraw %}{% raw %}{{end}}{% endraw %}' contenedor
entorno: produccion
org.opencontainers.image.ref.name: ubuntu
org.opencontainers.image.version: 22.04
servicio: bd
```

A la hora de listar los contenedores podemos filtrar por varios criterios, entre ellos podemos usar las etiquetas para hacer el filtro.

Mostrar los contenedores que tienen la etiqueta entorno con el valor `produccion`:

```
podman ps -a --filter="label=entorno=produccion"
```


