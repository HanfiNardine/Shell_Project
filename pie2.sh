output=pie2.plt #configuration de l'output à travers un fichier .plt
data=data.csv #affectation des données à la variable data

gnuplot --persist -e "datafiles='${data}'; outputname='${output}'" pie2.plt
