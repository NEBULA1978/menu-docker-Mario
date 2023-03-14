#!/bin/bash

# Video 3 Tutorial de Bash Script en Linux: Ciclo while
# Comparaciones con numeros
# WORD=8
# if [ $WORD -eq 10 ]; then #si son igual WORD=8 y el valor 10
# if [ $WORD -ne 10 ]; then #si no son igual
# if [ $WORD -lt 10 ]; then #si es menor
# if [ $WORD -gt 10 ]; then #si es mayor
# if [ $WORD -le 10 ]; then #si es menor o igual
# if [ $WORD -ge 5 ]; then #si es mayor o igual
#     echo "Run is fun!!"
# else
#     echo "--------"

# fi

# video 4:
# Parte4 Tutorial de Bash Script en Linux: Ciclo while (infinito y con un contador)

# Ejemplo1
# while true; do
#     echo "Presiona Cotrl + C para salir"
#     sleep 3s
# done

# Ejemplo2
# Tarda 3segundos en cada  hace 3veces y termina ciclo
# CONTADOR1=0

# #Cuando sea menor o igual
# while [ $CONTADOR1 -lt 3 ]; do
#     echo "CONTADOR1 es $CONTADOR1"
#     CONTADOR1=$(($CONTADOR1 + 1))
#     sleep 3s
# done
# Ejemplo3
CONTADOR=0

#Cuando sea menor o igual
while [ $CONTADOR -lt 6 ]; do
    if [ $CONTADOR -eq 0 ]; then
        echo "El contador es cero"
    else
        echo "El contador es diferente a cero"
    fi
    CONTADOR=$(($CONTADOR + 1))
    sleep 3s
done
