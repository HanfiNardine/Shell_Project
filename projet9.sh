#!/bin/bash
fichier() #stocker les infos pertinentes dans un fichier passé en paramètre
{ fichier=$1
 ps -eo pcpu,pmem,pid,args| tail -n +2| sort -rnk 1 | head -n 5 > $(pwd)/$fichier
 cat /etc/os-release >> $(pwd)/$fichier
 echo "les données ont été stockées dans le fichier $(pwd)/$fichier"
 sed -i "1i CPU% PMEM%  PID  ARGS" $fichier
 
} #************************************************************************
affichfich() #affcihage des infos dans un fichier + test d existance et message d'erreur
{ 
      if test -f $(pwd)/$1
      then cat $(pwd)/$1;
      else echo "erreur ! le fichier n 'existe pas" 
      fi 
} #*************************************************************************
recherche() #recherche d'un mot clé dans un fichier + test d'existance et message d'erreur
{ 
      if test -f $(pwd)/$1
      echo "$2 *** $(pwd)/$1"
      then grep -r $2 $(pwd)/$1
      else echo "erreur ! le fichier n 'existe pas"             
      fi 
} #*************************************************************************
                     #début programme principal
       while getopts "f:o:mgtpruhs:va" option #definir la liste des options

       do
           
               echo "getopts a trouvé l'option $option"

               case $option in #discussion selon l'option entrée

                       m) ./menutext.sh #execution du fichier du menu textuel

                              ;;

                      g) ./menugraph.sh #execution du fichier du menu graphique 
                      ;;

                      t) top
                        ;;
                      a) cat /etc/os-release
                        ;;
                      v)   echo '************************************
version application:: v1.0.1
auteurs:: Hanfi Nardine && Karoui Yassine
*************************************** '
                        ;;
                      p)  
                         ps -aux 
                        ;;
                      r)
                        ps -u root -U root u #affichage des processus lancés par root 
                        ;;
                      h) 
                         cat /etc/HelpProjet.txt #affichage de la page help de l'application
                        ;;
                      u)
                         ./cpu.sh  #execution du fichier 
                        ;;
                      s)
                        fichier $OPTARG; #appel de la fonction et passage en paramètre de l'argument
                         ;;
                      o)affichfich $OPTARG ; #appel de la fonction et passage en paramètre de l'argument de l'option
                        ;;
                       f)
                        recherche $2 $4 ; #appel de la fonction et passage en paramètre des deux arguments des options 
                       ;;
                       \?) echo "option invalide -$OPTARG" 
                            ;; #message d'erreur pour les options invalides
                       :)
                        echo "Option -$OPTARG demande un argument."
                       ;; #message d'erreur pour les options à argument obligatoire
              esac   

      done

      exit 0

