#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";
sminute=$(head -1 $input); 
mult=$(tail -1 $input | tr -d "x" | tr "," " ");
# echo $mult;
minmult=$(echo $mult | tr " " "\n" | sort -n | head -1);

for i in $(seq $sminute $((sminute+minmult)) ); do
	factor $i >> out/mults;
done

for bus in $mult; do
	echo $(grep "\<$bus\>" out/mults)":"$bus >> out/gapp;
done

grep -v "^:" out/gapp | sort -n | head -1 > out/minute;
fminute=$(cut -d":" -f1 out/minute);
fmult=$(cut -d":" -f3 out/minute);
echo "FINAL RESULT: ($fminute - $sminute) * $fmult = " $(( (fminute - sminute) * fmult ));
