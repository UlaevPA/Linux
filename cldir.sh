#!/bin/bash

function check_directory_exists {
    if [ ! -d "$1" ]; then
        echo "Ошибка: директория $1 не существует."
        exit 1
    fi
}

function clean_directory {
    local directory=$1
    local extensions=$2

    for file in "$directory"/ * ; do
        if [ -f "$file" ]; then
            extension="${file## * .}"
            for ext in $extensions; do
                if [ "$extension" = "$ext" ]; then
                    rm "$file"
                fi
            done
        fi
    done
}

read -p "Введите путь к директории для очистки: " directory_path

check_directory_exists "$directory_path"

clean_directory "$directory_path" ".bak .tmp .backup"

echo "Очистка директории завершена."

