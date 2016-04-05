#!/bin/bash


#declaracion de variables: rutas de ubicacion de archivos.
DATA=../problema2
OUT_DATA=$DATA/archivos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos

mkdir $DATA/archivos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA
M=0

#pasaremos de *xls a csv.
for archivo in `find $DATA -name "*.xls"`
do
	echo "Procesando archivo $archivo"
	echo " "
	xls2csv $archivo > $OUT_DATA/datos-$M.csv
	head $OUT_DATA/datos-$M.csv > $OUT_DATA/datos-$M.dat
	let M=M+1
done 2>error1.log

#recortanto archivos
for archivo in `find $OUT_DATA -name "*.csv"`
do
	echo "Recortando archivo $archivo"
	echo " "
	head $OUT_DATA/datos-$M.csv > $OUT_DATA/datos-$M.dat
	let M=M+1
done 2>error1.log



#ciclo para limpiar los archivos *.csv
#m=0
#for archivo in find
#este ciclo extrae y limpia los datos desde los .dat y los deja en archivos graf-*.out
#la salida de error la direcciona al archivo error2.log
#for archivo in `find $SALIDA_DATOS -name "*.csv"`
#do
 #       echo "Dando formato al archivo de datos: $archivo"
#     cat $archivo  | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " "  $5}' | grep -v Sensor | sed '1,$ s/"//g' > $SALIDA_DATOS/graf-$M.dat

  #      let M=M+1
#done 2> error2.log
