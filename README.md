<h1 align="center">Laboratorio 4 - Sistemas Operativos 2022 - BigBrother</h1>

*Vigilancia en un Sistema de Archivos*

## McLovin Operativo :whale:

**INTEGRANTES:**

* Alejo Corral: alejo.corral@mi.unc.edu.ar
* Nahuel Fredes: nahuelfredes2018@mi.unc.edu.ar
* Francisco Martiarena: franciscomartiarena@mi.unc.edu.ar
* Ignacio Martinez Goloboff: ignacio.martinez.goloboff@mi.unc.edu.ar

## Introduccion 
<hr>

1. Al correr el codigo con la flag '-d' se nos muestran mensajes de debugging provenientes de Fuse.
En este se muestran cosas como la id del nodo, las funciones llamadas, siguiente cluster a leer, entre otras cosas.

2. ¿Hay alguna manera de saber el nombre del archivo guardado en el cluster 157?

3. Las enradas de directorio, en FAT32, se guardan en la directory table en el sector de datos. Y un directorio puede
tener adentro la cantidad de archivos hasta que se llene su cluster (esto puede variar segun la implementacion).

4. Cuando se ejecuta el comando como ls -l, el sistema operativo, ¿llama a algún programa de usuario? ¿A alguna llamada al sistema? ¿Cómo se conecta esto con FUSE? ¿Qué funciones de su código se ejecutan finalmente? (release, opendir, getattr, readdir, releasedir) 

5. ¿Por qué tienen que escribir las entradas de directorio manualmente pero no tienen que guardar la tabla FAT cada vez que la modifican?

6. El tamaño de la tabla FAT32 varia segun la imp
Para los sistemas de archivos FAT32, la tabla FAT, ¿siempre tiene el mismo tamaño? En caso de que sí, ¿qué tamaño tiene?

 


        
        
        
