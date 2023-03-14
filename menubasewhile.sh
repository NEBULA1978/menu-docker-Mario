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
    echo "15. Eliminar todos los contenedores"
    echo "16. Eliminar todos los contenedores detenidos"
    echo "17. Eliminar todas las imágenes no utilizadas"
    echo "18. Eliminar todos los volúmenes no utilizados"
    echo "19. Ver redes de Docker"
    echo "20. Crear una red de Docker"
    echo "21. Eliminar una red de Docker"
    echo "22. Inspeccionar un contenedor"
    echo "23. Inspeccionar una imagen"
    echo "24. Inspeccionar una red"
    echo "25. Copiar archivos desde/hacia un contenedor"
    echo "26. Ver registros de un contenedor"
    echo "27. Limitar recursos de un contenedor"
    echo "28. Crear un volumen de Docker"
    echo "29. Conectar un contenedor a una red"
    echo "30. Desconectar un contenedor de una red"
    echo "31. Ejecutar un comando en un contenedor en ejecución"
    echo "32. Monitorear en tiempo real el uso de recursos de un contenedor"
    echo "33. Guardar una imagen en un archivo tar"
    echo "34. Cargar una imagen desde un archivo tar"
    echo "35. Compilar y ejecutar una imagen con Docker Compose"
    echo "36. Escalar servicios con Docker Compose"
    echo "37. Crear un Swarm y unirse a un Swarm"
    echo "38. Crear y desplegar servicios en un Swarm"
    echo "39. Inspeccionar servicios en un Swarm"

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

    15)
    echo "Eliminando todos los contenedores"
    docker rm $(docker ps -a -q)
    read foo
    ;;
16)
    echo "Eliminando todos los contenedores detenidos"
    docker container prune -f
    read foo
    ;;
17)
    echo "Eliminando todas las imágenes no utilizadas"
    docker image prune -a -f
    read foo
    ;;
18)
    echo "Eliminando todos los volúmenes no utilizados"
    docker volume prune -f
    read foo
    ;;
19)
    echo "Ver redes de Docker"
    docker network ls
    read foo
    ;;
20)
    echo "Crear una red de Docker"
    echo "Introduce el nombre de la red:"
    read network_name
    docker network create "$network_name"
    read foo
    ;;
21)
    echo "Eliminar una red de Docker"
    echo "Introduce el nombre de la red:"
    read network_name
    docker network rm "$network_name"
    read foo
    ;;
22)
    echo "Inspeccionar un contenedor"
    echo "Introduce el ID del contenedor:"
    read container_id
    docker inspect "$container_id"
    read foo
    ;;
23)
    echo "Inspeccionar una imagen"
    echo "Introduce el nombre o ID de la imagen:"
    read image_name
    docker inspect "$image_name"
    read foo
    ;;
24)
    echo "Inspeccionar una red"
    echo "Introduce el nombre o ID de la red:"
    read network_name
    docker network inspect "$network_name"
    read foo
    ;;
25)
    echo "Copiar archivos desde/hacia un contenedor"
    echo "Escribe 'desde' para copiar desde un contenedor o 'hacia' para copiar hacia un contenedor:"
    read direction
    if [ "$direction" == "desde" ]; then
        echo "Introduce el ID del contenedor:"
        read container_id
        echo "Introduce la ruta del archivo en el contenedor:"
        read container_path
        echo "Introduce la ruta de destino en el host:"
        read host_path
        docker cp "$container_id:$container_path" "$host_path"
    elif [ "$direction" == "hacia" ]; then
        echo "Introduce el ID del contenedor:"
        read container_id
        echo "Introduce la ruta del archivo en el host:"
        read host_path
        echo "Introduce la ruta de destino en el contenedor:"
        read container_path
        docker cp "$host_path" "$container_id:$container_path"
    else
        echo "Opción inválida. Debe ser 'desde' o 'hacia'."
    fi
    read foo
    ;;
26)
    echo "Ver registros de un contenedor"
    echo "Introduce el ID del contenedor:"
    read container_id
    docker logs "$container_id"
    read foo
    ;;
