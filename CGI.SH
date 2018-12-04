#!/bin/bash

echo Content-type: text/html
echo
echo "<HTML>
<HEAD>
<TITLE>Respuesta de consulta</TITLE>
</HEAD>
<BODY>
<PRE>"          #PreFormatedText, para mantener formato de lo que introduzcamos luego dentro del body, inclusive el script nuestro, si no queda todo de corrido

#Se sacan los parametros ingresados en el formulario, para decodificar la QUERY_STRING.
#Hay que cortar primero en el & para que no nos de problema luego, cortando la parte del checkbox (si existe) del resto del string, luego en = para sacar los parametros introducidos
#sustituyo el separador de parametros ; (%3B) por un espacio y %2F por / con SED. Asi se usan como parametros para el script del ejercicio 1 
#y apreto los espacios a uno solo

PARAMETROS=`echo "$QUERY_STRING" | cut -d"&" -f1 | cut -d= -f2 | sed 's/%3B/ /g' | sed 's/%2F/\//g'`    #hay que poner el QUERY_STRING entre "" para que no tome el & como tarea, y cortar primero por ese caracter y luego por =


#Este if controla que el query_string venga con el checkbox o no
if echo "$QUERY_STRING" | egrep "&check=t$" > /dev/null
then
    /var/www/cgi-bin/search -t $PARAMETROS #Se ejecuta el script con los parametros enviados y el modificador
else
    /var/www/cgi-bin/search $PARAMETROS  #Se ejecuta el script con los parametros enviados
fi 

echo "</PRE>
</BODY>
</HTML>"