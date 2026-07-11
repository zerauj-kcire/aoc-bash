#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

fold -w 25 input.txt | split - -l 6 -d -a 2 out/f;

mkdir out/dm;
for file in out/f*;do
	echo $(grep -o "0" $file | wc -l) " : " $file >> out/dm/stats;
done

minfile=$(sort -n out/dm/stats | head -1 | cut -d " " -f5);
ones=$(grep -o "1" $minfile | wc -l);
twos=$(grep -o "2" $minfile | wc -l);

echo "$ones x $twos = " $(expr "$ones" "*" "$twos");

