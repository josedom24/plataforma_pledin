#!/bin/sh

# Borramos las reglas anteriores
iptables -F
iptables -t nat -F
# Ponemos los contadores a cero
iptables -Z

## Establecemos politica por defecto
#
# >>>>>>>>>Política por defecto para INPUT, OUTPUT y FORWARD es DROP <<<<<<<<<<<<
#
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

echo "Establecemos política por defecto DROP para INPUT, OUTPUT y FORWARD"

## Definimos las constantes
#Interfaz de red externa
EXT=eth0
IP_EXT=192.168.0.2
#Interfaz de la red de las aulas
ETH_A=eth1
#Red de las aulas
AULAS=192.168.1.0/24
#Interfaz de la red del departamento
ETH_D=eth2
#Red del departamento
DPTO=192.168.2.0/24
#Cualquier destino u origen
ALL=0.0.0.0/0

###################################################################################
##Reglas de PREROUTING
###################################################################################

# Direcciones MAC deshabilitadas
#iptables -t nat -A PREROUTING -i $ETH_A -s $AULAS -m mac --mac-source 00:0f:ea:fd:de:25 -p tcp -j DROP
#iptables -t nat -A PREROUTING -i $ETH_A -s $AULAS -m mac --mac-source 00:11:22:33:44:55 -p tcp -j DROP

# Proxy transparente
iptables -t nat -A PREROUTING -i $ETH_A -s $AULAS -d ! 192.168.0.0/16 -p tcp --dport 80 -j REDIRECT --to-port 3128
iptables -t nat -A PREROUTING -i $ETH_D -s $DPTO -d ! 192.168.0.0/16 -p tcp --dport 80 -j REDIRECT --to-port 3128

echo "Aplicadas las reglas de PREROUTING"

###################################################################################
##Reglas de INPUT y OUTPUT
###################################################################################
# Se permite acceso completo desde el loopback
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Al firewall tenemos acceso completo desde las aulas
iptables -A INPUT -s $AULAS -i $ETH_A -j ACCEPT
iptables -A OUTPUT -d $AULAS -o $ETH_A -j ACCEPT

# Al firewall tenemos acceso completo desde el Departamento
iptables -A INPUT -s $DPTO -i $ETH_D -j ACCEPT
iptables -A OUTPUT -d $DPTO -o $ETH_D -j ACCEPT

# La máquina es cliente DNS (UDP 53):
iptables -A OUTPUT -s $IP_EXT -d $ALL -o $EXT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -d $IP_EXT -s $ALL -i $EXT -p udp --sport 53 -j ACCEPT

# La máquina es cliente NTP (UDP 123):
iptables -A OUTPUT -s $IP_EXT -d $ALL -o $EXT -p udp --dport 123 -j ACCEPT
iptables -A INPUT -d $IP_EXT -s $ALL -i $EXT -p udp --sport 123 -j ACCEPT

# La máquina es un cliente http:
iptables -A OUTPUT -s $IP_EXT -d $ALL -o $EXT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -d $IP_EXT -s $ALL -i $EXT -p tcp --sport 80 -j ACCEPT

# La máquina es un servidor web para el exterior
iptables -A INPUT -s $ALL -i $EXT -d $IP_EXT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -d $ALL -o $EXT -s $IP_EXT -p tcp --sport 80 -j ACCEPT

# La máquina tiene abierto el puerto 22 para el exterior
iptables -A INPUT -s $ALL -i $EXT -d $IP_EXT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -d $ALL -o $EXT -s $IP_EXT -p tcp --sport 22 -j ACCEPT

# La máquina tiene abierto el puerto 25 para el exterior
iptables -A INPUT -i $EXT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -i $EXT -p tcp --sport 25 -j ACCEPT
iptables -A OUTPUT -o $EXT -p tcp --sport 25 -j ACCEPT
iptables -A OUTPUT -o $EXT -p tcp --dport 25 -j ACCEPT

# Permitimos paquetes ICMP de salida
iptables -A OUTPUT -s $IP_EXT -d $AULAS -p icmp -j ACCEPT
iptables -A OUTPUT -s $IP_EXT -d $DPTO -p icmp -j ACCEPT

echo "Aplicadas las reglas de INPUT y OUTPUT"

###################################################################################
##Reglas de FORWARD
###################################################################################

