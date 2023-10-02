#!/bin/bash

opciones=(
    "Mostrar directorio:|ls -lth"
    "Mostrar calendario:|cal"
    "Mostrar fecha de hoy:|date"
    "Nos muestra las palabras que contiene una 'a' sin que empiecen por 'a':|grep -v '^a' /usr/share/dict/spanish | grep 'a'"
    "Nos muestra las palabras que contienen una 'a':|grep 'a' /usr/share/dict/spanish"
    "Busca en el archivo /usr/share/dict/spanish todas las líneas que contienen la letra 'a' y las últimas 10 líneas de esa salida:|grep 'a' /usr/share/dict/spanish | tail"
    "Todas las palabras que empiezan por 'a':|grep '^a' /usr/share/dict/spanish"
    "Saber los usuarios que empiezan por 'a':|grep '^a' /etc/passwd"
    "Las 10 últimas palabras que terminen en 'o':|grep 'o$' /usr/share/dict/spanish | tail"
    "Que empiece por una 'c' luego una 'aei' luego una 's' y una 'ao':|grep 'c[aei]s[ao]' /usr/share/dict/spanish | tail"
    "MUY GENERICO:|grep 'c[aei]s[ao]' /usr/share/dict/spanish"
    "MAS ESPECIFICO:|grep '^c[aei]s[ao]$' /usr/share/dict/spanish"
    "Empezar con la letra 'c' seguida de una de las letras 'a', 'e' o 'i', tener dos caracteres adicionales después de eso y terminar con una de las letras 'e', 'i', 'o', 'u', 'r', 't' o 'a':|grep '^c[aei]s..[eiourta]$' /usr/share/dict/spanish"
    "Seleccionar todas las personas de 30 años con grep:|grep ', 30$' datos.csv"
    "El comando grep imprimirá en la salida estándar todas las líneas que cumplan con este patrón:|grep -E '...'" # Aquí debes proporcionar el patrón de búsqueda que desees
    "Salir:|exit 0"
)

while true; do
    clear
    echo "MENU SCRIPT V.1"
    echo "==============================="
    echo "Escoja una opción:"
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
    done
    echo "==============================="
    read -p "Ingrese el número de la opción: " opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        clear
        seleccion="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$seleccion" # Ejecutamos el comando.
        read -p "Presione Enter para continuar..."
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
