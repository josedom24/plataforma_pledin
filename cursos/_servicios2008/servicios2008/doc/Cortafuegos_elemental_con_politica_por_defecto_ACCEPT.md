---
title: Cortafuegos elemental con política por defecto ACCEPT
---

Vamos a utilizar el equipo host de VMware como cortafuegos de la red virtual, pero en primer lugar hay que repetir el ejercicio Configuración de SNAT para la red virtual para que mortadelo y filemon salgan a Internet a través de la máquina host.

## Notas importantes


* La configuración de un equipo como cortafuegos, normalmente sólo implica a reglas de la tabla filter, que es la tabla por defecto de iptables, por lo que no es necesario especificarla con el parámetro -t:

        iptables -A INPUT == iptables -t filter -A INPUT

* La tabla filter incluye tres cadenas:

    * INPUT: Se aplica a paquetes que tienen como destino el equipo.
    * OUTPUT: Se aplica a paquetes que tienen como origen el equipo.
    * FORWARD: Se aplica a paquetes que atraviesan el equipo (pasan de una interfaz de red a otra).

    Dicho de otra manera, las reglas de INPUT y OUTPUT se utilizan para proteger o limitar el tráfico del propio cortafuegos, mientras que en FORWARD se incluyen las reglas de filtrado que afectan a todos los equipos que estén detrás del cortafuegos.

* A un paquete sólo le afecta la primera regla con la que case de cada cadena aplicable (salvo algunas excepciones no relevantes para nuestra discusión).

    Comprueba las siguientes reglas en tu equipo:

        iptables -F
        iptables -A OUTPUT -p tcp -j DROP
        iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT

    Y ahora así:

        iptables -F
        iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
        iptables -A OUTPUT -p tcp -j DROP

    ¿Por qué no se puede navegar desde la máquina Ubuntu en el primer caso?

* El paquete que no case con ninguna regla se le aplica la política por defecto de la cadena (DROP o ACCEPT)

    Para poder navegar el equipo Ubuntu necesita hacer consultas DNS (53/udp), como no se ha espedificado ninguna regla concreta para los paquetes del protocolo UDP, se aplica la regla por defecto de las cadenas INPUT y OUTPUT (ACCEPT), por lo que es posible hacer consultas DNS.

* La sintaxis para añadir una regla a una cadena tiene tres partes:

    * Cadena a la que se aplica:

            iptables (-t filter) -A INPUT/OUTPUT/FORWARD

    * Descripción del paquete (interfaz de entrada, ip origen, ip destino, protocolo, puerto, etc.), por ejemplo:

            -s 192.168.1.0/24 -i eth0 -p tcp --dport 3306

    * Acción: ¿qué se hace con el paquete?

            -j DROP/REJECT/ACCEPT

* Normalmente las reglas de iptables se escriben en un fichero ejecutable a modo de script, aunque existe también la opción de utilizar las instrucciones `iptables-save` e `iptables-restore`.


## Ejercicio

Escribe un script de iptables con las siguientes características:

* Se ejecuta en el host de VMware
* Da acceso a Internet a la red virtual a través de SNAT
* No permite lo siguiente a mortadelo y filemon:
    * Hacer ping a un equipo externo
    * Accder por ftp a un equipo externo
    * Acceder por ssh al equipo Ubuntu
* No permite al equipo Ubuntu:
    * Recibir ninguna petición a los puertos privilegiados (1-1024) desde la red local.
* Se permite todo lo demás (política ACCEPT)