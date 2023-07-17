---
title: "OpenShift v4 como PaaS"
---

![osv4](https://www.josedomingo.org/pledin/assets/wp-content/uploads/2023/05/openshift.png)


En esta formación vamos a aprender las distintas estrategias de despliegues de aplicaciones que nos ofrece OpenShift v4, que nos permite enmarcar esta herramienta en un servicio PaaS.

Los siguientes contenidos forman parte de un curso que he impartido para [OpenWebinars](https://openwebinars.net/cursos/openshift-v4-paas/) en mayo de 2023.

Puedes obtener todo el contenido del curso en el repositorio [GitHub](https://github.com/josedom24/curso_openshift_v4/blob/main/curso2/README.md). Puedes acceder al [Repositorio con los ficheros de los ejercicios](https://github.com/josedom24/ficheros_osv4_curso2).


## Unidades

1. Introducción a OpenShift v4
	* [Cloud Computing PaaS: Plataforma como servicio](modulo01/paas.md)
	* [OpenShift, la plataforma PaaS de Red Hat](modulo01/openshift.md)
	* [Plataformas para trabajar con OpenShift v4](modulo01/plataformas.md)
	* [Introducción a  Red Hat OpenShift Dedicated Developer Sandbox](modulo01/sandbox.md)

2. Despliegue de aplicaciones en OpenShift v4
	* [Introducción al despliegue de aplicaciones en OpenShift v4](modulo02/introduccion.md)
	* [Despliegue de aplicaciones desde imágenes con oc](modulo02/imagen.md)
	* [Despliegue de aplicaciones desde imágenes desde la consola web](modulo02/imagen_web.md)
	* [Despliegue de aplicaciones desde código fuente con oc](modulo02/codigo.md)	
	* [Despliegue de aplicaciones desde código fuente con oc (2ª parte)](modulo02/codigo2.md)
	* [Despliegue de aplicaciones desde código fuente desde la consola web](modulo02/codigo_web.md)
	* [Despliegue de aplicaciones desde Dockerfile con oc](modulo02/docker.md)
	* [Despliegue de aplicaciones desde Dockerfile desde la consola web](modulo02/docker_web.md)
	* [Despliegue de aplicaciones desde el catálogo con oc](modulo02/catalogo.md)
	* [Despliegue de aplicaciones desde el catálogo desde la consola web](modulo02/catalogo_web.md)

3. ImageStreams: Gestión de imágenes en OpenShift v4
	* [Introducción al recurso ImageStream](modulo03/introduccion.md)
	* [ImageStream a imágenes del registro interno](modulo03/registro_interno.md)
	* [Creación de ImageStream](modulo03/crear_is.md)
	* [Gestión de ImageStream desde la consola web](modulo03/is_web.md)
	* [Gestión de las etiquetas en un ImageStream](modulo03/etiquetas.md)
	* [Actualización automática de ImageStream](modulo03/update.md)

4. Builds: Construcción automática de imágenes
	* [Introducción a la construcción automática de imágenes (build)](modulo04/build.md)
	* [Construcción de imágenes con estrategia Source-to-Image (S2I) + repositorio Git](modulo04/s2i.md)
	* [Construcción de imágenes con estrategia Docker + repositorio Git](modulo04/docker.md)
	* [Definición del objeto BuildConfig](modulo04/buildconfig.md)
	* [Actualización manual de un build](modulo04/actualizacion.md)
	* [Construcción de imágenes desde ficheros locales](modulo04/binary.md)
	* [Construcción de imágenes con Dockerfile en línea](modulo04/dockerfile_inline.md)
	* [Gestión de builds desde la consola web](modulo04/build_web.md)
	* [Actualización automática de un build](modulo04/imagechange.md)
	* [Actualización automática de un build por trigger webhook](modulo04/webhook.md)

5. Deployment us DeploymentConfig
	* [Características del recurso DeploymentConfig](modulo05/dc.md)
	* [Creación de un DeployConfig al crear una aplicación](modulo05/newdc.md)
	* [Definición de un recurso DeploymentConfig](modulo05/deploymentconfig.md)
	* [Actualización de un DeploymentConfig (rollout)](modulo05/rollout.md)
	* [Rollback de un DeploymentConfig](modulo05/rollback.md)
	* [Trabajando con DeploymentConfig desde la consola web](modulo05/dc_web.md)
	* [Estrategias de despliegues](modulo05/estretegias.md)
	* [Estrategias de despliegues basadas en rutas](modulo05/estrategias_rutas.md)

6. Plantillas: empaquetando los objetos en OpenShift
	* [Introducción a los Templates](modulo06/template.md)
	* [Descripción de un objeto Template](modulo06/descripcion.md)
	* [Crear objetos desde un Template](modulo06/crear_template.md)
	* [Crear objetos desde un Template desde la consola web](modulo06/template_web.md)
	* [Creación de plantillas a partir de objetos existentes](modulo06/crear_template2.md)
	* [Despliegue de una aplicación con plantillas](modulo06/php-template.md)
	* [Uso de Helm en OpenShift desde la consola web](modulo06/helm-web.md)
	* [Uso de Helm en OpenShift desde la línea de comandos](modulo06/helm-cli.md)

7. Almacenamiento en OpenShift v4
	* [Introducción al almacenamiento en OpenShift v4](modulo07/almacenamiento.md)
	* [Almacenamiento en Red Hat OpenShift Dedicated Developer Sandbox](modulo07/almacenamiento_sandbox.md)
	* [Ejemplo 1: Gestión de almacenamiento desde la consola web: phpsqlitecms (1ª parte)](modulo07/phpsqlitecms.md)
	* [Ejemplo 1: Gestión de almacenamiento desde la consola web: phpsqlitecms (2ª parte)](modulo07/phpsqlitecms2.md)
	* [Ejemplo 2: Gestión de almacenamiento desde la línea de comandos: GuestBook](modulo07/guestbook.md)
	* [Ejemplo 3: Haciendo persistente la aplicación Wordpress](modulo07/wordpress.md)
	* [Instantáneas de volúmenes](modulo07/snapshot.md)

8. OpenShift Pipelines
	
	* [Introducción a OpenShift Pipelines](modulo08/introduccion_pipeline.md)
	* [Despliegue de una aplicación con OpenShift Pipeline](modulo08/pipeline.md)
	* [Gestión de OpenShift Pipeline desde el terminal](modulo08/pipeline_terminal.md)
	* [Gestión de OpenShift Pipeline desde la consola web](modulo08/pipeline_web.md)
	* [Instalación de OpenShift Pipeline en CRC](modulo08/operador.md)

9. OpenShift Serverless

	* [Introducción a OpenShift Serverless](modulo09/serverless.md)
	* [Ejemplo de Serverless Serving](modulo09/serving.md)
	* [Ejemplo de Serverless Eventing](modulo09/eventing.md)
	* [Ejemplo de Serverless Function](modulo09/function.md)
	* [Instalación de OpenShift Serverless en CRC](modulo09/operador.md)

10. Ejemplos de despliegues de aplicaciones web
	* [Despliegue de aplicación Citas en OpenShift v4 (1ª parte)](modulo10/citas.md)
	* [Despliegue de aplicación Citas en OpenShift v4 (2ª parte)](modulo10/citas2.md)
	* [Despliegue de aplicación Parksmap en OpenShift v4 (1ª parte)](modulo10/parksmap.md)
	* [Despliegue de aplicación Nationalparks en OpenShift v4 (2ª parte)](modulo10/parksmap2.md)
	