---
title: Instalación y configuración de Bind9 como servidor DNS master en una red local
---

## Planteamiento del problema

Utilizaremos dos máquinas con nombres mortadelo y filemon, superagentes que trabajan en la T.I.A. (Técnicos Investigación Aeroterráquea) y que obviamente pertenecen al dominio `tia.com`

mortadelo actuará como servidor y filemon como cliente en todas las tareas de este tema.

## Instalación y funcionamiento como dns cache

* Instala el paquete bind9
* Comprueba con dig que el servidor está funcionando como DNS cache y que es capaz de realizar consultas directas a los servidores raíz DNS.

## Funcionamiento como dns forward

* Edita el fichero `/etc/named.conf.options` e incluye los servidores DNS que utilice tu equipo en el apartado `forwarders`, de esta manera no se harán consultas a los servidores raíz DNS, sino que se harán al servidor DNS que se especifique.

## Funcionamiento como dns master en una red local

* Sigue los pasos que se describen en [DNS dinámico](http://albertomolina.wordpress.com/2008/11/14/dns-dinamico/), obviando las líneas referentes a rndc y configura mortadelo como servidor DNS master de la zona "tia.com".
* Comprueba con dig que el servidor funciona simultaneamente como DNS cache/forward resolviendo nombres de Internet y como DNS master resolviendo la zona `tia.com`.