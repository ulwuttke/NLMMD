set terminal windows monochrome size 520,520#windows terminal für Windows-Nutzer
#=====  Vorgaben/Variablen =======
Datei='export_mod.col' # Ergebnisdatei

#====== Ergebnisdarstellung ======
set xrange[0.:500.]
set yrange[0.:100.]

# Achsenbeschriftung Kraft Weg
set ylabel 'w in mm' #x-achse bezeichnen
set xlabel '-u in mm' #y-achse bezeichnen

# Positon Legende
set key left top

# Darstellung der Ergebnisse
plot Datei using (-$2):(-$4) title 'ein Element w' with lines lw 2 lc -1 dt '..',\
Datei using (-$3):(-$5) title 'mehrere Elemente w' with lines lw 2 lc -1 dt '-',\
1000-(1000**2-(x)**2)**0.5 title 'linear' lw 1 lc -1 dt '...'
