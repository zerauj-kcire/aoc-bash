#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;
echo "*" > out/.gitignore;

input="input.txt";

grep "\([aeiou].*\)\{3\}" $input | grep ".*\(.\)\1.*" \
	| grep -v "ab" | grep -v "cd" | grep -v "pq" | grep -v "xy" \
	> out/results;

wc -l out/results;

# SOLVED
