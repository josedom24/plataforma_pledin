---
title: Consultas a un servidor DNS con dig
---

`dig` es una herramienta que permite hacer consultas a un servidor DNS desde la línea de comandos, es el sustituto de los programas nslookup y host. La sintaxis es:  
  
    dig \[-t tipo de registro\] \[@servidor DNS\] Consulta DNS  
  
El tipo de registro por defecto es ADDRESS y el servidor DNS por defecto el definido en `/etc/resolv.conf`.  
  
* Instala el paquete dnsutils que incluye el programa dig.

## Registros tipo ADDRESS (A y AAAA)

* Obtén la dirección IP de ayla.gonzalonazareno.org

## Registros tipo CNAME (Alias)

* Obtén el equipo al que está redirigido informatica.gonzalonazareno.org.

## Registros NS

* Determina los nombres de los servidores DNS del dominio gonzalonazareno.org

## Registros MX

* ¿A qué equipo se envían los correos @gonzalonazareno.org?

## Registros Pointer (PTR)

* ¿A qué nombre está apuntando la dirección 80.59.1.152?

