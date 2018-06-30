---
title: "Ejercicio: Cortafuegos elemental con política DROP"
---

El conjunto de reglas más simple que podríamos implementar en un equipo con política por defecto DROP sería el siguiente:

    iptables -P INPUT DROP
    iptables -P OUTPUT DROP
    iptables -P FORWARD DROP

    iptables -A FORWARD -p tcp -i eth1 -o eth0 -s 192.168.2.0/24 -j ACCEPT
    iptables -A FORWARD -p tcp -o eth1 -i eth0 -d 192.168.2.0/24 -j ACCEPT
    iptables -A FORWARD -p udp -i eth1 -o eth0 -s 192.168.2.0/24 -j ACCEPT
    iptables -A FORWARD -p udp -o eth1 -i eth0 -d 192.168.2.0/24 -j ACCEPT
    iptables -A FORWARD -p icmp -i eth1 -o eth0 -s 192.168.2.0/24 -j ACCEPT
    iptables -A FORWARD -p icmp -o eth1 -i eth0 -d 192.168.2.0/24 -j ACCEPT

    iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o eth0 -j MASQUERADE

En el que establecemos política por defecto DROP a las tres cadenas de la tabla filter y aceptamos todo el tráfico que tenga origen o destino la red local 192.168.2.0/24 para los protocolos tcp, udp e icmp. Un script así lo que hace es proteger el equipo que actúa como cortafuegos ya que no permite ninguna conexión que se inicie o termine en él, sólo las que empiezan o terminan en la red local.

Es posible mejorar las reglas anteriores sin perder ninguna funcionalidad considerando que los equipos de la red local no pueden establecer conexiones con el exterior desde puertos privilegiados (1-1024) para los protocolos tcp y udp y además que el estado de las conexiones tcp tiene que ser tal que sólo se pueden comenzar las conexiones desde la red local (peticiones a Internet) y desde Internet sólo pueden llegar respuestas a esas peticiones:

    #Limpiamos las reglas anteriores y ponemos los contadores a cero:
    iptables -F
    iptables -t nat -F
    iptables -Z

    iptables -P INPUT DROP
    iptables -P OUTPUT DROP
    iptables -P FORWARD DROP

    iptables -A FORWARD -p tcp --sport 1024:65535 -i eth1 -o eth0 -s 192.168.2.0/24 -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -A FORWARD -p tcp --dport 1024:65535 -o eth1 -i eth0 -d 192.168.2.0/24 -m state --state ESTABLISHED -j ACCEPT
    iptables -A FORWARD -p udp --sport 1024:65535 -i eth1 -o eth0 -s 192.168.2.0/24 -j ACCEPT
    iptables -A FORWARD -p udp --dport 1024:65535 -o eth1 -i eth0 -d 192.168.2.0/24 -j ACCEPT
    iptables -A FORWARD -p icmp -i eth1 -o eth0 -s 192.168.2.0/24 -j ACCEPT
    iptables -A FORWARD -p icmp -o eth1 -i eth0 -d 192.168.2.0/24 -j ACCEPT
    iptables -A FORWARD -i eth1 -o eth0 -s 192.168.2.0/24 -j REJECT

    iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o eth0 -j MASQUERADE

## Cortafuegos elemental con iptables y política DROP

1. Ejecuta las reglas anteriores en avatar y comprueba el funcionamiento con el equipo cliente
