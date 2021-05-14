 
#! /bin/bash
fichier() #sauvgarde dans fichier
{ 
echo "saisir le nom du fichier"
read fichier 
ps -eo pcpu,pmem,pid,args| tail -n +2| sort -rnk 1 | head -n 5 > $(pwd)/$fichier
sed -i "1i CPU% MEM%  PID  ARGS" $(pwd)/$fichier
cat /etc/os-release >> $(pwd)/$fichier
echo "les données ont été stockées dans le fichier $(pwd)/$fichier"
} #***********************************************************************
affichefich() #affichage du fichier + test d'existance et message d'erreur
{ 
  echo "saisir le nom du fichier à lire"
  read fichier 
  if test -f $(pwd)/$fichier
  then cat $(pwd)/$fichier;
  else echo "erreur ! le fichier n 'existe pas" 
  fi 
} #************************************************************************
recherche() #affichage des lignes contenat mot cherché dans fichier apres test d'existance+message d'erreur
{
  echo "saisir le mot à chercher"
  read mot
  echo "saisir le nom du fichier à lire"
  read fichier 
  if test -f $(pwd)/$fichier
  then grep -r $mot $(pwd)/$fichier
  else echo "erreur ! le fichier n 'existe pas" 
  fi 
} #**************************************************************************
                          #début programme principal
while :
do 
echo "**************************************************************"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~MENU~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "tapez 0 pour quitter"
echo "-t :lancer les commandes top   "
echo "-p lancer les commandes ps "
echo "-r afficher uniquement les processeurs lancés par root"
echo "-h pour lancer la page d'aide "
echo "-u afficher les 5 processus les plus gourmands en terme cpu "
echo "-s pour sauvgarder les données pertinentes dans un fichier passé en argument"
echo "-o pour afficher les infos pertinentes dans un fichier"
echo "-of pour chercher un mot dans un fichier"
echo "-v pour afficher la version et les noms d'auteurs de l'application"
echo "-a pour afficher la version et les noms d'auteurs de votre machine"
echo "**************************************************************"
echo "votre choix"
read opt #lecture de l'option 
case $opt in #discussion selon l'option 
-s) 
  fichier; #appel fonction de sauvgarde
;;
-a) 
  cat /etc/os-release
;;
-v) 
  echo '********************************
version application:: v1.0.1
auteurs:: Hanfi Nardine && Karoui Yassine
********************************** '
;;
-o)
  affichefich; #appel fonction d'affichage
;;
-of)
 recherche;  #appel fonction de recherche
;;
-t) 
./top.sh  #execution du fichier de la commande top et ses options 
;;
-p)  
./ps.sh #execution du fichier de la commande ps et ses options 
;;
-r) #affichage des processus lancé par root 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  ps -u root -U root u
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
;;
-h) #affichage de la page help 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  cat /etc/HelpProjet.txt
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
;;
-u) #affichage des informations pertinentes
./cpu.sh
;;
0) #quitter
 exit 0
  ;;
*) #option differentes inexistante
 echo "option invalide ! réesseyez" 
;;
esac
done
