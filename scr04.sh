#!/bin/bash
#
if (( EUID != 0 ))
then
	zenity --error --text="Aquest script s'ha d'executar amb privilegis de l'usuari root"
	exit 1 
fi
#
dns==$(zenity --forms --title="CONFIGURACIÓ DE /etc/resolv.conf" --text="Dóna les dades del servidors DNS" \
        --add-entry="Dóna l'adreça IP del primer servidor DNS"  --add-entry="Dóna l'adreça IP del segon servidor DNS" \
        --add-entry="Dóna l'adreça IP del tercer servidor DNS" --width=500)
dns1=$(echo $dns | cut -d '|' -f 1)
dns2=$(echo $dns | cut -d '|' -f 2)
dns3=$(echo $dns | cut -d '|' -f 3)
#
cp /etc/resolv.conf /etc/resolv.conf.backup
echo "nameserver $dns1" > /etc//resolv.conf
echo "nameserver $dns2" >> /etc/resolv.conf
echo "nameserver $dns3" >> /etc/resolv.conf
#
exit 0
