<h1 align="center">Laboratorio 1 - Sistemas Operativos 2022 - Mybash</h1>

*Programando nuestro propio shell de linux*

## McLovin Operativo :whale:

**INTEGRANTES:**
* Alejo Corral  - alecorral
* Nahuel Fredes - nahuelfredes2018@mi.unc.edu.ar
* Francisco Martiarena  -  franciscomartiarena@gmail.com
* Ignacio Martinez Goloboff - ignacio.martinez.goloboff@mi.unc.edu.ar

### Introduccion
Este laboratorio consiste en la realización de una shell al estilo de bash (Bourne Again Shell)
la cual fue programada en el lenguaje C. La consola realiza diversas funciones generales tales como:
-Ejecucion de comandos internos o externos(background o foreground)
-Redirección entre comandos a través de un pipe
-Redirección de entrada y salida estándar


### *Modularizacion:*
Como la consigna pedía, utilizamos una modularizacion de 5 partes (sin incluir el modulo parser)

* **MyBash** (Martinez, Martiarena, Fredes, Corral)

        Modulo principal el cual invoca alternadamente al procesador de entrada y al ejecutor.
        En definitiva conecta todos los modulos que hacen al funcionamiento del programa.
        
* **Command** (Martinez, Martiarena)
        
        Implementacion de TADs scommand y pipeline, los cuales proveen una representacion abstracta de los comandos. El scommand, o comando simple, consiste en una secuencia de cadenas las cuales comienzan con el comando y lo siguen sus argumentos, con dos cadenas adicionales para redirecciones de entrada y salida. El pipeline, o tubería, se presenta como una secuencia de comandos simples, con un booleano que indica si se debe ejecutar en segundo plano o no. Para estos se utiliza la libreria glib, en particular usamos GSList la cual es una estructura que nos da glib representando una lista simple, tiene un puntero a un dato y un puntero al siguiente de la lista.
        
* **Parsing** (Corral, Fredes)

        El parsing o análisis sintáctico consiste en traducir la entrada estandar en un pipeline.
          
* **Builtin** (Corral, Fredes)

        Su objetivo principal es ver si un comando es interno y ejecutarlo. Tiene un par de funcionalidades:
                -builtin_is_internal, indica si el comando es interno o no. Para ello se utiliza el comando interno de bash "type", el cual nos permite poder                          reconocer los casos de cuando corremos un cmd interno de linux no definido en nuestro mybash, poder prevenir de ejecutarlo como externo.
                 Su implementacion consiste en la utilizacion de la funcion System(libreria <stlib.h>), la cual realiza una sistem call "execl". Por lo que requerimos 
                 usar un fork y un pipe para conectar el output del proceso hijo (que realiza el system) con el padre(mybash).
                -builtin_run, ejecuta el comando interno. Esto lo hace comparando el comand con una lista de internos implementados predefinida (help, cd, exit)
                -builtin_is_alone, indica si la tuberia tiene un solo comnando simple y si este interno.
         
* **Execute** (Martinez, Martiarena, Corral)

        Es el que recibe el pipeline con los comandos simples ya parseados. La idea ahora es podes ejecutarlos de la manera mas eficiente posible,
        cubriendo casos bordes, conectando procesos a través de pipes y redireccionando su salida para poder satisfacer el pedido del usuario.

    
### Proceso de Desarrollo:
        Comenzamos trabajando en el modulo command, el cual era la primera parte a desarrollar para luego poder implementar los demás. Un problema que se nos presentó
        fue al utilizar la funcion strlen en un char creado sin el caracter de finalizacion '\0', la cual nos daba error. Y tambien otros errores de Segmentation Fault
        los cuales pudimos solucionar con la herramienta de debugging gdb.

###  Resultado Final
    Blabla
![Diagrama Modularizacion](/src/diagrama_mod.png/ "Diagrama Modularizacion")

#### Explicacion
        Blablabla
