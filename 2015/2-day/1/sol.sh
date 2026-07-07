#!/bin/bash

mkdir -p out/

##### # alternate:
##### # sed 's/\([[:digit:]]\+\)x\([[:digit:]]\+\)x\([[:digit:]]\+\)/2*\1*\2+2*\2*\3+2*\1*\3/' input.txt > out/first.op.txt;

sed 's/\([0-9]\+\)x\([0-9]\+\)x\([0-9]\+\)/2*\1*\2+2*\2*\3+2*\1*\3/' input.txt > out/first.op.txt;
for i in {1..3}; do
	cut -dx input.txt -f$i > out/col$i.txt;
done;

nbox=$(wc -l --total=only input.txt);

for i in $(seq $nbox); do
	a=$(head -n+$i out/col1.txt | tail -1);
	b=$(head -n+$i out/col2.txt | tail -1);
	c=$(head -n+$i out/col3.txt | tail -1);
	echo -n -e $a "\n" $b "\n" $c | sort -n | head -2 | tr -d ' ' | tr '\n' '*' | sed 's/*$//' >> out/min.txt;
	echo "done $i";
	echo "" >> out/min.txt;
done;

touch out/pasted.txt;
paste --delimiter='+' out/first.op.txt out/min.txt > out/pasted.txt;

# fljsdakfñlsajfñal ñjñlkj añ lkja ñlakfj añlk jañ lkajañl
sum=0;
for i in $(seq $nbox); do
	exp=$(head -n+$i out/pasted.txt | tail -n 1);
	# echo $(( $exp ));
	sum=$(( $sum + $exp ));
	echo $sum;
done
echo "solucion: " $sum;
# 1586300 
