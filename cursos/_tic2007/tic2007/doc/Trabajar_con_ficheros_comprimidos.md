---
title: Trabajar con ficheros comprimidos
---

## Introducción

La compresión de archivos es un recurso muy utilizado en el mundo de la informática. A grandes rasgos, la compresión consiste en crear un archivo de menor tamaño partiendo de uno o varios ficheros.

Las ventajas de la compresión son indudables ya que permiten un mejor aprovechamiento de los soportes de datos como disquetes, CD-ROM, etc. Habitualmente cuando descargamos algún fichero de Internet, éste se encuentra comprimido para disminuir el tiempo necesario para recibirlo. Por lo tanto, antes de poder utilizarlo, será necesario descomprimirlo para devolverlo a su estado original.

En este documento vamos a ver los formatos de compresión más habituales y los procedimientos para trabajar con ellos.

## Empaquetados y compresión

Habitualmente lo que se conoce como compresión de un fichero comprende dos pasos diferenciados: el empaquetado y la compresión propiamente dicha.

Se conoce como empaquetado al proceso de crear un único fichero partiendo de un conjunto de archivos. El fichero empaquetado es del mismo tamaño que la suma de los archivos que contiene.La compresión consiste en crear un archivo de menor tamaño a partir de otro.

Es muy común que el empaquetado y la compresión se realicen de forma conjunta pero en algunas ocasiones no es la mejor opción. Cuando estemos tratando con ficheros previamente comprimidos como pueden ser canciones en formato MP3/OGG, imágenes JPG o vídeos no es una buena idea volver a comprimirlos porque, en la mayoría de los casos, no se obtiene ninguna mejora. En estas ocasiones, es más interesante únicamente empaquetar los ficheros porque es un proceso mucho más rápido que la compresión.

## Tipos

Existen varios formatos de compresión pero el funcionamiento de todos es muy similar.

### Zip

El formato zip es el más utilizado en el mundo de la informática. Una de las características más interesantes de este formato es que se puede leer fácilmente en cualquier sistema. Por ello, es una buena opción si queremos intercambiar ficheros entre Windows y Linux.

### TAR

El formato tar es únicamente de empaquetado, no de compresión. La aplicación para trabajar con este formato se denomina 'tar'. De la misma manera se llaman los ficheros que genera.

### Gzip

En el mundo UNIX es muy habitual combinar varios programas sencillos para realizar una tarea más compleja. Como acabamos de ver, un fichero 'tar' es un archivo que contiene otros muchos pero que no está comprimido. El complemento a la utilidad 'tar' es el programa 'gzip'. Esta aplicación nos permite comprimir un fichero. La combinación de los dos programas, nos permite pasar de un conjunto de fichero a un archivo comprimido que los contiene a todos. Los ficheros empaquetados con 'tar' y comprimidos con 'gzip' suelen tener un nombre de la forma 'nombre_fichero.tar.gz' pero en algunas ocasiones se denominan como 'nombre_fichero.tgz'.

### Bzip2

La utilidad Bzip2 es similar en comportamiento a Gzip pero aporta una compresión más eficiente. De la misma forma que Gzip, Bzip2 se suele utilizar en conjunción con 'tar'. Los ficheros comprimidos con Bzip2 suelen tener la extensión '.bz2', por lo tanto, si lo utilizamos junto con 'tar' obtendremos un fichero de la forma 'nombre_fichero.tar.bz2'.

### RAR

El formato RAR es muy utilizado en sistemas Windows pero también es posible trabajar con él en Linux. Al contrario de los formatos nombrados hasta ahora, las especificaciones de RAR no son libres y dependen de una única empresa. Por este motivo, no es un formato recomendable si queremos facilitar el difusión de los archivos que creemos.

### ACE

Al igual que RAR, el formato ACE es propietario y no es recomendable utilizarlo para crear nuevos archivos. El soporte en Linux es muy limitado y únicamente es posible descomprimir archivos ya creados.

## Programas

Habitualmente los programas para trabajar con archivos comprimidos funcionan desde el terminal. Esto dificulta bastante su uso porque cada uno de ellos admite un conjunto de opciones distintas. Para facilitar la tarea, en Guadalinex se ha incluido la aplicación _**File Roller**_ que permite trabajar de forma homogénea con los distintos formatos de ficheros comprimidos y además de forma gráfica e intuitiva desde el escritorio.

