#!/bin/bash

# Este script genera un grafico en formato png apartir de archivos de datos con informacion numerica el archivo .dat debe estar en la misma carpeta donde se ejecuta el comando.

#Declaracion e inicializacion de variables
FMT_BEGIN=20110206 0004
FMT_END=20110206 0259
FMT_X_SHOW=%m/%d

graficar()
{
    gnuplot <<EOF 2>error.log
set xdata time
set timefmt "%Y%m%d%H%M"
set xrange ["$FMT_BEGIN" : "$FMT_END"]
set format x "$FMT_X_SHOW"
set terminal png
set output 'fig1.png'
plot "graf-1.dat" using 1:3 with lines title "sensor1", "graf-1.dat" using 1:4 with linespoints title "sensor2" 
EOF
}

graficar

