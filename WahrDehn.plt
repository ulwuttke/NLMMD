set terminal qt enhanced
set encoding utf8

eps(x)=log(1+x)
e(x)=x
est(x)=x/(1+x)

set xrange [-1.1:2]
set yrange [-3:2]
set xzeroaxis 
set yzeroaxis 
set key right bottom


set xlabel "e"
set ylabel "e; e^{*}; {/Symbol e}"

plot e(x) title 'e  ', est(x) title'e^{*}', eps(x) title '{/Symbol e}  ' 


set terminal pngcairo size 520,520 enhanced
set output "Dehnungen.png"
plot e(x) title 'e  ', est(x) title'e^{*}', eps(x) title '{/Symbol e}  ' 
