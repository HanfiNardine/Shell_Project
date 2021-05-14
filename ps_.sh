#! /bin/bash
#page de confirmation .. 
yad --center --width=500 --height=125 --text "voulez vous lancer la commande ps et ses options ?" \
---button=gtk-no:1 --button=gtk-yes:0 --buttons-layout=center
choix=$?
if [[ $choix -eq 1 ]]; then 
cancel && exit 0
elif [[ $choix -eq 0 ]]; then
while :
do
#lancement du sous menu de la commande ps et ses options
yad --center --width=500 --height=200 --title 'OPTION -P' --text="Choisir une options de ps à lancer : 
ps -u présenter le  nom  de  l'utilisateur  et l'heure de lancement.
ps -f afficher les arbres généalogiques des proces­sus.
ps -v afficher  des  informations   sur   la   mémoire virtuelle. 
ps -aux pour afficher tous les processus actifs à l'aide de la syntaxe BSD
ps pour afficher tous les processus actifs" \
--button="ps -u":1 \
--button="ps -f":2 \
--button=" ps -v":3 \
--button="ps":4 \
--button="ps -aux":5 \

foo=$? #variable contenant le num du bouton cliqué 

#discussion selon le bouton cliqué avec la structure if..elif..else..fi
#traitement casiment identique:: passage par l intermediaire d'un fichier pour stocker le resultat puis sa redirection dans l'interface yad .  
if [[ $foo -eq 1 ]]; then
ps -u >inter.txt
yad --center --width=450 --height=450 --title 'OPTION PS -u ' --text-info<inter.txt 
elif [[ $foo -eq 2 ]]; then
ps -f >inter.txt
yad --center --width=450 --height=450 --title 'OPTION PS -f ' --text-info<inter.txt 
elif [[ $foo -eq 3 ]]; then
ps -v>inter.txt
yad --center --width=450 --height=450 --title 'OPTION PS -v ' --text-info<inter.txt 
elif [[ $foo -eq 4 ]]; then
ps>inter.txt
yad --center --width=450 --height=450 --title 'OPTION PS  ' --text-info<inter.txt 
elif [[ $foo -eq 5 ]]; then
ps -aux>inter.txt
yad --center --width=450 --height=450 --title 'OPTION PS -aux ' --text-info<inter.txt 
else
cancel && exit 0

fi
done
fi
