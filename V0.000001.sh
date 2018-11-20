#!/bin/bash

# Controla si esta el -t presente, y si esta imprime la cantidad de archivos que se analizaron. Faltan controles

if [ $1 = "-t" ]
then
        
        #el shift corre los parametros el 2 pasa a ser el 1 y asi hasta el final
        shift 
        
        # Despliega informacion del los parametros
        for i in "$@"
        do
                echo "Archivo:"`readlink -e $i`   "Cantidad de Links:"`ls -dl $i | tr -s " " | cut -d" " -f2`
                echo "Numero de inodo:"`ls -dli $i | tr -s " " | cut -d" " -f1`"   Sistema de archivos montado en:"
                echo "Tamaño:""   Permisos:"`ls -dl $i | tr -s " " | cut -c 2-10`
                echo "Tipo de archivo:""   Dueño:"`ls -dl $i | tr -s " " | cut -d" " -f3`
                echo "Grupo:"`ls -dl $i | tr -s " " | cut -d" " -f4`
                echo "Usuarios:"`getent group \`ls -dl $i | tr -s " " | cut -d" " -f4\` | cut -d: -f1,4`              

                echo
                echo "--------------------------------------------------------------------------"
                echo
        done
        echo "+++++++++++++++++++++++++++++"
        echo "Se han listado" $@ "archivos."

        
else
        #se repite codigo al pedo, pero es temporal
        for i in "$@"
        do
                echo "Archivo:"`readlink -e $i`   "Cantidad de Links:"`ls -dl $i | tr -s " " | cut -d" " -f2`
                echo "Numero de inodo:"`ls -dli $i | tr -s " " | cut -d" " -f1`"   Sistema de archivos montado en:"
                echo "Tamaño:""   Permisos:"`ls -dl $i | tr -s " " | cut -c 2-10`
                echo "Tipo de archivo:""   Dueño:"`ls -dl $i | tr -s " " | cut -d" " -f3`
                echo "Grupo:"`ls -dl $i | tr -s " " | cut -d" " -f4`
                echo "Usuarios:"`getent group \`ls -dl $i | tr -s " " | cut -d" " -f4\` | cut -d: -f1,4`              

                echo
                echo "--------------------------------------------------------------------------"
                echo
        done
fi