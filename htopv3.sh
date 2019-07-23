#!/bin/bash

while true; do 
echo -e "\n"
echo " Que souhaitez vous savoir ?"
echo -e "\n"
echo "1. La consommation de RAM en Mb"
echo "2. La consommation de RAM en Gb"
echo "3. La consommation de RAM en %"
echo "4. l'uptime de la machine"

echo

echo -e " Entrez votre choix ou bien appuyez sur la touche 0 pour quitter \n"
read choice
echo

case $choice in
    1)
        MemTotal=$(grep MemTotal /proc/meminfo | awk '{print $2}')
        MemFree=$(grep MemFree /proc/meminfo | awk '{print $2}')
        MemUse=$((($MemTotal-$MemFree)/1024))
        echo "Votre Consommation est de $MemUse Mb"
    ;;
    2)
        MemTotal=$(grep MemTotal /proc/meminfo | awk '{print $2}')
        MemFree=$(grep MemFree /proc/meminfo | awk '{print $2}')
        MemUse=$(((($MemTotal-$MemFree)/1024)/1024))
        echo "Votre Consommation est de $MemUse Gb"
    ;;
    3)
	MemTotal=$(grep MemTotal /proc/meminfo | awk '{print $2}')
        MemFree=$(grep MemFree /proc/meminfo | awk '{print $2}')
        MemUse=$(($MemTotal-$MemFree))
        Percent=$((($MemUse * 100)/$MemTotal))
        echo -e "Votre Consommation est de $Percent % \n"
    ;;
    4)
        awk '{printf("Votre Machine est allumé depuis %d Jours - %02d Heures - %02d Minutes - %02d Secondes\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime
    ;;
    0)
    echo " Très bien, à très bientöt !"
    break
    ;;
    *)
    echo " Ce choix n'est pas valide , merci de bien vouloir indiquer une valeur entre 0 et 4 : "
    ;;
esac
done
