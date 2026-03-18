#!/bin/bash

mkdir -p out/;

# the tr / command is for the input of sed "s///g".
head -43 input.txt | cut -d' ' -f1,3 | tr " " "/" | sort -u > out/rules.txt;
cut -d/ out/rules.txt -f1 | sort -u | uniq -u > out/changes.txt;
tail -1 input.txt  > out/string.txt;

for line in $(cat out/changes.txt); do
	n=$(grep -o "$line" out/string.txt | wc -l);
	m=$(grep -o "^$line" out/rules.txt | wc -l);
	search=$(for _ in $(seq $n); do echo -n "/^$line/p;";done);
	paste -d"/" <(sed -n "$search" out/rules.txt) <(for _ in $(seq $m); do seq $n;done);
done > out/subs.txt;

for rule in $(cat out/subs.txt); do
	sed "s/$rule" out/string.txt >> out/molecules.txt;
done

sort -u out/molecules.txt | uniq -u | wc -l > ans.txt;
