---
title: "3.- Instalación del sistema operativo"
---

El sistema operativo que vamos a utilizar en nuestro servidor avatar es Debian GNU/Linux 5.0 (Lenny). Lo próximo que tenemos que hacer es la instalación del sistema operativo en el servidor, para ello deberás descargarte una imagen ISO del instalador y realizar la instalación en el equipo que hayas elegido para que sea avatar. Te ponemos algunos enlaces que te pueden ser de ayuda en la instalación:

* [http://www.debian.org/index.es.html](http://www.debian.org/index.es.html): Página oficial de esta distribución.
* [http://www.debian.org/CD/http-ftp/](http://www.debian.org/CD/http-ftp/): Página de descarga de la última versión de Debian.
* [http://www.debian.org/releases/stable/i386/index.html.es](http://www.debian.org/releases/stable/i386/index.html.es) :Guía de instalación oficial de Debian
* [Instalación de Debian Lenny 5.0](http://www.dipler.org/2009/02/instalacion-de-debian-lenny-50/ "Instalación de Debian Lenny 5.0"): Un tutorial sobre la instalación del sistema operativo.

Si dispones de conexión a Internet durante la instalación de avatar, recomendamos que te descargues el [CD de instalación por red](http://cdimage.debian.org/debian-cd/5.0.4/i386/iso-cd/debian-504-i386-netinst.iso) que ocupa menos de 200 MB. Si decides descargar los CD completos, ten en cuenta que sólo necesitarás el primero, que nadie piense en descargarse los 31 CDs o los 5 DVDs oficiales :-), eso sólo sería necesario (y con matices) en un equipo que no pudiese conectarse nunca a Internet.

**IMPORTANTE**: No es necesario que se instale el servidor gráfico en nuestro sistema operativo. Es más, no se recomienda hacerlo ya que el servidor lo vamos a administrar por línea de comandos y en muchas ocasiones incluso la administración se hará remotamente (los servidores no suelen tener un monitor conectado).

## Documentación sobre la distribución Debian:

* Instalación de programas: Cuando instalamos un programa o servicio, el software esta empaquetado en formato deb, que además es la extensión de los ficheros de paquetes de software de Debian y derivadas (p ej. Ubuntu). El programa predeterminado para manejar estos paquetes es dpkg, generalmente vía apt/aptitude aunque hay interfaces gráficas como Synaptic, PackageKit o Gdebi que simplifican el trabajo.

    * [Tutorial de apt en Debian Wiki](http://wiki.debian.org/AptCLI)
    * [Tutorial de aptitude en Debian Wiki](http://wiki.debian.org/Aptitude)
    * [Manejar paquetes en Debian](http://www.josedomingo.org/web/mod/page/view.php?id=1861)
    * [Uso básico de apt/aptitude](http://preguntaslinux.org/-howto-apt-y-aptitude-t-5780.html)

* Procesos y niveles de ejecución: La más simple definición de un proceso podría ser que es una instancia de un programa en ejecución (corriendo). Los niveles de ejecución determinan que procesos se ejecutan en el arranque del sistema operativo.

    * [Manual básico de administración de procesos](http://www.linuxtotal.com.mx/index.php?cont=info_admon_012)
    * [An introducction to run-levels](http://www.debian-administration.org/articles/212)

* Configuración de la red: Una de las primeras tareas después de la instalación del sistema operativo es la configuración de la red.

* [Una introducción a la configuración de redes en Debian](http://www.guatewireless.org/os/linux/distros/debian/una-introduccion-a-configuracion-de-redes-en-debian/)




* * *