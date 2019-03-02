- Enkripsi
#!/bin/bash

today="$( date +"%H:%M %d-%m-%Y" )"
jam="$( date +"%H" )"

alpha=({a..z})
encrypt=( "${alpha[@]:(-(26-$jam))}" )
encrypt+=( "${alpha[@]:0:$jam}" )

alpha1=({A..Z})
encrypt1=( "${alpha1[@]:(-(26-$jam))}" )
encrypt1+=( "${alpha1[@]:0:$jam}" )

awk '{print}' /var/log/syslog | tr "${alpha[*]}" "${encrypt[*]}"| tr "${alpha1[*]}" "${encrypt1[*]}"  > "$today".log

#crontab = */60 * * * * /bin/bash /home/test/soal4.sh

- Dekripsi
#!/bin/bash

hurufkecil=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
hurufbesar=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

echo “Enter the filename :”
read hour
jam=${hour:0:2}

bawah=${hurufkecil[$jam]}
atas=${hurufbesar[$jam]}
