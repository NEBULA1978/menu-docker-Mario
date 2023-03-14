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

# WORD="Hola"
# if [ "$WORD" = "Hola" ]; then #si son iguales WORD="Hola" y el valor "Hola"
#     echo "Run is fun!!"
# elif [ "$WORD" != "Hola" ]; then #si no son iguales
#     echo "--------"
# elif [ "$WORD" \< "Hola" ]; then #si es alfabeticamente menor
#     echo "--------"
# elif [ "$WORD" \> "Hola" ]; then #si es alfabeticamente mayor
#     echo "--------"
# elif [ "$WORD" \<= "Hola" ]; then #si es alfabeticamente menor o igual
#     echo "Run is fun!!"
# elif [ "$WORD" \>= "Adios" ]; then #si es alfabeticamente mayor o igual
#     echo "Run is fun!!"
# else
#     echo "--------"
# fi


# En este ejemplo, se está comparando la cadena de caracteres almacenada en la variable WORD con diferentes valores de cadena de caracteres utilizando los operadores de comparación adecuados. La salida sería "Run is fun!!" ya que la cadena de caracteres en WORD es igual a "Hola".

# También puedes utilizar los operadores de comparación con los comandos test y [ ] para realizar comparaciones con cadenas de caracteres.

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

# CONTADOR=0

# #Cuando sea menor o igual
# while [ $CONTADOR -lt 6 ]; do
#     if [ $CONTADOR -eq 0 ]; then
#         echo "El contador es cero"
#     else
#         echo "El contador es diferente a cero"
#     fi
#     CONTADOR=$(($CONTADOR + 1))
#     sleep 3s
# done



# En este ejemplo, en cada iteración se ejecutará un comando diferente en función del valor de CONTADOR. Puedes reemplazar los comandos de ejemplo con los comandos que desees ejecutar en cada caso.

# ¿si ejecuto un script en cada numero ¿se quedan abiertos luego?

# Depende de cómo estén escritos los scripts que se están ejecutando en cada iteración. Si los scripts se ejecutan en segundo plano y no esperan por la finalización de su ejecución, entonces no se quedarán abiertos y el script principal continuará su ejecución. Si los scripts se ejecutan en primer plano y esperan por su finalización, entonces el script principal se detendrá hasta que se complete la ejecución del script correspondiente.

# Por ejemplo, si quieres ejecutar un script en primer plano en cada iteración, puedes hacer lo siguiente:

CONTADOR=0

while [ $CONTADOR -lt 6 ]; do
    if [ $CONTADOR -eq 0 ]; then
        ./script1.sh
    elif [ $CONTADOR -eq 1 ]; then
        ./script2.sh
    elif [ $CONTADOR -eq 2 ]; then
        ./script3.sh
    else
        ./script4.sh
    fi
    CONTADOR=$(($CONTADOR + 1))
    sleep 3s
done

# En este ejemplo, cada script se ejecuta en primer plano y el script principal se detendrá hasta que se complete la ejecución del script correspondiente. Si deseas ejecutar un script en segundo plano, puedes agregar el carácter "&" al final de la línea de ejecución del script, como se muestra a continuación:

# ./script1.sh &

# puedes utilizar el comando "disown" junto con "./script1.sh &" para desvincular el script ejecutado en segundo plano del control de terminal actual. De esta manera, incluso si se cierra el terminal, el script continuará su ejecución en segundo plano.

# Por ejemplo:

# ./script1.sh & disown

# En este ejemplo, el script se ejecuta en segundo plano y se desvincula del control de terminal actual con el comando "disown". De esta manera, el script continuará su ejecución en segundo plano incluso si se cierra el terminal.

