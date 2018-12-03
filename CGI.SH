#!/bin/bash

echo Content-type: text/html
echo
echo "<HTML>
<HEAD>
<TITLE>Respuesta de consulta</TITLE>
</HEAD>
<BODY>"

#Se sacan los parametros ingresados en el formulario, decodificando la QUERY_STRING.
PARAMETROS=`echo $QUERY_STRING|cut -d= -f2 | tr ';' ' ' ` #sustituyo el separador de parametros ; por un espacio. Asi se usa como parametros para el script del ejercicio 1

#el control del -t se hace dentro del ejercicio 1
./ejercicio1 $PARAMETROS  #Se ejecuta el script con los parametros enviados

echo "</BODY>
</HTML>"


