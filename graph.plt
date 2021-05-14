reset
set title "SYSTEM USAGE" 
set xlabel "PROCESS ID"
set ylabel "CPU% - MEM%"
set grid 
plot "result.txt" using (column(0)):2:xtic(1) with lines title "%CPU","result.txt" using (column(0)):3:xtic(1) with lines title "","result.txt" using (column(0)):3:xtic(1) with lines title "%MEM"
