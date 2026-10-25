#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/updates;

input="input.txt";
# input="try";

csplit --suppress-matched $input '/^$/' {*} -f out/x -n 1;
mv out/x0 out/r; mv out/x1 out/u;

num=$(wc -l out/u --total=only);
cd out/updates/;mkdir $(seq $num); cd ../..;

nl=0;
for line in $(cat out/u); do
	nl=$((nl+1));
	echo $line | tr "," "\n" > out/updates/$nl/instr;
	for num in $(cat out/updates/$nl/instr); do
		grep "$num" out/r > out/updates/$nl/local-rules;
	done
	echo "done $nl";
done

# rm -r out;
