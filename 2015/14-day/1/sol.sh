#!/bin/bash

mkdir -p out/;

cut -d' ' -f1  input.txt > out/name.txt;
cut -d' ' -f4  input.txt > out/kmss.txt;
cut -d' ' -f7  input.txt > out/secs.txt;
cut -d' ' -f14 input.txt > out/rest.txt;

secs_race=2503;
num=$(wc -l --total=only input.txt);

for i in $(seq $num); do
	name=$(head -n+$i out/name.txt | tail -1);
	kmss=$(head -n+$i out/kmss.txt | tail -1);
	secs=$(head -n+$i out/secs.txt | tail -1);
	rest=$(head -n+$i out/rest.txt | tail -1);
	cycle=$(( secs + rest ));
	pushups=$(( secs_race / cycle ));
	length_of_cycle=$(( kmss * secs ));
	total=$(( pushups * length_of_cycle));
	residual=$(( secs_race % cycle ));
	[ $residual -le $secs ] && total=$((total + residual*kmss));
	echo "$total km : $name." >> out/final.lengths.txt;
done
sort out/final.lengths.txt;
# sort out/final.lengths.txt | tail -1 | cut -d' ' -f1 > ans.txt;