En Guadalinex V3, la aplicación _**File Roller**_ se puede encontrar en el menú _**Aplicaciones/Accesorios/Gestor de archivos comprimidos (File-roller)**_.

## Descompresión de un fichero

* Para descomprimir un fichero existente seleccionaremos la opción _**Abrir**_.
* En la ventana que se nos muestra debemos seleccionar el fichero que queremos descomprimir.
* Saldremos de la ventana pulsando el botón _**Abrir**_.
* La aplicación nos mostrará el contenido del archivo comprimido.
* Para extraer todo el contenido seleccionaremos la opción "Extraer".
* En la siguiente ventana indicaremos dónde queremos guardar el contenido y pulsaremos el botón "Extraer".

### Descompresión rápida en Gnome

En guadalinex podemos optar por un sistema de descompresión más simple aún que el anterior.

* Simplemente bien en el escritorio y bien en el navegador de archivos _**Nautilus**_, nos colocamos encima de un archivo comprimido y pulsamos el botón derecho del ratón.
* Del menú contextual que aparece, elegimos la opción _**Extraer aquí**_.
* El contenido del fichero se descomprimirá en la carpeta actual inmediatamente.

**Explicación Animada**

[![Thumb-fileroller.gif](http://www.guadalinex.org/guadapedia/images/3/35/Thumb-fileroller.gif)](http://www.guadalinex.org/guadapedia/images/c/c0/Fileroller.gif "http://www.guadalinex.org/guadapedia/images/c/c0/Fileroller.gif")  Pincha en la imagen para ver la animación a su tamaño completo.

## Creación de un fichero comprimido

La creación de un fichero comprimido consta de dos pasos. En un principio se crea un archivo vacío y posteriormente se le añade el contenido.

* Para crear un fichero comprimido seleccionaremos la opción _**Nuevo**_.
* Indicaremos el nombre del archivo a crear y la carpeta donde se guardará.
* La opción _**Tipo de archivador**_ se puede dejar en _**Automático**_ si al nombre del fichero le hemos añadido la extensión estándar para el tipo de fichero deseado. Si no hemos utilizado una extensión, debemos seleccionar explícitamente el tipo de archivo que deseamos crear.
* Saldremos de la ventana pulsando sobre el botón _**Nuevo**_. Con esto se habrá creado el archivo vacío.

A continuación debemos añadir contenido al fichero recién creado.

* Para ello seleccionaremos la opción _**Añadir**_ y escogeremos los archivos que deseamos agregar.
* Veremos cómo los ficheros seleccionados se han añadido al contenido del archivo comprimido.
* Para finalizar el proceso seleccionaremos la opción _**Cerrar**_ o saldremos del programa.

## Otros tipos de compresión

Todos los programas que hemos visto utilizan la conocida como "compresión sin pérdida". Este tipo de compresión permite reconstruir de forma exacta el contenido de los ficheros originales partiendo de un archivo comprimido.

Existe otra modalidad de compresión denominada "compresión con pérdida". Utilizando esta tecnología no es posible reconstruir de forma exacta el fichero original si se parte de un comprimido porque en el proceso de compresión se ha perdido información. La compresión con pérdida se utiliza extensivamente en formatos gráficos, sonido y vídeo donde es admisible una pequeña reducción en la calidad a cambio de una disminución significativa del tamaño.

Todos los formatos habituales como JPG, MP3, Ogg, MPEG, etc. utilizan compresión con pérdida y al resultado obtenido le aplican una compresión sin pérdida como la que hemos visto en este documento. Por lo tanto, si intentamos comprimir algunos de estos formatos que ya se encuentran comprimidos no obtendremos ninguna mejora significativa y, en algunas ocasiones, el fichero resultante puede ser de mayor tamaño que el original.

> Referencia:

> Recetas Guadalinex v3 (http://www.guadalinex.org/guadapedia/index.php/Receta:_Trabajar_con_archivos_comprimidos_%28Guadalinex_V3%29)  

> Este documento se distribuye bajo una licencia Creative Commons Reconocimiento-NoComercial-CompartirIgual  
  
> Reconocimiento. Debe reconocer los créditos de la obra de la manera especificada por el autor o el licenciador.  
> No comercial. No puede utilizar esta obra para fines comerciales.  
> Compartir bajo la misma licencia. Si altera o transforma esta obra, o genera una obra derivada, sólo puede distribuir la obra generada bajo una licencia idéntica a ésta.  
  
  
> Para más información visitar: http://creativecommons.org/licenses/by-nc-sa/2.5/es/