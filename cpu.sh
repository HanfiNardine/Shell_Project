while :
do

echo "

----- MENU -----

(1) affichage des 5 processus les plus gourmands
(2) affichage de l'architecture du CPU
(0) quitter
"

read choix1
case $choix1 in
*1)
 echo 'La liste des 5 processus les plus gourmands en terme de cpu'
 echo ' PID  CPU%  MEM%  ARGS '
 ps -eo pid,pcpu,pmem,args | tail -n +2 | sort -rnk 2 | head -5 #extraction des 5 premières lignes après les avoir trier dans un sens décroissant
 ;;
*2)
lscpu #lister l'architecture du processeur
;;
*0 | q ) echo "L'utilisateur $USER à quitter" ; echo ; exit 0 ;;
*) echo "choix invalide ! réesseyez";;
esac
done
echo
exit 0
