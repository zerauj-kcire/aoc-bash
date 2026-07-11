#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/grps;

input="input.txt";
# input="try";
csplit -s $input --suppress-matched '/^$/' '{*}' -f out/grps/g -n 3;

for file in out/grps/*; do
	sed "s/./&\n/g" $file | sort -u | uniq -u | sed "/^$/d" | wc -l>> out/results;
done
echo "$(cat out/results | tr "\n" "+")0" | bc;
