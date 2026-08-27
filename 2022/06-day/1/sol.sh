#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="tries/0";
# input="tries/1";
# input="tries/2";
# input="tries/3";
# input="tries/4";

n=$(wc -m $input --total=only);
max=$((n - 4));

cat $input | tr -d "\n" | sed "s/./&\n/g" > out/sep;

index=0;
for i in $(seq $max); do
	tail -$((n-i)) out/sep | head -4 > out/$i;
	[ $(sort out/$i | uniq -c | tr -d " " | sort -nr | head -c1) -eq 1 ] && index=$i && break;
done
echo $((index + 3));

# rm -r out;
