---
title: Configuración de awstats para virtual hosting
---

En la documentación que ofrecemos se muestra como instalar awstats en unservidor web. En esta práctica queremos configurar el sistema para que cada subdominio genere estadísticas separadas.  
  
1. Modifica los ficheros de configuración de los subdominios para que los logs lo escribe en ficheros distintos, por ejemplo:

    * `www.ies.org`, guarde los logs en `/var/log/apache2/access_ies.log`
    * `informatica.ies.org`, guarde los logs en `/var/log/aapache2/access_inf.log`

    Por ejemplo:  
  
        CustomLog /var/log/apache2/access_ies.log combined

    La opción `combined` ofrece información adicional (SO, navegador, ...) del cliente en el log.  
  
2. Crea dos ficheros de configuración distintos para awstats para cada nombre de dominio.  
3. Ahora tienes que generar los ficheros de estadísticas dos veces, utilizando los distintos ficheros de configuración que has creado.
