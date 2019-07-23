#!/bin/bash

while true; do 
echo " Que souhaitez vous savoir ?"
echo "1. La consommation de RAM en Mb"
echo "2. La consommation de RAM en Gb"
echo "3. La consommation de RAM en %"
echo "4. l'uptime de la machine"

echo

echo -n " Entrez votre choix ou bien appuyez sur la touche 0 pour quitter"
read choice
echo

case $choice in
    1)
    MemTotal=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    MemFree=$(grep MemFree /proc/meminfo | awk '{print $2}')
     echo $(($MemTotal-$MemFree))
    ;;
    2)
    MemTotal=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    MemFree=$(grep MemFree /proc/meminfo | awk '{print $2}')
     echo $(($MemTotal-$MemFree))

    ;;
    3)

    ;;
    4
    awk '{printf("%d:%02d:%02d:%02d\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime
    ;;
    0)
    echo " Très bien, à très bientöt !"
    break
    ;;
    *)
    echo " Ce choix n'est pas valide , merci de bien vouloir indiquer une valeur entre 0 et 3"
    ;;
esac
done

