while :
do

echo "

----- MENU-----

(1)présenter le  nom  de  l'utilisateur  et l'heure de lancement.
(2)affiche les arbres généalogiques des proces­sus.
(3)ps -v affiche  des  informations   sur   la   mémoire virtuelle.
(4) connaître les processus actifs à un moment donné
(5) commande ps 
(6) quiter
"
#lecture du choix et discussion avec case in ==> lancement de ps avec des options .
read choix1
case $choix1 in
*1)
 ps -u 
 ;;

*2)
ps -f
;;
*3) ps -v
;;
*4) 
 ps
;;
*5)
ps -aux  
;;
6| 0 | q ) echo "L'utilisateur $USER à quitter" ;
 exit 0 ;;
*) echo "choix invalide ! réesseyez";;
esac
done
echo
exit 0
