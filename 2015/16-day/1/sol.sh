#!/bin/bash

mkdir -p out/;

cat > out/mfcsam.txt << EOF
children: 3
cats: 7
samoyeds: 2
pomeranians: 3
akitas: 0
vizslas: 0
goldfish: 5
trees: 3
cars: 2
perfumes: 1
EOF

cut -d' ' -f1 --complement input.txt > out/new-input.txt;

num=$(wc -l --total=only out/mfcsam.txt);
for i in $(seq $num); do
	line=$(head -n+$i out/mfcsam.txt | tail -1);
	# echo "$line";
	grep -v "perfumes: 10" out/new-input.txt | grep --color=auto "$line" >> out/one-req.txt;
done

sort -n out/one-req.txt | cut -d' ' -f1 > out/numbers.txt;
grep -E -o -z "(.*)[[:space:]]\1[[:space:]]\1" out/numbers.txt | uniq;
