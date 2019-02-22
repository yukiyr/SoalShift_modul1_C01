#!/bin/bash

number=1
for file in *.jpg
do
base64 -d "$file" | xxd -r > "foto"$number".jpg"
let number++
done

#crontab = 14 14 14 2 5 /bin/bash /home/test/soal1.sh
