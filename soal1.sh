#!/bin/bash

angka=1 
for gambar in /home/test/nature/*.jpg 
do base64 -d "$gambar" | xxd -r > /home/test/nature/$angka.jpg 
let angka++ 
done

#crontab = 14 14 14 2 5 /bin/bash /home/test/soal1.sh