27)
    echo "Limitar recursos de un contenedor"
    echo "Introduce el ID del contenedor:"
    read container_id
    echo "Introduce el límite de CPU (por ejemplo, 0.5 para 50%):"
    read cpu_limit
    echo "Introduce el límite de memoria (por ejemplo, 256m para 256MB):"
    read memory_limit
    docker update --cpus="$cpu_limit" --memory="$memory_limit" "$container_id"
    read foo
    ;;
28)
    echo "Crear un volumen de Docker"
    echo "Introduce el nombre del volumen:"
    read volume_name
    docker volume create "$volume_name"
    read foo
    ;;
29)
    echo "Conectar un contenedor a una red"
    echo "Introduce el nombre o ID de la red:"
    read network_name
    echo "Introduce el ID del contenedor:"
    read container_id
    docker network connect "$network_name" "$container_id"
    read foo
    ;;
30)
    echo "Desconectar un contenedor de una red"
    echo "Introduce el nombre o ID de la red:"
    read network_name
    echo "Introduce el ID del contenedor:"
    read container_id
    docker network disconnect "$network_name" "$container_id"
    read foo
    ;;
31)
    echo "Ejecutar un comando en un contenedor en ejecución"
    echo "Introduce el ID del contenedor:"
    read container_id
    echo "Introduce el comando a ejecutar:"
    read command
    docker exec "$container_id" $command
    read foo
    ;;
32)
    echo "Monitorear en tiempo real el uso de recursos de un contenedor"
    echo "Introduce el ID del contenedor:"
    read container_id
    docker stats --no-stream "$container_id"
    read foo
    ;;
33)
    echo "Guardar una imagen en un archivo tar"
    echo "Introduce el nombre de la imagen:"
    read image_name
    echo "Introduce el nombre del archivo tar (ej. imagen.tar):"
    read tar_name
    docker save -o "$tar_name" "$image_name"
    read foo
    ;;
34)
    echo "Cargar una imagen desde un archivo tar"
    echo "Introduce el nombre del archivo tar (ej. imagen.tar):"
    read tar_name
    docker load -i "$tar_name"
    read foo
    ;;
35)
    echo "Compilar y ejecutar una imagen con Docker Compose"
    echo "Asegúrate de que tienes un archivo docker-compose.yml en el directorio actual"
    docker-compose up -d
    read foo
    ;;
36)
    echo "Escalar servicios con Docker Compose"
    echo "Introduce el nombre del servicio:"
    read service_name
    echo "Introduce el número de instancias del servicio:"
    read instances
    docker-compose up -d --scale "$service_name=$instances"
    read foo
    ;;
37)
    echo "Crear un Swarm y unirse a un Swarm"
    echo "¿Deseas crear un nuevo Swarm (escribe 'crear') o unirte a uno existente (escribe 'unir')?"
    read swarm_action
    if [ "$swarm_action" == "crear" ]; then
        echo "Creando un nuevo Swarm"
        docker swarm init
    elif [ "$swarm_action" == "unir" ]; then
        echo "Introduce el token del Swarm al que deseas unirte:"
        read swarm_token
        echo "Introduce la dirección IP y el puerto del manager del Swarm (ej. 192.168.1.100:2377):"
        read swarm_addr
        docker swarm join --token "$swarm_token" "$swarm_addr"
    else
        echo "Opción inválida. Debe ser 'crear' o 'unir'."
    fi
    read foo
    ;;
38)
    echo "Crear y desplegar servicios en un Swarm"
    echo "Introduce el nombre del servicio:"
    read service_name
    echo "Introduce la imagen del servicio:"
    read service_image
    echo "Introduce el número de réplicas del servicio:"
    read replicas
    docker service create --name "$service_name" --replicas "$replicas" "$service_image"
    read foo
    ;;
39)
    echo "Inspeccionar servicios en un Swarm"
    echo "Introduce el nombre del servicio:"
    read service_name
    docker service inspect "$service_name"
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
