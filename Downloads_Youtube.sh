#!/bin/bash

# NOMBRE DEL SCRIPT: 'Downloads_Youtube.sh'
# CREADOR: el_de_la_cuadra

# Variables.
usuario=$(whoami)
hora=$(date)

# COLORES NORMALES
rojo="\e[1;31m"
verde="\e[1;32m"
morado="\e[1;35m"
amarillo="\e[1;33m"
cyan="\e[1;34m"
azul="\e[1;36m"
gris="\e[1;37m"
reset="\e[0m"

# COLORES LUMINOSOS.
rojo_b="\e[0;31m"
verde_b="\e[0;32m"
gris_b="\e[0;37m"
morado_b="\e[0;35m"

# COLORES PARPADEANTES.
rojo_p="\e[5;1;31m"
verde_p="\e[5;1;32m"
morado_p="\e[5;1;35m"
amarillo_p="\e[5;1;33m"
cyan_p="\e[5;1;34m"
azul_p="\e[5;1;36m"
gris_p="\e[5;1;37m"

# COLORES DE FONDO.
rojo_f="\e[1;37;41m"
verde_f="\e[1;37;42m"
morado_f="\e[1;37;45m"
amarillo_f="\e[1;37;43m"
cyan_f="\e[1;37;44m"
azul_f="\e[1;37;46m"
gris_f="\e[1;30;47m"

# COLORES SUBRAYADOS
rojo_s="\e[4;1;31m"
verde_s="\e[4;1;32m"
morado_s="\e[4;1;35m"
amarillo_s="\e[4;1;33m"
cyan_s="\e[4;1;34m"
azul_s="\e[4;1;36m"
gris_s="\e[4;1;37m"
amarillo_sb="\e[4;0;33m"

# Llamaremos ah esta funcion el trap finalizar SIGINT ( En caso de que el usuario precione control + c para finalizar el script ).
finalizar() {
    echo ""
    echo -e "${amarillo}"
    read -p "Presione [Enter] Para Finalizar."
    sleep 1
    echo -e "${reset}"
    echo -e "${gris}<==[${rojo_s}Finalizar${reset}${gris}]${gris_p}...${reset}"
    sleep 2
    echo ""
    echo -e "${cyan_f}Gracias por su preferencia.${reset} ${gris}:)${reset}"
    exit
}

trap finalizar SIGINT

# Instalacion de dependencias.
Instalar_Dependencias() {
         mi_banner
         echo -e "${verde_f}Instalando dependencias.${reset}"
         echo -e "${morado}"
         sudo apt update
         sudo apt install yt-dlp -y
         echo -e "${reset}"
         echo -e "${cyan_f}Dependencias instaladas.${reset}"
         sleep 5
         mi_banner
}

# Descargar audio.
Downloads_mp3() {
          echo -e "${gris}"
          read -p "Pegue aqui la url del video.? " url
          sleep 1
          echo -e "${reset}"
          echo "${verde_s}Descargando audio por favor espere un momento${reset}${gris}...${reset}"
          sleep 3
          echo ""
          yt-dlp -x --audio-format mp3 $url
          echo ""
          echo -e "${cyan_f}Descarga finalizada.${reset}"
          sleep 5
          mkdir Audios/ && mv *.mp3 Audios/ > /dev/null
          mi_banner

}

# Descargar Video.
Downloads_mp4() {
          echo -e "${gris}"
          read -p "Pegue aqui la url del video.? " url
          sleep 1
          echo -e "${reset}"
          echo -e "${verde_s}Descargando video por favor espere un momento${reset}${gris}...${reset}"
          sleep 3
          echo ""
          yt-dlp -f mp4 $url
          echo ""
          echo -e "${cyan_f}Descarga finalizada.${reset}"
          sleep 5
          mkdir Videos/ && mv *.mp4 Videos/ > /dev/null
          mi_banner

}

# Descargar multiples videos.
Downloads_multi() {
          echo -e "${gris}"
          read -p "Pegue aqui la url del primer video.? " url1
          sleep 1
          echo -e "${gris}"
          read -p "Pegue aqui la url del segundo video.? " url2
          sleep 1
          echo -e "${gris}"
          read -p "Pegue aqui la url del tercer video.? " url3
          sleep 1
          echo -e "${reset}"
          echo -e "${verde_s}Descargando los tres videos por favor espere un momento${reset}${gris}...${reset}"
          sleep 3
          echo ""
          yt-dlp  $url1 $url2 $url3
          echo ""
          echo -e "${cyan_f}Descarga finalizada.${reset}"
          sleep 5
          mkdir Videos/ && mv *.mp4 Videos/ > /dev/null
          mi_banner

}

# Descargar videos resolucion 1080.
Downloads_1080() {
          echo -e "${gris}"
          read -p "Pegue aqui la url del video.? " url
          sleep 1
          echo -e "${reset}"
          echo -e "${verde_s}Descargando video resolucion 1080 Por favor espere un momento${reset}${gris}...${reset}"
          sleep 3
          echo ""
          yt-dlp -f 'bestvideo[height=1080]+bestaudio/best[height=1080]' $url
          echo ""
          echo -e "${cyan_f}Descarga finalizada.${reset}"
          sleep 5
          mkdir Videos/ && mv *.mp4 Videos/
          mi_banner
}

# Imprimir banner.
mi_banner() {
   clear
   echo -e "${gris}Hola... usuario ${morado}$usuario ${gris}estamos a sus ordenes.${reset}"
   echo ""
   toilet -f future "Downloads Youtube"
   echo -e "${verde_f}Hora:${reset}${gris}(${reset} ${amarillo_s}$hora${reset} ${gris})${reset}"
   echo ""
   echo ""
}

# Ejecutar script.
if [ "$(echo $?)" == "0" ]; then
        mi_banner

        while true; do
        echo -e "(${amarillo}i${reset}) Bienvenido"
        echo ""
        echo -e "${gris}1${azul}) Instalar Dependencias"
        echo ""
        echo -e "${gris}2${azul}) Descargar mp3"
        echo -e "${gris}3${azul}) Descargar mp4"
        echo -e "${gris}4${azul}) Descargar de 3 videos."
        echo -e "${gris}5${azul}) Descargar Resolucion 1080"
        echo ""
        echo -e "${gris}(${rojo}0${gris}) ${rojo}Salir${reset}"
        echo ""
        echo -e "${gris}"
        read -p "[el_de_la_cuadra]=> " opcion
        echo -e "${reset}"
        case $opcion in

        1) Instalar_Dependencias ;; 2) Downloads_mp3
        ;;
        3) Downloads_mp4 ;; 4) Downloads_multi
        ;;
        5) Downloads_1080
        ;;
        0) echo "" && echo -e "${gris}<==[${rojo_s}Finalizado${reset}${gris}]${gris_p}...${reset}" && sleep 3 && echo "" && echo -e "${verde_f}Gracias por su preferencia.${reset} ${gris}:)${reset}" && break && exit
        ;;
        *) mi_banner && echo -e "${gris}No se reconose la opcion (${rojo_p}X${reset}${gris})${reset}" && echo ""
        ;;
          esac
     done

fi




























