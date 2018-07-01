# Ejercicio - Trabajando con volúmenes

1. Desde el menú Instances and volumes, crea un volumen (create volume) de 1 GB de capacidad.
2. Selecciona la acción "Edit Attachments" sobre el volumen creado y asocialo a una imágen WIndows que hayas creado anteriormente.
3. Accede al sistema operativo y formatea (FAT32). el volumen asociado con el gestor de discos. Posteriormente copia algún fichero al nuevo disco.
4. Selecciona la acción "Edit Attachments" sobre el volumen  creado y desconectalo de la instancia para ello elige la opción detach volume.
5. Asocia el volumen a una instancia Linux.
6. Monta el nuevo disco y comprueba el contenido del mismo:

        mount /dev/vdb1 /mnt
        ls /mnt
