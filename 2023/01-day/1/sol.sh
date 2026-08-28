#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

cat $input | tr -d "a-z" | sed "s/^\(.\).*\(.\)$/\1\2/g;s/^\(.\)$/\1\1/g" > out/digits;

gawk '{sum+=$1} END {print sum}' out/digits | numfmt --grouping;

# rm -r out;
