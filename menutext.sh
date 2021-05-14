graphique() #affichage d'un sous menu de chois de type de courbe
{
yad --center --width=300 --height=125 --title 'COURBE/CAMEMBER CPU%' --text="Veuillez choisir le type de graphique à voir :" \
--button="courbe CPU%":1 \
--button="camember CPU%":2 
foo=$?
if [[ $foo -eq 1 ]]; then
./file.sh
elif [[ $foo -eq 2 ]]; then
./pie2.sh
else
cancel && exit 0
fi
}
#******************************************************************
while :
do
#affichge sous menu
echo "

----- MENU -----

(1) afficher et gerer les caractéristique harware de machine
(2) afficher les courbe & camember
(3) 0 = Quitter
"

read choix #lire le choix et discussion avec case..in
case $choix in
*1)
./caracteristiques.sh #execution de fichier caracterisqtiques 
 ;;

*2)
graphique;
;;

3| 0 | q ) echo "L'utilisateur $USER à quitter le programme" ; 
 exit 0 ;;
*) echo "CHOIX INVALIDE ! RÉESSEYEZ ";;
esac
done
echo
exit 0