#
# DEPARTAMENTO
#
#Abre el forward completo para la red del departamento
iptables -A FORWARD -i $ETH_D -o $EXT -s $DPTO -p tcp -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_D -d $DPTO -p tcp -j ACCEPT
iptables -A FORWARD -i $ETH_D -o $EXT -s $DPTO -p udp -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_D -d $DPTO -p udp -j ACCEPT
iptables -A FORWARD -i $ETH_D -o $EXT -s $DPTO -p icmp -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_D -d $DPTO -p icmp -j ACCEPT

echo "Aplicadas las reglas de FORWARD para el Departamento"

#
# INTERCONEXIÓN ENTRE EL DEPARTAMENTO Y LAS AULAS
#
iptables -A FORWARD -i $ETH_D -o $ETH_A -s $DPTO -d $AULAS -p tcp -j ACCEPT
iptables -A FORWARD -i $ETH_A -o $ETH_D -d $DPTO -s $AULAS -p tcp -j ACCEPT
iptables -A FORWARD -i $ETH_D -o $ETH_A -s $DPTO -d $AULAS -p udp -j ACCEPT
iptables -A FORWARD -i $ETH_A -o $ETH_D -d $DPTO -s $AULAS -p udp -j ACCEPT
iptables -A FORWARD -i $ETH_D -o $ETH_A -s $DPTO -d $AULAS -p icmp -j ACCEPT
iptables -A FORWARD -i $ETH_A -o $ETH_D -d $DPTO -s $AULAS -p icmp -j ACCEPT

echo "Aplicadas las reglas de FORWARD para la interconexión de las aulas y el Dpto."

#
# AULAS
#

#Abre el protocolo terminar server
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p tcp --dport 3389 -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_A -d $AULAS -p tcp --sport 3389 -j ACCEPT

#Abre el protocolo mogulus para videoconferencia
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p tcp --dport 1935 -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_A -d $AULAS -p tcp --sport 1935 -j ACCEPT

#Abrimos temporalmente el Whois externo
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p tcp --dport 43 -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_A -d $AULAS -p tcp --sport 43 -j ACCEPT

#Abre el protocolo ssh 
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_A -d $AULAS -p tcp --sport 22 -j ACCEPT

#Abre el protocolo ftp (puerto 21)
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -o $ETH_A -i $EXT -d $AULAS -p tcp --sport 21 -j ACCEPT
# Regla para ftp activo (el servidor establece la conexión desde el puerto ftp-data 20)
# Cargamos el módulo de nat ftp previamente en memoria
modprobe ip_nat_ftp
# Activamos ahora las reglas de ftp-data activo
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p tcp --dport 20 -j ACCEPT
iptables -A FORWARD -o $ETH_A -i $EXT -d $AULAS -p tcp --sport 20 -j ACCEPT
# Regla para ftp pasivo (el cliente establece la conexión con un puerto alto del servidor,
# por lo que hay que permitir la conexión si está establecida anteriormente y la limitamos
# a puertos por encima del 1024)
iptables -A FORWARD -i $EXT -o $ETH_A -d $AULAS -p tcp --sport 1024: --dport 1024: -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -o $EXT -i $ETH_A -s $AULAS -p tcp --sport 1024: --dport 1024: -m state --state ESTABLISHED,RELATED -j ACCEPT

#Abre el protocolo icmp
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p icmp -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_A -d $AULAS -p icmp -j ACCEPT

# Abre el protocolo dns
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_A -d $AULAS -p udp --sport 53 -j ACCEPT

#Abre el protocolo https
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_A -d $AULAS -p tcp --sport 443 -j ACCEPT

#Abre el puerto 2083 para administracion remota de paneles de control web
iptables -A FORWARD -i $ETH_A -o $EXT -s $AULAS -p tcp --dport 2083 -j ACCEPT
iptables -A FORWARD -i $EXT -o $ETH_A -d $AULAS -p tcp --sport 2083 -j ACCEPT

echo "Aplicadas las reglas de FORWARD para las aulas"

###################################################################################
##Reglas de POSTROUTING
###################################################################################
# Ahora hacemos SNAT de las redes locales
iptables -t nat -A POSTROUTING -s $AULAS -o $EXT -j SNAT --to $IP_EXT
iptables -t nat -A POSTROUTING -s $DPTO -o $EXT -j SNAT --to $IP_EXT

echo "Aplicadas las reglas de POSTROUTING"
# Fin del script
