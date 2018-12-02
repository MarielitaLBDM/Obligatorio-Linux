#!/bin/bash

# Verificamos si el primer parametro empieza con -, en caso de que si, comparamos y vemos si es -t, que es valido, en caso contrario mandamos mensaje de error
LISTAR=0
if [ `echo $1 | cut -c1` = "-" ]    #identificamos si empieza o no con -, si no empieza sigue normal porque es un archivo
then
        if [ $1 = "-t" ]        #igualamos a -t para ver si el modificador es valido o no
        then
                LISTAR=1        #si existe t se carga en variable LISTAR un 1, si no existe, se mantiene el 0
                shift           #elimina el primer parametro, en este caso -t
        else
                echo "Modificador" $1 "incorrecto. Solo se acepta -t para desplegar la cantidad de archivos listada con exito" >&2
                exit 2          
        fi
fi

# Controlamos si se ingresaron o no parametros, si es 0 envia mensaje por salida estandard de errores, y envia codigo de error 3
if [ $# -eq 0 ]
then
        echo "Cantidad de parametros erronea, por favor ingrese algun archivo a listar" >&2
        exit 3
fi

#Desplegamos info de archivos
EXISTE=0
NOEXISTE=0
for i in "$@"
do
        CA=`readlink -e  $i`        #Cargo en variable CA, el camino absoluto del archivo con el comando readlink cada vez que empieza a recorrer un nuevo elemento de la lista el FOR
        if [ -a $CA ]                   #compruebo que exista el archivo
        then
                if ls -d $CA 1>/dev/null               #Compruebo que tenga permisos de lectura con el comando LS
                then
                        EXISTE=$(($EXISTE + 1 ))

                        echo "Archivo: "$CA     "Cantidad de Links: "`ls -dl $CA | tr -s " " | cut -d" " -f2`
                        echo "Numero de inodo: "`ls -dli $CA | tr -s " " | cut -d" " -f1` "     Sistema de archivos montado en: "FALTAESTO
                        echo "Tamaño: "FALTAESTO "       Permisos: "`ls -dl $CA | tr -s " " | cut -c 2-10`
                        echo "Tipo de archivo: "FALTAESTO "      Dueño: "`ls -dl $CA | tr -s " " | cut -d" " -f3`
                        echo "Grupo: "`ls -dl $CA | tr -s " " | cut -d" " -f4` "        Usuarios: "`getent group \`ls -dl $CA | tr -s " " | cut -d" " -f4\` | cut -d: -f4`       

                        echo
                        echo "--------------------------------------------------------------------------"
                        echo

                else
                        echo "No se tienen los permisos necesarios para acceder a la informacion del archivo: " $CA >&2
                        echo "///"
                        NOEXISTE=1
                fi

        else   
                echo "No existe en el sistema el archivo: " $CA >&2
                echo "*** " >&2
                NOEXISTE=1          
        fi

done

if [ LISTAR = 1 ]
then
        echo "+++++++++++++++++++++++++++++"
        echo "Se han listado " $EXISTE " archivos."
fi

if [ $NOEXISTE = 1 ]
then   
        exit 1
else   
        exit 0
fi
