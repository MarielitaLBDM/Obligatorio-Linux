#!/bin/bash

echo Content-Type: text/html
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

for i in $PARAMETROS #se controla que el primer char de cada parametro sea "/" y de esta manera verificar si es una ruta absoluta
do
    if ! [ `echo $i | cut -c1` = "/" ]
    then 
        echo "</PRE>  
            ERROR!! Ingresar parametros solamente con caminos absolutos.
            <BR>
            Retorno al forulario, haga <a href="http://localhost/index.html">clic aqui</a>
            </BODY>
            </HTML>"

        exit
    fi
done

if echo "$QUERY_STRING" | egrep "&check=t$" > /dev/null
then
    for i in $PARAMETROS
    do
        if [ `/var/www/cgi-bin/search $i | tr -s " " | grep "Cantidad de Links" | cut -d" " -f6` -gt 1 ]
        then
            echo <b>
            echo `/var/www/cgi-bin/search $i`
            echo </b>
        else
            echo `/var/www/cgi-bin/search $i`
        fi
    done
    echo `/var/www/cgi-bin/search -t $i` | tail -2
else
    for i in $PARAMETROS
    do
        if [ `/var/www/cgi-bin/search $i | tr -s " " | grep "Cantidad de Links" | cut -d" " -f6` -gt 1 ]
        then
            echo <b>
            echo `/var/www/cgi-bin/search $i`
            echo </b>
        else
            echo `/var/www/cgi-bin/search $i`
        fi
    done
fi



#Este if controla que el query_string venga con el checkbox o no
#if echo "$QUERY_STRING" | egrep "&check=t$" > /dev/null
#then
#    /var/www/cgi-bin/search -t $PARAMETROS #Se ejecuta el script con los parametros enviados y el modificador
#else
#    /var/www/cgi-bin/search $PARAMETROS  #Se ejecuta el script con los parametros enviados
#fi

if [ $? -gt 0 ]
then
    echo "</PRE>
        Retorno al formulario, haga <a href="http://localhost/index.html">clic aqui</a>"
fi

echo "</PRE>
</BODY>
</HTML>"