#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/;

for line in $(cat input.txt); do
	expr $line / 3 >> out/d3;
done

for line in $(cat out/d3); do
	expr $line - 2 >> out/m2;
done

sum=0;
for line in $(cat out/m2); do
	sum=$(( sum + line ));
done
echo "SUM: " $(echo $sum | numfmt --grouping);
