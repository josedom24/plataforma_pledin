# Ejercicio - Acceso a instancias Linux con claves privadas/públicas

Trabajar con imágenes que tengan definida la contraseña del root no es conveniente ya que, si no tenemos la precaución de modificarla, cualquiera puede acceder a la instancia. Es por lo que lo normal es acceder a las intancias utilizando un par de claves ssh (privada/pública). En este caso la clave pública que vamos a generar la podemos inyectar en la instancia a la hora de crearla.

> **Par de claves ssh**: Utilizadas para acceder por ssh a las instancias desde fuera del cloud.

1. Lo primero que tenemos que hacer es crear nuetra par de claves, desde la sección "Access &amp; Security" crea una par de claves (Create Keypair) y guárdalo en tu ordenador y asígnale los permisos adecuado según hemos visto en el video-tutorial.
2. Crea una instancia de la imagen "Ubuntu 12.10 amd64", utiliza el sabor vda10.vdb10.mini y acuerdate de seleccionar las claves ssh que has generado anteriormente.
3. Asigna una IP flotante a tu nueva instancia.
4. Accede a la instancia utilizando las claves ssh. Por ejemplo:

        ssh -i .ssh/vostro.pem ubuntu@172.22.200.63

5. Una vez que hemos accedido a la instancia podemos comprobar varias cosas:

    * El nombre de la máquina es el nombre que le hemos dado a la instancia (`cat /etc/hostname`).
    * Según el sabor que hemos elegido tenemos dos discos duros: vda, donde tenemos instalado el sistema, y vdb, un disco duro "efímero" que debemos particionar y formatear para utilizarlo. Puede comprobarlo ejecutando: `sudo fdisk -l`-
    * También podemos comprobar que la máquina tiene 1 GB de RAM, ejecuta el comando `free`.

