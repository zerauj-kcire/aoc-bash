#!/bin/bash

rm -r out/;
mkdir -p out/;
grep -v "\[[a-z]*\(.\)\(.\)\2\1[a-z]*\]" input.txt | grep "\(.\)\(.\)\2\1" | grep -v "\(.\)\1\1\1" > out/refined.txt;
wc -l out/refined.txt > out/ans.txt;

cat out/ans.txt;
cat out/ans.txt | wl-copy;
read new;
