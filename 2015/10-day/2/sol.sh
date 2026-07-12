#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.in";
N=50;
# input="try";
# N=5;

cp $input out/1;
for i in $(seq $N); do
	cat out/$i | sed "s/./&\n/g" | uniq -c | tr -d " \t" | sed '/^1$\|^$/d' | tr -d "\n" > out/$((i+1));
done
# head out/*;
wc -c out/$((N+1)) --total=only | numfmt --grouping;
