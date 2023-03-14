#!/bin/bash

while true; do
  echo "Elija una opción:"
  echo "1. Entrar en carpeta"
  echo "2. Copiar archivo"
  echo "3. Eliminar archivo"
  echo "5. Leer un archivo"
  echo "4. Salir"

  # Preguntar al usuario qué opción desea elegir
  read opcion

  if [ $opcion -eq 1 ]; then
    while true; do
      # Preguntar al usuario si desea entrar en  carpeta
      echo "¿Desea entrar en carpeta? (s/n)"
      read respuesta
      # si la variable respuesta no es igual a "s". Si es así, se ejecutará el bloque de código dentro del if.
      if [ "$respuesta" != "s" ]; then
        break
      fi
      # Preguntar al usuario qué archivo desea eliminar
      ls -l
      echo "Introduce el nombre de la  carpeta que deseas entrar:"
      read carpeta
      # Verificar si el archivo existe o si se ha introducido un nombre
      if [ -f $carpeta ] && [ -n "$carpeta" ]; then
        # Eliminar el archivo
        cd $carpeta
        echo "Hemos entrado en la $carpeta."
      
      elif [ -z "$carpeta" ]; then
        echo "Ingrese un nombre de la carpeta correcto."
      else
        # Mostrar un mensaje de error si el archivo no existe
        echo "La carpeta $carpeta no existe."
      fi
    done


  elif [ $opcion -eq 2 ]; then
    ls -l
    # Preguntar al usuario qué archivo desea copiar y a qué destino
    echo "Introduce el nombre del archivo que deseas copiar:"
    read archivo
    ls -l
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
    while true; do
      # Preguntar al usuario si desea eliminar archivos
      echo "¿Desea eliminar archivos? (s/n)"
      read respuesta
      if [ "$respuesta" != "s" ]; then
        break
      fi
      # Preguntar al usuario qué archivo desea eliminar
      ls -l
      echo "Introduce el nombre del archivo que deseas eliminar:"
      read archivo
      # Verificar si el archivo existe o si se ha introducido un nombre
      if [ -f $archivo ] && [ -n "$archivo" ]; then
        # Eliminar el archivo
        rm $archivo
        echo "El archivo $archivo ha sido eliminado."
      
      elif [ -z "$archivo" ]; then
        echo "Ingrese un nombre de archivo correcto."
      else
        # Mostrar un mensaje de error si el archivo no existe
        echo "El archivo $archivo no existe."
      fi
    done


  elif [ $opcion -eq 4 ]; then
    # Salir del script
    break

  elif [ $opcion -eq 5 ]; then
  ls -l
  # Preguntar al usuario si desea entrar en una carpeta
  echo "Introduce el nombre del archivo a la que deseas leer:"
  read archivo
  # Verificar si la carpeta existe
  if [ -f $archivo ]; then
    # Entrar en la carpeta
    cat $archivo | more
  else
    # Mostrar un mensaje de error si la carpeta no existe
    echo "El arcivo $archivo no existe."
  fi
  else
    # Mostrar un mensaje de error si la opción no es válida
    echo "Opción no válida."

  fi
done



# ////////////////////////////////
# ////////////////////////////////

# if test -z "$archivo"; then
#   echo "Ingrese un nombre de archivo correcto."
# fi

# ES LO MISMO
# if [ -z "$archivo" ]; then
#   echo "Ingrese un nombre de archivo correcto."
# fi
