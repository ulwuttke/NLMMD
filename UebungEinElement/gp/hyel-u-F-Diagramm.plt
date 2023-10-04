set terminal windows monochrome size 520,520#windows terminal für Windows-Nutzer
#=====  Vorgaben/Variablen =======
Datei='export_modHyEl.col' # Ergebnisdatei
faktor=1000.

#====== Ergebnisdarstellung ======
set xrange[0.:120.]
set yrange[-100.:1300.]

# Achsenbeschriftung Kraft Weg
set xlabel 'Verformung u in mm' #x-achse bezeichnen
set ylabel 'Kraft F_y in kN' #y-achse bezeichnen

# Positon Legende
set key left top

# Darstellung der Ergebnisse
plot Datei using ($2):($3/faktor) title 'Lasteinleitungsknoten' with linespoints lw 2 lc -1 dt '_'
#Datei using ($1*F):(-$3) title 'mehrere Elemente w' with lines lw 2 lc -1 dt '-',\
#Datei using ($1*F):($4) title 'ein Element u' with lines lw 1 lc -1 dt '..',\
#Datei using ($1*F):($5) title 'mehrere Elemente u' with lines lw 1 lc -1 dt '-'
#,\
#x*425/1000 title 'linear' lw 1 lc -1 dt '. .'
