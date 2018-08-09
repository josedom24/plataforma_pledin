---
title: Cortafuegos con política por defecto DROP
---

Escribe un script de iptables con las siguientes características:

* Se ejecuta en el host de VMware
* Da acceso a Internet a la red virtual a través de SNAT
* El equipo Ubuntu tiene todos los siguientes servicios accesibles:

    * DNS
    * HTTP
    * HTTPS

* Los equipos de la red virtual tienen los siguientes servicios accesibles:

    * DNS
    * HTTP
    * HTTPS
    * FTP
    * SSH (sólo a la máquina Ubuntu)
    * ping al exterior

* No se ofrece ningún servicio a los equipos de la red local
* Todo lo demás está prohibido.