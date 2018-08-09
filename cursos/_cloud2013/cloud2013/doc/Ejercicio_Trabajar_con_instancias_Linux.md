---
title: "Ejercicio - Trabajar con instancias Linux"
---

1. Accede a "horizon" con la URL `http://jupiter.gonzalonazareno.org` e introduce el nombre de usuario y la contraseña que te han dado durante estas jornadas.
2. Comprueba el proyecto al que perteneces.

> **Imagen:** Imagen de sistema preconfigurado que se utiliza como base para crear instancias. Dentro del cloud podemos encontrar  diferentes imágenes para cada tipo de instancia que se quiera utilizar.

3. Comprueba las imágenes que tenemos a nuestra disposición en el apartado "Images & Snapshots".

> **Instancia**: Clon de una imagen que se crea a demanda del usuario en uno de los nodos del cloud.

Vamos a crear una instancia de una imagen de un sistema operativo Linux Debian. La particularidad de este sistema operativo es que tiene establecido un nombre de usuario y una contraseña (root / usuario).

> Un **sabor (flavor)** define para una instancia el número de CPUs virtuales, la RAM, si dispone o no de discos efímeros, etc. OpenStack preinstala una serie de sabores, que el administrador puede modificar.Los sabores que nosotros hemos definido son los siguientes:

<table>
<tbody>
<tr><th>nombre</th><th>RAM (MiB)</th><th>vda (GiB)</th><th>vdb (GiB)</th><th>vcpu</th></tr>
<tr>
<td style="text-align: center;">vda.vdb0.nano</td>
<td style="text-align: center;">256</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda.vdb0.micro</td>
<td style="text-align: center;">512</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda.vdb0.mini</td>
<td style="text-align: center;">1024</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">1</td>
</tr>
<tr><th>nombre</th><th>RAM (MiB)</th><th>vda (GiB)</th><th>vdb (GiB)</th><th>vcpu</th></tr>
<tr>
<td style="text-align: center;">vda10.vdb0.nano</td>
<td style="text-align: center;">256</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda10.vdb0.micro</td>
<td style="text-align: center;">512</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda10.vdb0.mini</td>
<td style="text-align: center;">1024</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda10.vdb0.small</td>
<td style="text-align: center;">2048</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">2</td>
</tr>
<tr><th>nombre</th><th>RAM (MiB)</th><th>vda (GiB)</th><th>vdb (GiB)</th><th>vcpu</th></tr>
<tr>
<td style="text-align: center;">vda.vdb10.nano</td>
<td style="text-align: center;">256</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda.vdb10.micro</td>
<td style="text-align: center;">512</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda.vdb10.mini</td>
<td style="text-align: center;">1024</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">1</td>
</tr>
<tr><th>nombre</th><th>RAM (MiB)</th><th>vda (GiB)</th><th>vdb (GiB)</th><th>vcpu</th></tr>
<tr>
<td style="text-align: center;">vda10.vdb10.nano</td>
<td style="text-align: center;">256</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda10.vdb10.micro</td>
<td style="text-align: center;">512</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda10.vdb10.mini</td>
<td style="text-align: center;">1024</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda10.vdb10.small</td>
<td style="text-align: center;">2048</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">10</td>
<td style="text-align: center;">2</td>
</tr>
<tr><th>nombre</th><th>RAM (MiB)</th><th>vda (GiB)</th><th>vdb (GiB)</th><th>vcpu</th></tr>
<tr>
<td style="text-align: center;">vda20.vdb20.micro</td>
<td style="text-align: center;">512</td>
<td style="text-align: center;">20</td>
<td style="text-align: center;">20</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda20.vdb20.mini</td>
<td style="text-align: center;">1024</td>
<td style="text-align: center;">20</td>
<td style="text-align: center;">20</td>
<td style="text-align: center;">1</td>
</tr>
<tr>
<td style="text-align: center;">vda20.vdb20.small</td>
<td style="text-align: center;">2048</td>
<td style="text-align: center;">20</td>
<td style="text-align: center;">20</td>
<td style="text-align: center;">2</td>
</tr>
<tr>
<td style="text-align: center;">vda20.vdb20.large</td>
<td style="text-align: center;">4096</td>
<td style="text-align: center;">20</td>
<td style="text-align: center;">20</td>
<td style="text-align: center;">2</td>
</tr>
</tbody>
</table>

4. Crea una instancia de la imagen Debian-kvm. Puedes elegir el sabor vda.vdb0.micro.Accede a ella utilizando la consola VNC, para ello pulsa sobre el nombre de la instancia (desde el apartado Instances & Volumnes) y a la pestaña VNC.

> **IP privada**: Dirección IP con la que se crean las instancias y que se utiliza para comunicación interna.

> **IP flotante:** Dirección IP pública que puede asociarse a diferentes instancias con el fin de acceder a ellas desde fuera.

5. Para poder acceder a nuestra instancia desde el exterior tenemos que asignarle a la instancia una IP flotante, para ello desde el apartado "Access & Security" solicita una nueva IP flotante (Allocate IP to project) y asígnala a la instancia que has creado.

> **Grupo de seguridad**: Reglas de cortafuegos (iptables) que controlan el acceso a las instancias mediante la dirección IP flotante.

6. También es necesario abrir el puerto 22 en el Grupo de seguridad (Security Groups) default. Edita las reglas y añade una nueva en la que permitas el acceso por el puero 22 desde la IP de tu ordenador.
7. Por último, utilizando un cliente ssh (open shh client o putty) accede a la instancia utilizando la ip flotante que le hemos asignado a la instancia.
8. Una vez que has trabajado un poco con la instancia, practica las distintas operaciones que puedes hacer sobre ella: pausar, suspender, reiniciar, terminar, ...
