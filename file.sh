#zenity --info --title="CPU  USAGE" --text="CLick on process to continue" --ok-label="Proces"  #un petit test de l'outil zenity (similaire à yad) 
 #ps -aeF |  sort -k 4 | awk '{print $2 " " $4 }' | tail -10 >result.txt
 #données par rapport seulement à %CPU et PID
 ps -eo pid,pcpu,pmem | awk '{print $1 " " $2 " " $3 }' | sort -rnk 2 |tail +2| head -7 >result.txt #découpage/extraction des données liées à %CPU ,%MEM,PID . 
output=graph.plt #configuration de l'output à travers un fichier .plt
data=result.txt #affectation des données à la variable data

gnuplot --persist -e "datafiles='${data}'; outputname='${output}'" graph.plt
