#!/bin/bash

# for i in {1..3}; do
	# cut -dx input.txt -f$i > out/col$i.txt;
# done

nbox=$(wc -l --total=only input.txt);

for i in $(seq $nbox); do
	a=$(head -n+$i out/col1.txt | tail -1);
	b=$(head -n+$i out/col2.txt | tail -1);
	c=$(head -n+$i out/col3.txt | tail -1);
	echo -e $a "\n" $b "\n" $c | tr -d ' ' | sort -n -r | tail -2 | sed 'p' | tr '\n' '+' >> out/min.txt
	echo "" >> out/min.txt;
	echo "$a*$b*$c+" >> out/min.txt;
	echo $i;
done

num=0
for line in $(seq $(( 2*$nbox)) ); do
	exp=$(head -n+$line out/min.txt | tail -1);
	num=$(( $num + $exp "0" ));
	echo $num;
done
# 3737498
