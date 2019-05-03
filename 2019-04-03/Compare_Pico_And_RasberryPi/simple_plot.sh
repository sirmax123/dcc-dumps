#!/usr/bin/env gnuplot  -persist

set terminal png  size 2600,800
set output "IdlePackets.png"

set title "Idle packets"

set nokey
set key top left
set key box


set xlabel "Time"
set ylabel "V"
set xrange [0:25]
set ytics 
set y2tics 
set xtics 5

offset0=-50
offset1=-275

# To convert 200uSec step to secons need to
# Time_Seconds     =  LineNumber * 200/1000000 ( ~0.8 sec   for all lines)
# Time_MiliSeconds =  LineNumber * 200/10000   ( ~800 ms    for all lines)
# Time_NanoSeconds =  LineNumber * 200/1       ( ~800000 ns for all lines)

plot \
"./Pico/FILE001.XML.txt"        using (($1-1+offset0)*5/100) :2        with lines  title "Voltage, Pico", \
"./RasberryPy/FILE005.XML.txt"  using (($1-1+offset1)*5/100) :2        with lines  lw 2 title "Voltage, RasberryPi"



