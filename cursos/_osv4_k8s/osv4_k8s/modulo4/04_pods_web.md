---
title: "Trabajando con Pods desde la consola web"
permalink: /cursos/osv4_k8s/modulo4/pods_web.html
---

Tenemos varias formas para ver los Pods que hemos creado en la unidad anterior. Por ejemplo desde la vista **Developer**, en la sección **Topology**, vemos todos los recursos que tenemos creado. 

![pod1](img/pod1.png)

Al elegir uno de los Pods, podemos ver en la ventana lateral todos los detalles, y en el desplegable **Actions**, algunas de las opciones que hemos estudiado (editar los labels, editar la definición del pod, eliminar el pod,...).

Otra forma de acceder a los Pods sería en la vista de **Administrator**, en el apartado **Workloads -> Pods**:

![pod2](img/pod2.png)

En este caso obtenemos la lista de Pods, y en el botón final (con tres puntos) tenemos las acciones que podemos realizar sobre un Pod en particular.

En esta pantalla también tenemos un botón **Create Pod** que nos permite la creación de un nuevo pod:

![pod3](img/pod3.png)

**Nota**: También podemos ejecutar un fichero YAML desde la vista **Developer**, sección **+Add** y la opción **Import YAML** (es lo mismo que el icono **+** que encontramos en la parte superior derecha).

Si pinchamos sobre un pod, obtenemos los detalles del mismo:

![pod4](img/pod4.png)

En esta pantalla tenemos varias opciones:

* **Details**: Nos da información del recurso, en este caso del Pod seleccionado.
* **Metrics**: Podemos ver las gráficas de métricas (uso de memoria, cpu, sistema de ficheros y red).
* **YAML**: Podemos editar el YAML con todos los parámetros del recurso.
* **Environment**: Podemos definir las variables de entorno que tendrán los contenedores del pod.
* **Logs**: Obtenemos los logs del pod.
* **Events**: Listamos los distintos eventos que se han producido sobre el recurso.
* **Terminal**: Accedemos a un terminal del contenedor del pod.

