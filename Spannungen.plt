set terminal qt enhanced
set encoding utf8


E=1
A0=1

P(x)=E*x
sig(x)=P(x)*(exp(x)-1)*(1+x)

set xrange [-1.1:2]
set yrange [-3:2]
set xzeroaxis 
set yzeroaxis 
set key right bottom


set xlabel "e"
set ylabel "e; e^{*}; {/Symbol e}"

plot P(x) title 'P - e  ', sig(x) title '{/Symbol s} - {/Symbol e}  ' 


set terminal pngcairo size 520,520 enhanced
set output "Dehnungen.png"
plot e(x) title 'e  ', est(x) title'e^{*}', eps(x) title '{/Symbol e}  ' 
