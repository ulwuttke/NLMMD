set terminal windows monochrome size 520,520#windows terminal für Windows-Nutzer
#=====  Vorgaben/Variablen =======
Datei='export_mod.col' # Ergebnisdatei
F=1000.

#====== Ergebnisdarstellung ======
set xrange[0.:1.*F]
set yrange[-100.:500.]

# Achsenbeschriftung Kraft Weg
set ylabel 'w bzw. u in mm' #x-achse bezeichnen
set xlabel 'Kraft F in N' #y-achse bezeichnen

# Positon Legende
set key left top

# Darstellung der Ergebnisse
plot Datei using ($1*F):(-$2) title 'ein Element w' with lines lw 2 lc -1 dt '..',\
Datei using ($1*F):(-$3) title 'mehrere Elemente w' with lines lw 2 lc -1 dt '-',\
Datei using ($1*F):($4) title 'ein Element u' with lines lw 1 lc -1 dt '..',\
Datei using ($1*F):($5) title 'mehrere Elemente u' with lines lw 1 lc -1 dt '-'
#,\
#x*425/1000 title 'linear' lw 1 lc -1 dt '. .'
