#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out;

info sed | grep LOWER | head -1 | grep -o "[a-z]" > out/alflower
info sed | grep UPPER | head -1 | cut -d"'" -f2 |grep -o "[A-Z]" > out/alfupper;
paste -d"\\\\" out/alflower out/alfupper | sed "s/\\\\/&|/" > out/combined;

# cat out/combined;

mkdir -p out/removed;
for lts in $(cat out/combined); do
	sed "s/${lts}//g" input.txt > out/removed/${lts:0:1};
done

touch out/final;
for file in out/removed/*; do
	bash reduce.sh $file;
done
echo "LETTERS:"
cat out/final;
echo "ANS:";
sort -n final | head -1;
