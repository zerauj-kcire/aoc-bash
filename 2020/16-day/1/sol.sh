#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";
csplit -s --suppress-matched $input '/^$/' {*} -f out/x -n 1;
cut -d":" -f2 out/x0 | sed "s/or/\n/g;" | cut -c1 --complement > out/cond;
cut -d"-" out/cond -f1 > out/c1;
cut -d"-" out/cond -f2 > out/c2;
rm out/cond;

numcond=$(wc -l out/c1 --total=only);
grep -v ":" out/x1 | tr "," "\n" > out/mytick;
grep -v ":" out/x2 | tr "," "\n" > out/neartick;
rm out/x*;

MIN=$(sort -n out/c1 | head -1 out/c1);
MAX=$(sort -rn out/c2 | head -1);
# echo $MIN $MAX;
for num in $(cat out/neartick); do
	[ $num -le $MIN ] || [ $num -ge $MAX ] && echo $num && echo $num >> out/results;
done
echo "FINAL SUM:";
echo "$(cat out/results | tr "\n" "+")0" | bc;
# the for loop has to be done by the neartick, not on the conditions.
