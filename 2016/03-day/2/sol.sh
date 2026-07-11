#!/bin/bash

rm -r out;
mkdir out/;

num=$(head -1 input.txt | wc -w);

sed -i "s/\s\+/ /g;s/^\s//g" input.txt;

for i in $(seq $num); do
	cut -d" " -f$i input.txt > out/col$i.txt;
done

cat out/col*.txt > out/total.txt;
cat out/total.txt | paste - - - > out/final.txt;
awk '{ print ( ($1 + $2 > $3) && ($2 + $3 > $1) && ($1 + $3 > $2) ? "1" : "0" ) }' out/final.txt > out/01.txt;
grep -o "1" out/01.txt | wc -l > ans.txt;
