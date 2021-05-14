#! /bin/bash
graphfich() #7/ sauvgarde
{
fichier=$(yad --center --width=600 --height=100 --entry  --title='stockage dans un fichier' --text='Tapez le nom du fichier à remplir' --text-align="center" --no-escape  --on-top)
ps -eo pcpu,pmem,pid,args| tail -n +2| sort -rnk 1 | head -n 5 > $(pwd)/$fichier
sed -i "1i CPU% PMEM%  PID  ARGS" $(pwd)/$fichier
cat /etc/os-release >> $(pwd)/$fichier
}
#**********************************************************************
graphaffichfich() #8/ affichage du fichier + test d'existance et message d'erreur
{
fichier=$(yad --entry --center --width=600 --height=100 --title='afficher un fichier' --text='Tapez le nom du fichier à afficher' --text-align="center" --no-escape --on-top)
 if test -f $(pwd)/$fichier
    then yad --center --width=500 --height=500 --title 'affichage des données' --text-info -wrap < $(pwd)/$fichier
  else yad --text="le fichier n'existe pas !! réesseyez " --title 'WARNING' --text-align="center" --no-escape
  fi 
} #********************************************************************
graphrecherche() #9/ affichage des lignes contenant le mot cherché dans fichier + test d'existance et message d'erreur
{
fichier=$(yad --entry --center --title="recherche d'um mot clé" --text='Tapez le nom du fichier' --text-align="center" --no-escape --mouse --on-top)
 if test -f $(pwd)/$fichier
    then word=$(yad --entry --centre --title="recherche d'un mot clé" --text="Tapez le mot clé à chercher dans $(pwd)/$fichier" --text-align="center" --no-escape --on-top)
      grep -r $word $(pwd)/$fichier > inter.txt ;
      yad --center --width=500 --height=500 --title "affichage des lignes contenant $word" --text-info -wrap < inter.txt
  else yad --text="le fichier n'existe pas !! réesseyez " --title 'WARNING' --text-align="center" --no-escape
  fi 
} #***********************************************************************
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
} #************************************************************************
                       #début du programme principale
while :
do
#affichage menu avec les boutons 
yad --center --width=300 --height=125 --title 'MENU GRAPHIQUE' --text="Veuillez choisir une commande :" \
--button="-t":1 \
--button="-p":2 \
--button="-r":3 \
--button="-h":4 \
--button="-u":5 \
--button="-gnuplot":6  \
--button="-s":7 \
--button="-o":8 \
--button="-o -f":9 \
--button="-v":10

foo=$? #variable contenant le num du bouton cliqué
#discussion selon le bouton cliqué
if [[ $foo -eq 1 ]]; then
./top_.sh #execution du fichier .sh contenant le traitement de top et ses options

elif [[ $foo -eq 2 ]]; then
./ps_.sh #execution du fichier .sh contenant le traitement de ps et ses options

elif [[ $foo -eq 3 ]]; then
ps -u root -U root u #affichage des processus lancés par root

elif [[ $foo -eq 4 ]]; then
yad --center --width=600 --height=500 --title 'Help page' --text-info< /etc/HelpProjet.txt #affichage de la page help 
elif [[ $foo -eq 5 ]]; then
./cpu_.sh #affcihage sous menu des informations pertinentes

elif [[ $foo -eq 6 ]]; then
graphique;          #affichage des courbes
elif [[ $foo -eq 7 ]]; then
graphfich; #appel à la fonction pour sauvgarde
elif [[ $foo -eq 8 ]]; then
graphaffichfich; #appel de la fonction d'affichage
elif [[ $foo -eq 9 ]]; then
graphrecherche; #appel de la fonction pour la recherche
elif [[ $foo -eq 10 ]]; then
yad --center --width=200 --height=200 --title='VERSION APPLICATION' --text='version 1.0.1                                BY Hanfi Nardine et Karoui Yassine'  
#affichage de la version et des auteurs de la machine
else
cancel && exit 0

fi
done
