#!/bin/bash

mkdir -p out/;

# for i in $(seq 1000); do
	# echo -n "o" >> out/line.txt;
# done
# 
# for i in $(seq 1000); do
	# cat out/line.txt >> out/grid.txt;
	# echo "" >> out/grid.txt;
# done
# 
# sed 's/turn off/turn_off/g' input.txt >> out/input.cols.txt;
# sed -i 's/turn on/turn_on/g' out/input.cols.txt;
# 
# cut -d' ' -f2 out/input.cols.txt >> out/first.point.txt;
# cut -d' ' -f4 out/first.point.txt >> out/second.point.txt;
cut -d' ' -f1 out/input.cols.txt >> out/instr.txt;

for i in $(seq $(wc -t --total=only input.txt)); do
done

