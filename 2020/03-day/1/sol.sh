#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/secf/;

input="input.txt";

cols=$(wc -L $input --total=only);
rows=$(wc -l $input --total=only);
num_repeats=$((3*rows/cols+1));
paste -d"\0" $(for _ in $(seq $num_repeats); do echo -n " $input"; done) > out/newin;

for i in $(seq $rows); do
	tail -$((rows-i)) out/newin | head -1 | cut -c1-$((3*i)) --complement > out/secf/$i;
done

cat out/secf/* > out/final;
cut -c1 out/final | grep -c "#";
