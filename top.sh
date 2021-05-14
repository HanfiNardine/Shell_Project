while :
do

echo "

----- MENU -----

(1) commande top( q pour quitter top )
(2) afficher  les processus de votre utilisateur
(3) ou 0 pour quitter
"

read choix1 #lecture et discussion suivant le bouton cliqué avec la structure case.. in .. 
case $choix1 in
1)
  top
 ;;

2)
top -u $USER
;;
3| 0 | q ) echo "L'utilisateur $USER à quitter" ; 
 exit 0 ;;
*) echo "choix invalide réésseyez ! ";;
esac
done
echo
exit 0
