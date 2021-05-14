#! /bin/bash
#message de confirmation 
yad --center --width=500 --height=125 --text "voulez vous lancer la commande top et ses options ?" \
---button=gtk-no:1 \
--button=gtk-yes:0 \
--buttons-layout=center
choix=$?
if [[ $choix -eq 1 ]]; then 
cancel && exit 0
elif [[ $choix -eq 0 ]]; then
while :
do
yad --center --width=500 --height=125 --text="choisir une commande à lancer:
top pour lancer la commande top 
top -h pour ************
top -u pour afficher les processus lancés par votre utilisateur" \
--button="-top":1 \
--button="-top -h":2 \
--button="-top -u":3 \


foo=$?
#lecture du bouton et discussion avec if 


if [[ $foo -eq 1 ]]; then
top

elif [[ $foo -eq 2 ]]; then
top -h

elif [[ $foo -eq 3 ]]; then
top -u $USER

else
cancel && exit 0

fi
done
fi
