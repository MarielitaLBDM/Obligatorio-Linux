#!/bin/bash

echo Content-type: text/html
echo
echo "<HTML>
<HEAD>
<TITLE>Respuesta de consulta</TITLE>
</HEAD>
<BODY>"

#Se sacan los parametros ingresados en el formulario, decodificando la QUERY_STRING.
#El primer cut corta los parametros de el resto de la URL y el segundo separa el input del text field del checkbox
#sustituyo el separador de parametros ; (%3B) por un espacio. Asi se usa como parametros para el script del ejercicio 1 
#y apreto los espacios a uno solo
PARAMETROS=`echo $QUERY_STRING|cut -d= -f2 | cut -d"&" -f1 | tr '%3B' ' ' | tr -s " "` 


#Este if controla que el query_string venga con el checkbox o no
if echo $QUERY_STRING | grep "MOSTRARTOTAL=TRUE" > /dev/null
then
    MOSTRARTOTAL="-t"
    echo `./ejercicio1 $MOSTRARTOTAL $PARAMETROS` #Se ejecuta el script con los parametros enviados y el modificador
else
    echo `./ejercicio1 $PARAMETROS`  #Se ejecuta el script con los parametros enviados
fi 

echo "</BODY>
</HTML>"

#mycgi?archivos=arch1%3Barch2&MOSTRARTOTAL=TRUE (ejemplo de QS con checkbox prendido)