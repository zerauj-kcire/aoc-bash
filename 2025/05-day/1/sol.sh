#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;
echo "*" > out/.gitignore;

input="input.txt";
# input="try";

csplit -q --suppress-matched $input '/^$/' {*} -f out/x -n 1;
mv out/x0 out/ranges;
mv out/x1 out/values;

for line in $(cat out/ranges); do
	range=$(echo $line | tr "-" " ");
	seq $(echo $range) >> out/list;
done

count=0;
for v in $(cat out/values); do
	grep -q "^$v$" out/list && count=$((count+1)) && echo "found";
done

echo "$count" | numfmt --grouping;

# performance issue :c

# rm -r out;
