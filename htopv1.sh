#!/bin/sh
free -m |awk 'NR==2{printf "RAM Utilisée: %s/%sMB (%.2f%%)\n" , $3,$2,$3*100/$2 }'
df -h | awk '$NF=="/" {printf "Utilisation du disque: %d/ %dGB (%s) \n" , $3,$2,$5}'
top -bn1 | grep load  | awk '{printf " Charge CPU: %.2f\n", $(NF-2)}'
