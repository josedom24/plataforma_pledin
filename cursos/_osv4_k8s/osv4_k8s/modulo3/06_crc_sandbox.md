---
title: "Similitudes y diferencias entre CRC y Developer Sandbox"
permalink: /cursos/osv4_k8s/modulo3/crc_sandbox.html
---

## Similitudes

Como hemos comentado, **CRC (CodeReady Containers)** nos permite hacer una instalación local de OpenShift v4 en un ordenador personal, mientras **Red Hat OpenShift Dedicated Developer Sandbox** nos permite el usar OpenShift v4 en un clúster administrador por Red Hat.

Entre las similitudes podemos señalar:

* Son **plataformas de prueba**, que nos permiten realizar pruebas sobre un clúster de OpenShift v4. No se pueden usar para puesta en producción.
* Nos ofrecen la última versión de la plataforma OpenShift v4.
* Aunque con algunas limitaciones, son totalmente operativas, podemos trabajar con la mayoría de los recursos ofrecidos por la plataforma.

## Diferencias

* Recursos a nuestra disposición:
    * CRC: Se ejecuta en una máquina virtual en nuestro ordenador, por lo tanto tendremos los recursos que asignemos a esa máquina.
    * Developer SandBox: Están limitados: 7 GB RAM, y 15 GB de almacenamiento.
* Clúster:
    * CRC: Realiza la instalación de un clúster con un sólo nodo.
    * Developer SandBox: Está montada sobre una infraestructura cloud en el proveedor Amazon Web Service (AWS) y posee varios nodos en el clúster.
* Gestión:
    * CRC: Tenemos acceso con un usuario administrador, por lo que podemos hacer las configuraciones que queramos. Podemos añadir nuevas funcionalidades con la instalación de nuevos Operadores.
    * Developer SandBox: No accedemos con un usuario privilegiado. El clúster está gestionado por Red Hat y los servicios que se ofrecen no se pueden configurar, ni añadir nuevos.
* Usuarios y proyectos:
    * CRC: Tenemos la opción de usar usuarios con y sin permisos de administración. Podemos crear nuevos usuarios y cada usuario puede gestionar sus proyectos.
    * Developer SandBox: Accedemos con un usuario sin privilegios que trabaja en un sólo proyecto.
* Seguridad:
    * CRC: Al tener la posibilidad de acceder con el usuario administrador, podemos modificar la configuración de seguridad, para, por ejemplo, permitir la ejecución de contenedores privilegiados.
    * Developer SandBox: No podemos modificar la configuración de seguridad.
* Almacenamiento:
    * CRC: Al tener un sólo nodo en el clúster, los volúmenes ofrecidos corresponden a directorios en el host. Es suficiente para simular el almacenamiento en un clúster con un único nodo, ya que todos los contenedores se ejecutan en la misma máquina.
    * Developer SandBox: Al estar construida en AWS, el tipo de volúmenes que vamos  a poder usar será **AWS Elastic Block Store (EBS)**.

## ¿Qué plataforma vamos a usar en este curso?

En este curso vamos a usar principalmente **CRC**, aunque algunos ejercicios lo vamos a realizar sobre **Red Hat OpenShift Dedicated Developer Sandbox** por alguna característica específica, por ejemplo, por ser un clúster con varios nodos de computación.

Hay que tener en cuenta que la mayoría de ejercicios que vamos a realizar en el curso se pueden desarrollar indistintamente en las dos plataformas, a excepción de las veces que usemos el usuario administrador en **CRC** para alguna tarea específica.