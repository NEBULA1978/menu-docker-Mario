#!/bin/bash

echo "Elija una opción:"
echo "1. Entrar en carpeta"
echo "2. Copiar archivo"
echo "3. Eliminar archivo"

# Preguntar al usuario qué opción desea elegir
read opcion

if [ $opcion -eq 1 ]; then
  # Preguntar al usuario si desea entrar en una carpeta
  echo "¿Desea entrar en una carpeta? (s/n)"
  read respuesta

  if [ "$respuesta" == "s" ]; then
    # Preguntar al usuario qué carpeta desea entrar
    echo "Introduce el nombre de la carpeta a la que deseas entrar:"
    read carpeta
    # Verificar si la carpeta existe
    if [ -d $carpeta ]; then
      # Entrar en la carpeta
      cd $carpeta
    else
      # Mostrar un mensaje de error si la carpeta no existe
      echo "La carpeta $carpeta no existe."
    fi
  fi

elif [ $opcion -eq 2 ]; then
  # Preguntar al usuario qué archivo desea copiar y a qué destino
  echo "Introduce el nombre del archivo que deseas copiar:"
  read archivo
  echo "Introduce el nombre del destino:"
  read destino
  # Verificar si el archivo existe
  if [ -f $archivo ]; then
    # Copiar el archivo
    cp $archivo $destino
    echo "El archivo $archivo ha sido copiado a $destino."
  else
    # Mostrar un mensaje de error si el archivo no existe
    echo "El archivo $archivo no existe."
  fi

elif [ $opcion -eq 3 ]; then
  # Preguntar al usuario qué archivo desea eliminar
  echo "Introduce el nombre del archivo que deseas eliminar:"
  read archivo
  # Verificar si el archivo existe
  if [ -f $archivo ]; then
    # Eliminar el archivo
    rm $archivo
    echo "El archivo $archivo ha sido eliminado."
  else
    # Mostrar un mensaje de error si el archivo no existe
    echo "El archivo $archivo no existe."
  fi

else
  # Mostrar un mensaje de error si la opción no es válida
  echo "Opción no válida."

fi

# En este ejemplo, si el usuario elige la opción 1, se le pregunta si desea entrar en una carpeta o no. Si responde "s", se pregunta el nombre de la carpeta y se verifica si existe.