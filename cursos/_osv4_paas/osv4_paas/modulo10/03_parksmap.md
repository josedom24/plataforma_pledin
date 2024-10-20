---
title: "Despliegue de aplicación Parksmap en OpenShift v4 (1ª parte)"
permalink: /cursos/osv4_paas/modulo10/parksmap.html
---

Este ejercicio esta basado y es una adaptación del ejemplo que se muestra en la guía [OpenShift Starter Guides](https://redhat-scholars.github.io/openshift-starter-guides/rhs-openshift-starter-guides/4.9/index.html).

## Arquitectura de la aplicación

![parksmap](img/app-parksmap.png)

## Despliegue de Parksmap

**Parksmap** es la aplicación frontend que visualizará en un mapa las coordenados de los Parques Nacionales. Esta aplicación está escrita con el framework de Java **Spring-boot** y vamos a desplegarla usando la imagen `quay.io/openshiftroadshow/parksmap:latest` desde la consola web. Hemos escogido en la vista **Developer**, la opción **+Add -> Conatiner Images**, e indicamos la imagen y el icono de **spring-boot**:

![parksmap](img/parksmap1.png)

A continuación, indicamos el nombre de la aplicación `workshop`, el nombre del despliegue `parksmap` y creamos un recurso **Route**:

![parksmap](img/parksmap2.png)

Por último indicamos que vamos a desplegar la aplicación como un objeto **Deployment** e indicamos las siguientes etiquetas:

* `app=workshop`
* `component=parksmap`
* `role=frontend`

![parksmap](img/parksmap3.png)

Creamos el despliegue, y al cabo de unos segundos comprobamos los recursos creados en la topología:

![parksmap](img/parksmap4.png)

Accedemos a la URL del objeto **Route** y comprobamos que la aplicación está funcionando, aunque todavía no puede mostrar la localización de los puertos naturales:

![parksmap](img/parksmap5.png)

### Permisos

Todas las interacciones que hacemos sobre la API de OpenShift son **autenticadas** (¿Quién eres?) y **autorizadas** (¿Estás autorizado a hacer esta operación?).

Muchas de las interacciones que se hacen sobre la API de OpenShift se realizan por el usuario final, pero muchas otras se hacen internamente. Para hacer estas últimas peticiones a la API se utilizan unas cuentas especiales de usuario, que se llaman **Service Account**.

OpenShift crea automáticamente algunas **Service Account** en cada proyecto. Por ejemplo, hay una **Service Account** que se llama **default** y será la responsable de ejecutar los Pods.

Puede ver los permisos actuales en la consola web: en la vista **Administrator**, escogiendo la opción **User Management -> RoleBindings**:

![parksmap](img/parksmap6.png)

Más adelante, veremos que la aplicación Parksmap necesita hacer una petición a la API OpenShift para preguntar sobre la configuración de otros recursos.

Por lo tanto, tenemos que otorgar el permiso **view** al **Service Account default**, para que el Pod pueda consultar sobre los recursos que se encuentran dentro del proyecto. Para ello, pulsamos sobre le botón **Create binding** de la pantalla anterior y configuramos el permiso indicando el nombre del permiso, el proyecto y el **Role** `view` que se va a asignar a un **Service Account** llamado **default** en nuestro proyecto.

![parksmap](img/parksmap7.png)
![parksmap](img/parksmap8.png)

Si queremos hacerlo desde la terminal, ejecutamos:

    oc policy add-role-to-user view -z default

Finalmente actualizamos el despliegue:

    oc rollout restart deployment/parksmap