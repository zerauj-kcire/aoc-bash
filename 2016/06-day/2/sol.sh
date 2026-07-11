#!/bin/bash

mkdir -p out/;

length=$(head -1 input.txt | tr -d "\n" | wc -m);

for i in $(seq $length); do
	cut -c$i input.txt | sort | uniq -c | sort -n | head -1 | tail -c 2 >> out/pswd.txt;
done

cat out/pswd.txt | tr -d "\n" > out/final.txt;
