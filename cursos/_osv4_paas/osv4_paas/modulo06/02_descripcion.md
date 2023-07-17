---
title: "Descripción de un objeto Template"
permalink: /cursos/osv4_paas/modulo06/descripcion.html
---

Vamos a crear un objeto **Template** desde su definición en un fichero YAML. En este ejemplo vamos a hacer un **Template** muy sencillo, que nos va a permitir crear un recurso **Deployment** usando la imagen `bitnami/mysql` y como veremos posteriormente hemos creado varios parámetros para permitir su configuración. Partimos del fichero `mysql-plantilla.yaml` con el siguiente contenido:

```yaml
apiVersion: template.openshift.io/v1
kind: Template
labels:
  app: deployment-mysql
metadata:
  name: mysql-plantilla
  annotations:
    description: "Plantilla para desplegar un deployment de mysql"
    iconClass: "icon-mysql-database"
    tags: "database,mysql"
objects:
- apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: ${NOMBRE_APP}
  spec:
    replicas: ${{REPLICAS}}
    selector:
      matchLabels:
        app: mysql
    template:
      metadata:
        labels:
          app: mysql
      spec:
        containers:
          - name: ${NOMBRE_CONTENEDOR}
            image: bitnami/mysql  
            env:
            - name: MYSQL_ROOT_PASSWORD
              value: ${ROOT_PASSWORD}
            - name: MYSQL_USER
              value: ${USER}
            - name: MYSQL_PASSWORD
              value: ${PASSWORD}
            - name: MYSQL_DATABASE
              value: ${DATABASE}
            ports:
            - containerPort: 6379
              protocol: TCP
parameters:
- name: REPLICAS
  description: Número de pods creados
  value: "1"
- name: NOMBRE_APP
  description: Nombre del pod que se va a crear
  from: 'mysql[0-9]{2}'
  generate: expression
- name: NOMBRE_CONTENEDOR
  description: Nombre del contenedor que se va a crear
  value: contenedor-mysql
- name: ROOT_PASSWORD
  description: Contraseña del root de mysql
  from: '[A-Z0-9]{8}'
  generate: expression
- name: USER
  description: Nombre del usuario mysql que se va a crear
  value: usuario
- name: PASSWORD
  description: Contraseña del usuario de mysql
  from: '[A-Z0-9]{8}'
  generate: expression
- name: DATABASE
  description: Nombre de la base de datos que se va a crear
  value: nueva_bd
```

