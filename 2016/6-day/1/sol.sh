#!/bin/bash

mkdir -p out/;

n=$(head -1 input.txt | tr -d "\n" | wc -m);

for i in $(seq $n); do
	cut -c$i input.txt | sort | uniq -c | sort -n | tail -1 | tr " " "\n" | tail -1 >> out/passwd.txt;
done

cat out/passwd.txt | tr -d "\n" > out/ans.txt;
