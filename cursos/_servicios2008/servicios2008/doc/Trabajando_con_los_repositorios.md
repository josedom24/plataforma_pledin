---
title: Trabajando con los repositorios
---

## ¿Qué son los repositorios?

El repositorio es a todos los efectos un archivo ordenado donde son almacenados los paquetes Debian (sean estos paquetes binarios o fuentes) en un modo bien organizado, con una estructura bien definida y constantemente actualizados.  

Los paquetes contenidos en un repositorio son indexados en estos archivos:

* _Packages.gz_ (son paquetes que contienen los binarios).  
* _Sources.gz_ (son aquellos que contienen los fuente).

En cada sistema Debian, los repositorios utilizados vienen indicados en el archivo `/etc/apt/sources.list`.  
  
Para actualizar la lista de paquetes en nuestro ordenador utilizamos la instrucción:  

    # apt-get update

## Estrcutura del fichero /etc/apt/source.list

Vamos a editar el fichero source.list  

    # cd /etc/apt
    # nano sources.list

Veamos un ejemplo de un posible contenido:  

    #deb cdrom:\[Debian GNU/Linux 4.0 r4a \_Etch\_ - Official i386 CD Binary-1 20080803-21:07\]/ etch contrib main
    #deb cdrom:\[Debian GNU/Linux 4.0 r4a \_Etch\_ - Official i386 CD Binary-1 20080803-21:07\]/ etch contrib main

    deb http://ftp.es.debian.org/debian/ etch main contrib non-free
    deb-src http://ftp.es.debian.org/debian/ etch main contrib non-free

    deb http://security.debian.org/ etch/updates main contrib
    deb-src http://security.debian.org/ etch/updates main contrib

Cada línea que describe un repositorio tiene una sintaxis predeterminada que podemos resumir en:

    deb uri distribution [component...]

Analizamos los componentes por separado, así lo entendemos mejor:

* **deb o deb-src** sirve para indicar si el repositorio indicado contiene paquetes binarios o paquetes fuente (si tiene ambos es necesario especificarlo en dos lineas diferentes).

* **uri** indica la dirección donde es posible encontrar el repositorio, y además podemos elegir entre los siguientes métodos de acceso a los paquetes:

* **cdrom** permite acceder a un repositorio presente en un cdrom.
* **http**: permite acceder tramite el protocolo _http._
* **ftp** permite acceder a un repositorio tramite el protocolo ftp.
* file,rsh, copy son otras opciones menos usadas

* **distribution** indica la distribución (o rama) utilizada, es posible usar el nombre en código (sarge, etch, lenny, ...) o el nombre genérico (stable, testing, unstable)
    
Cuando un repositorio apunta a una de las ramas (oldstable, stable, testing), apuntan a las versiones de turno, que en este momento son:

* Oldstable --> sarge  
* stable --> etch  
* testing --> lenny

Cada vez que se libera una nueva versión de Debian, se actualizan los enlaces para que apunten a los nuevos nombres-clave, por ejemplo, cuando se libere lenny, oldstable apuntará a etch, stable será lenny y testing será el nombre de toy-story que siga.

* **component** indica las secciones del repositorio, _non-free , main , contrib..._
* **main** es la sección principal, que contiene el 90% de los paquetes presentes en nuestra Debian.

* **contrib** encontramos los paquetes que cumplen con 5 ó 6 puntos de las DFSG (Debian Free Software Guidelines), pero que dependen de paquetes que no la respetan.  
    
    (DFSG = lineamientos o requisitos que una licencia debe cumplir para que sea definida como _libre_ segun el proyecto Debian [http://www.debian.org/social_contract#guidelines](http://www.debian.org/social_contract#guidelines "http://www.debian.org/social_contract#guidelines")).  
    
* **non-free** contiene los paquetes que poseen limitaciones en su distribución (como por ejemplo aquellos que no pueden ser usados en ámbito comercial o porque dependen de paquetes que no respetan las DFSG).

Realiza el siguiente ejercicio:    
 
* Edita el fichero de configuración de APT de tu máquina y comprueba en que rama de Debian estamos trabajando y que repositorios estamos usando.  

## Añadiendo un nuevo repositorio

Podemos añadir a nuestra lista repositorios no oficiales. Por ejemplo el [repositorio de multimedia](http://www.esdebian.org/foro/24349/nuevo-mirror-debian-multimedia), para ello debemos añadir a nuestro fichero `/etc/apt/sources.list` la siguiente línea:  
  
    deb http://www.debian-multimedia.org stable main  
  
Y a continuación actualizamos nuestra lista de paquetes usando:  

    # apt-get update

  
* Incluye en el repositorio de multimedia y actualiza la lista de paquetes.  
  
## Firmas de los repositorios

Cuando instalas paquetes binarios desde Internet tu sistema puede quedar comprometido si los descargas de sitios poco fiables. Incluso utilizando sitios oficiales puede ser un grave problema de seguridad si alguien consigue hacerse pasar por el servidor o introduce paquetes maliciosamente modificados.

Para evitar todo esto, los repositorios disponen de una firma PGP que garantiza la autenticidad de sus paquetes. `APT` comprueba que los paquetes vienen firmados por quien dice ser, accediendo en un servidor público de claves.

Al ejecutar el último update hemos obtenido el siguiente mensaje:  

    W: GPG error: http://www.debian-multimedia.org stable Release: Las firmas siguientes no se pudieron verificar porque
    su llave pública no está disponible: NO_PUBKEY 07DC563D1F41B907

A pesar de estos avisos, se pueden instalar paquetes como siempre, pero no habrá ninguna garantía de su autenticidad. El programa `apt-get` suele pedir una confirmación de este tipo cuando se instalan paquetes cuya autenticidad no se puede comprobar:  
  
    AVISO: ¡No se han podido autenticar los siguientes paquetes!
    xxxxxxxxxxxxxxxx
    ¿Instalar estos paquetes sin verificación \[s/N\]?

Para solucionar este problema sigue los siguientes pasos:  
  
 
1. Instala el paquete `gnupg`, si no esta instalado.  
2. Ejecuta el programa `gpg` como root. De ese modo se crean el directorio `.gnupg` y los ficheros de configuración por defecto. Pulsa C-c cuando haya arrancado.  
3. Ahora edita el fichero `/root/.gnupg/gpg.conf` y añade (o descomenta) esta línea:  

        keyserver-options auto-key-retrieve

    Para crear la clave pública correspondiente a la firma (que es el numero que sale al final: 07DC563D1F41B907) debemos ejecutar la siguiente instrucción:  

        gpg --keyserver subkeys.pgp.net --recv-keys 07DC563D1F41B907
        gpg: solicitando clave 1F41B907 de hkp servidor subkeys.pgp.net
        gpg: clave 1F41B907: “Christian Marillat “ sin cambios
        gpg: Cantidad total procesada: 1
        gpg: sin cambios: 1

    Y la puedes incorporar al anillo de claves de **APT** con este otro comando. Igual que antes, puede que tengas que ejecutarlo varias veces hasta que diga algo como esto:  

        gpg --export --armor 07DC563D1F41B907 | apt-key add -- OK

    Y para terminar, un `apt-get update` que debería salir sin esos feos avisos, y con total garantía de autenticidad sobre lo que instalas. Evidentemente, se supone que tú, como administrador, deberías contrastar que esa firma corresponde a alguien “fiable”.  
  
    Otra alternativa (no disponible en todos los repositorios):  

    Instalar un paquete keyring del repositorio que hemos instalado, en nuestro caso:  

        apt-get install debian-multimedia-keyring