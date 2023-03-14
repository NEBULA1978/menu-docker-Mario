#!/bin/bash

#Bucle infinito
while :; do
    #Limpiar pantalla y mostrar menú
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar calendario"
    echo "3. Descargar imagen de docker"
    echo "5. Ver imagenes de docker"
    echo "6. Ver imagenes de docker de la pagian https://hub.docker.com/search?q="
    echo "7. Eliminar imagenes de docker"
    echo "8. Entrar en imagene de docker introducir el nombre"
    echo "9. Ver contenedores activos"
    echo "10. Ver contenedores en pausa"
    echo "11. Quiero entrar en este contenedor con un terminal bash"
    echo "12. Quiero detener  este contenedor"
    echo "13. Quiero iniciar contenedor desde Dockerfile"
    echo "14. Quiero iniciar contenedor con docker images y docker run -it NombreFichero"

    echo "4. Salir"
    echo ""
    #Solicitar opción de menú
    echo -n "Escoger opcion: "
    read opcion
    #Selección de opción de menú
    case $opcion in
    1)
        echo "Mostrando directorio"
        ls
        read foo
        ;;
    2)
        echo "Mostrando calendario"
        cal
        read foo
        ;;
    3)  
        echo "Descargar imagen de Docker"
        echo "Introduce el nombre de la imagen:"
        read image_name
        # Descargar imagen
        docker pull "$image_name"
        read foo
        ;;

    5)
        echo "Ver imagenes de docker"
        docker images
        read foo
        ;;
    6)
        echo "Ver imagenes de docker de la pagian https://hub.docker.com/search?q="
        xdg-open "https://hub.docker.com/search?q="
        read foo
        ;;
    7)
        echo "Eliminar imagene de docker"
        docker images

        echo "Introduce el nombre de la imagen de docker a eliminar:"
        read image_name_delete
        # Eliminar imagen
        docker rmi -f "$image_name_delete"
        
        read foo
        ;;
    8)
        echo "Mostrando imagenes posibles para entrar"
        docker images

        echo "Introduce el nombre de la imagen de docker a entrar:"
        read image_name_entrar
        # Eliminar imagen
        docker run -it "$image_name_entrar"
        
        read foo
        ;;
    9)
        echo "Ver contenedores activos"
        docker ps
        read foo
        ;;
    10)
        echo "Ver contenedores en pausa"
        docker ps -a
        read foo
        ;;
    11)
        docker ps -a
        echo "Quiero entrar en este contenedor con un terminal bash"
        echo "Introduce el ID de la imagen de docker a entrar:"
        read IDContenedor
        echo "Iniciamos el contenedor antes de poder entar"
        echo 'docker start $IDContenedor'
        docker start $IDContenedor
        docker exec -it $IDContenedor bash
        read foo
        ;;
    12)
        docker ps -a
        echo "Quiero detener  este contenedor"
        echo "Introduce el ID de la imagen de docker a detener:"
        read IDContenedor
        echo 'docker detenido $IDContenedor'
        docker stop $IDContenedor
        
        read foo
        ;;
    13)
        cd docker
        echo "Quiero iniciar contenedor desde Dockerfiler con build"
        echo "Introduce el Tag de la imagen del archivo Dockerfile :"
        read TagContenedor
        echo 'Iniciando Contenedor con build'
        docker build -t $TagContenedor .
        
        read foo
        ;;
    14)
        docker images
        echo " Quiero iniciar contenedor con docker images y docker run -it NombreFichero"
        echo "Introduce el nombre del Tag de la imagen  :"
        read NomImagen
        echo 'Iniciando Contenedor con run'
        docker run -it $NomImagen
        
        read foo
        ;;
    4)
        #Salir del script
        exit 0
        ;;
    #Alerta de opción inválida
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
