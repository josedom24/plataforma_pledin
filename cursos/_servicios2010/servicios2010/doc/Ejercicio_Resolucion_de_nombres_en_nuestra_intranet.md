---
title: "Ejercicio: Resolución de nombres en nuestra intranet"
---

Actualmente en nuestra red local 192.168.2.0/24 realizamos una resolución de nombres de forma local o estática. esta resolución se realiza mediante el fichero `/etc/hosts`, que en nuestro cliente debe estar de la siguiente manera:  
  
    # nano /etc/hosts
    192.168.2.1 avatar.dynalias.com avatar

Es decir tanto el nombre avatar, como acatar.dynalias.com se resuelve por la dirección 192.168.2.1. El servidor avatar también tendrá una resolución local en su fichero `/etc/hosts`.  

Este mecanismo puede ser adecuado cuando tenemos pocas máquinas en nuestra red local.  
  
* Pero, ¿qué dificultades podemos encontrar si tenemos que nombrar muchas máquinas en nuestra red local?
* Si el nombre de una máquina cambia, ¿cuántos cambios deberíamos realizar?

Por otro lado, si la resolución no se puede llevar a cabo con las reglas estáticas, se realiza la pregunta a los servidores que hemos indicado en nuestro fichero `/etc/resolv.conf`, en nuestro caso tenemos puesto los servidores DNS de google (8.8.8.8 y 8.8.4.4)

* Si necesitamos cambiar los servidores DNS, ¿cuántos cambios tendríamos que realizar?
* ¿Qué ventajas obtendríamos si instalaremos en nuestro servidor un servidor DNS cache para la resolución de nombres?

Por lo tanto, es muy beneficioso para nuestra intranet instalar un servidor DNS maestro, para la resolución de nombres en nuestra red local, y cache para realizar de forma más rápida la resolución de nombres de internet.