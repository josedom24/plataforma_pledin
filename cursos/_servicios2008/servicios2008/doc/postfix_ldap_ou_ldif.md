---
title: postfix_ldap_ou.ldif
---

    dn:ou=people,dc=ldap,dc=web-personal,dc=org
    objectClass: organizationalunit
    ou: people
    
    dn:ou=groups,dc=ldap,dc=web-personal,dc=org
    objectClass: organizationalunit
    ou: groups
    
    dn:ou=postfix,dc=ldap,dc=web-personal,dc=org
    ou: postfix
    slap    objectClass: top
    objectClass: organizationalUnit
    userPassword:{CRYPT}mdkQsdBAQepDU
    
    dn:ou=alias,ou=postfix,dc=ldap,dc=web-personal,dc=org
    ou: alias
    objectClass: top
    objectClass: organizationalUnit
