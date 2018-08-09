---
title: "Tarea: DNS dinámico"
---

Partiendo de las características del servidor DNS y el servidor DHCP presentadas en el documento: *Utilización de DNS dinámico en una red local*, configura ambos servicios para permitir la actualización dinámica de las direcciones IP asignadas en el servidor DNS.

* Para entregar: La salida del comando `dig cliente.example.com`, y las líneas relevantes de `/var/log/syslog` que demuestren el funcionamiento de DDNS en avatar.

A continuación, y para comprobar que la actualización se realiza adecuadamente, vamos a cambiar la dirección IP asignada a nuestro cliente, para ello vamos a cambiar el rango de direcciones que reparte el servidor DHCP a la 192.168.2.151-192.168.2.200, y haz que el cliente tome una nueva dirección IP.

* Vuelve a entregar: La salida del comando `dig cliente.example.com`, y las líneas relevantes de `/var/log/syslog` que demuestren el funcionamiento de DDNS en avatar.