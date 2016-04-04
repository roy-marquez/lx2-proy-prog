#!/bin/bash

# Este script extrae archivos de excel y grafica datos.

#esta linea indica el PATH de origen de los datos xls
DATOS=../hojasDatos

#esta linea indica la subcarpeta donde se crearan los cvs
SALIDA_DATOS=$DATOS/datos_csv

#esta linea crea la subcarpeta datos_csv donde se guardan los datos
mkdir $SALIDA_DATOS

#inicia el contador en cero
M=0

#este ciclo extrae la informacion de los .xls y los convierte a cvs
#la salida de error la direcciona al archivo error1.log
for archivo in `find $DATOS -name "*.xls"`
do
	echo "Procesando archivo $archivo"
	xls2csv $archivo > $SALIDA_DATOS/dato-$M.csv
	let M=M+1
done 2>error1.log

#setea de nuevo el contador a cero
M=0

#este ciclo extrae y limpia los datos desde los cvs y los deja en archivos graf-*.dat
#la salida de error la direcciona al archivo error2.log
for archivo in `find $SALIDA_DATOS -name "*.csv"`
do
	echo "Dando formato al archivo de datos: $archivo"
	cat $archivo  | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " "  $5}' | grep -v Sensor | sed '1,$ s/"//g' > $SALIDA_DATOS/graf-$M.dat
	
	let M=M+1
done 2> error2.log



