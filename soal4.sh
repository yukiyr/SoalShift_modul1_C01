#!/bin/bash

today="$( date +"%H:%M %d-%m-%Y" )"
jam="$( date +"%H" )"

let a=$jam+1
let b=$jam+2
let c=$jam+3
let d=$jam+4
let e=$jam+5
let f=$jam+6
let g=$jam+7
let h=$jam+8
let i=$jam+9
let j=$jam+10
let k=$jam+11
let l=$jam+12
let m=$jam+13
let n=$jam+14
let o=$jam+15
let p=$jam+16
let q=$jam+17
let r=$jam+18
let s=$jam+19
let t=$jam+20
let u=$jam+21
let v=$jam+22
let w=$jam+23
let x=$jam+24
let y=$jam+25
let z=$jam+26

awk '{print}' /var/log/syslog | sed "s/a/$a/" | sed "s/b/$b/" | sed "s/c/$c/" | sed "s/d/$d/" | sed "s/e/$e/" | sed "s/f/$f/" | sed "s/g/$g/" | sed "s/h/$h/" | sed "s/i/$i/" | sed "s/j/$j/" | sed "s/k/$k/" | sed "s/l/$l/" | sed "s/m/$m/" | sed "s/n/$n/" | sed "s/o/$o/" | sed "s/p/$p/" | sed "s/q/$q/" | sed "s/r/$r/" | sed "s/s/$s/" | sed "s/t/$t/" | sed "s/u/$u/" | sed "s/v/$v/" | sed "s/w/$w/" |  sed "s/x/$x/" | sed "s/y/$y/" | sed "s/z/$z/" | sed "s/A/$a/" | sed "s/B/$b/" | sed "s/C/$c/" | sed "s/D/$d/" | sed "s/E/$e/" | sed "s/F/$f/" | sed "s/G/$g/" | sed "s/H/$h/" | sed "s/I/$i/" | sed "s/J/$j/" | sed "s/K/$k/" | sed "s/L/$l/" | sed "s/M/$m/" | sed "s/N/$n/" | sed "s/O/$o/" | sed "s/P/$p/" | sed "s/Q/$q/" | sed "s/R/$r/" | sed "s/S/$s/" | sed "s/T/$t/" | sed "s/U/$u/" | sed "s/V/$v/" | sed "s/W/$w/" | sed "s/X/$x/" | sed "s/Y/$y/" | sed "s/Z/$z/"  > "$today".log 

#crontab = */60 * * * * /bin/bash /home/test/soal4.sh
