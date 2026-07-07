#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

max=$(wc -l --total=only input.txt);

for i in $(seq $max); do
	head -$i input.txt | tail -1 > out/$i;
done

N=0;M=0;
for n in $(seq $max); do
	echo "n: $n"
	input_n=$(cat out/$n);
	for m in $(seq $n $max); do
		input_m=$(cat out/$m);
		echo "m:  $m"
		for k in $(seq $m $max); do
			input_k=$(cat out/$k);
			sum=$((input_n + input_m + input_k));
			# echo "SUM is: $sum";
			[ $sum -eq 2020 ] && echo "out/$n + out/$m + out/$k = $input_n + $input_m + $input_k = 2020;" && N=$n && M=$m && K=$k && break 3;
		done
	done
done

prod=$(echo "$(cat out/$N) * $(cat out/$M) * $(cat out/$K)" | bc);
echo "out/$N * out/$M = $(cat out/$N) * $(cat out/$M) * $(cat out/$K) = $prod";
