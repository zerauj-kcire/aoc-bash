#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

max=$(wc -l --total=only input.txt);

for i in $(seq $max); do
	head -$i input.txt | tail -1 > out/$i;
done

N=0;M=0;
for n in $(seq $max); do
	input_n=$(cat out/$n);
	for m in $(seq $n $max); do
		input_m=$(cat out/$m);
		sum=$(echo "$input_n + $input_m" | bc);
		echo "SUM is: $sum";
		[ $sum -eq 2020 ] && echo "out/$n + out/$m = $input_n + $input_m = 2020;" && N=$n && M=$m && break 2;
	done
done

prod=$(echo "$(cat out/$N) * $(cat out/$M)" | bc);
echo "out/$N * out/$M = $(cat out/$N) * $(cat out/$M) = $prod";
