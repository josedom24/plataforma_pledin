---
title: El sistema de ficheros
---

## Introducción

La jerarquía de ficheros de un sistema UNIX como Guadalinex puede resultar un poco extraña al principio, pero con el uso resulta muy cómoda y lógica. Además es la misma desde hace más de 30 años.  

Los ficheros se organizan mediante directorios en lo que se conoce como un árbol. El directorio que contiene a todos los demás se denomina lógicamente directorio raíz (root en inglés) y se representa mediante el símbolo "/". Podemos ver el contenido pulsando  sobre el icono "Sistema de archivos" de la ventana "Equipo".

## Directorio "home"

El contenido del directorio raíz es poco útil para la mayoría de los usuarios. A un usuario normal lo que más le interesa es el directorio donde se encuentran sus ficheros y esto se hace en siempre en el denominado directorio home (hogar en inglés). En nuestro caso el directorio `home` de cada usuario es `/home/usuario`, por ejemplo `/home/pjmunoz` o `/home/pamolina`.

La forma de acceder al directorio home consiste en hacer clic sobre el icono "Carpeta personal de usuario" del escritorio, que mostrará el contenido de dicho directorio.

La organización de este directorio queda a criterio del usuario, siendo recomendable utilizar alguna norma que permita encontrar los fichero posteriormente de forma rápida.

Los usuarios móviles del centro TIC tienen la ventaja que en cualquier equipo del centro, el directorio `home` siempre contendrá los mismos fichero, no siendo necesario por tanto acarrear ficheros de un sitio a otro.  

## Directorio Desktop

Es habitual, aunque no recomendable, situar ficheros en el mismo escritorio del usuario. El directorio donde se encuentran dichos ficheros será Desktop (escritorio en inglés) dentro del home de cada usuario, por ejemplo: `/home/pjmunoz/Desktop` o `/home/pamolina/Desktop`  

## Directorio /media

Cuando utilizamos dispositivos extraíbles todos los dispositivos se montan sobre el directorio `/media`, que cuelga del directorio raíz. Por ejemplo `/media/cdrom` o `/media/usbdisk`  

  
> Este documento se distribuye bajo una licencia Creative Commons Reconocimiento-NoComercial-CompartirIgual  
  
> Reconocimiento. Debe reconocer los créditos de la obra de la manera especificada por el autor o el licenciador.  
> No comercial. No puede utilizar esta obra para fines comerciales.  
> Compartir bajo la misma licencia. Si altera o transforma esta obra, o genera una obra derivada, sólo puede distribuir la obra generada bajo una licencia idéntica a ésta.  
  
> Para más información visitar: http://creativecommons.org/licenses/by-nc-sa/2.5/es/