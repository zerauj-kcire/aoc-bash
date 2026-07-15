#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

cols=$(wc -L $input --total=only);
rows=$(wc -l $input --total=only);

# mid is the number just above the average;
mid=$((rows/2+1));

# echo "MID: " $mid;
for i in $(seq $cols); do
	cut -c$i $input | sort -n | head -$mid | tail -1 >> out/mostcom;
done
# head out/*;

gamma=$(echo "ibase=2;$(cat out/mostcom | tr -d "\n");obase=10" | bc);
total=$(echo "2 ^ $cols - 1" | bc);
epsilon=$((total - gamma));
# echo $gamma $total $epsilon;
echo "RESULT:";
echo $((gamma*epsilon)) | numfmt --grouping;
