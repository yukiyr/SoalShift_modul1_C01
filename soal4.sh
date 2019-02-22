#!/bin/bash

today="$( date +"%H:%M %d-%m-%Y" )"
jam="$( date +"%H" )"


alpha=({a..z})
encrypt=( "${alpha[@]:(-(26-$jam))}" )
encrypt+=( "${alpha[@]:0:$jam}" )

awk '{print}' /var/log/syslog | tr "${alpha[*]}" "${encrypt[*]}"  > "$today".log

#crontab = */60 * * * * /bin/bash /home/test/soal4.sh
