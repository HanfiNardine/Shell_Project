#! /bin/bash

while :
do
#choix du types de tri à réaliser
yad --center --width=500 --height=200 --title 'OPTION -U' --text="voulez vous consulter les processus les plus gourmands en terme de.. ?" \
--button="CPU%":1 \
--button="MEM%":2 \


foo=$?
#lecture du num du bouton et discussion avec if 

if [[ $foo -eq 1 ]]; then
 ps -eo pid,pcpu,pmem,args | tail -n +2 | sort -rnk 2 | head -5 >inter.txt  #mise en forme de l'affichage de ps+ tri selon pcpu et extraction des 5 premier et redirection dans un fichier intermediaire 
 sed -i "1i PID    CPU%   MEM%  ARGS" inter.txt #ajout d une ligne au debut du fichier comme entete 
yad --center --width 450 --height 450 --title 'En terme de Processeur' --text-info <inter.txt #affichage du resultat sur l interface yad 
elif [[ $foo -eq 2 ]]; then #refaire le meme traitement mais selim pmem 
 ps -eo pid,pmem,pcpu,args | tail -n +2 | sort -rnk 2 | head -5 >inter.txt
 sed -i "1i PID    MEM%   CPU%  ARGS" inter.txt
 yad --center --width 450 --height 450 --title 'En terme de Mémoire' --text-info <inter.txt
else
cancel && exit 0

fi
done
fi
