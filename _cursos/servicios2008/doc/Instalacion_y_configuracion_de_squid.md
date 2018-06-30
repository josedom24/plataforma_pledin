---
title: Instalación y configuración de squid
---

* Configura squid en el host de VMware para que puedan acceder los equipos de la red virtual 10.0.0.0/24 y tengan restringido el acceso a varios dominios utilizando ACL con `url_regex`. Por ejemplo:

        acl descargas_directas url_regex megaupload rapidshare gigasize
        ...
        http_access deny descargas_directas
