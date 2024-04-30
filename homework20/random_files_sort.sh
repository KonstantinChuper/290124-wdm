#!/bin/bash
dir1="/opt/290124-wdm/Konstantin/opt1/*"
dir2="/opt/290124-wdm/Konstantin/opt2"

for file in $dir1; do
    number=$(basename "$file")
    echo $number
    if (( $number % 2 == 0 )); then
        mv "$file" "$dir2"
        echo "Файл $file перенесен во вторую директорию."
    else
        echo "Файл $file оставлен в текущей директории."
    fi
done
