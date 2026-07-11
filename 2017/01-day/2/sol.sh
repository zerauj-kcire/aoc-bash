#!/bin/bash

rm -r out/;
mkdir -p out/;

max=$(wc -m --total=only input.txt);
max=$((max - 1));
half=$((max/2));
# echo $half;

head -c$half input.txt > out/digits1.txt;
tail -c$((half +1)) input.txt > out/digits2.txt;

sed -i "s/./&\n/g" out/digits1.txt;
sed -i "s/./&\n/g" out/digits2.txt;

paste -d" " out/digits* | grep "\(.\) \1" | cut -c1 > out/final.txt;
awk " { sum+=\$1 } END {print 2*sum} " out/final.txt;

# Command for checking the separation.
# diff -y <(cat out/digits*) input.txt;
# diff -q <(cat out/digits*) input.txt;
# grep 929 input.txt;

