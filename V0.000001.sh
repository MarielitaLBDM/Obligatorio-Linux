#!/bin/bash


# Despliega informacion del los parametros
for i in $@
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

# Controla si esta el -t presente, y si esta imprime la cantidad de archivos que se analizaron. Faltan cosas

if [ $1 = "-t" ]
then
        echo "+++++++++++++++++++++++++++++"
        echo "Se han listado" $(($#-1)) "archivos."
else
fi