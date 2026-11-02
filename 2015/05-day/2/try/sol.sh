#!/bin/bash

mkdir -p out/;

grep -G '\(.\)\(.\).*\(.\).\3.*\1\2' input.txt > out/1.txt;
grep -G '\(.\)\(.\).*..*\1\2' input.txt > out/2.txt;
cat out/1.txt out/2.txt | sort | uniq | wc -l

# it can be matched:
# xabxcdcxabx
# xabxcdcabx
# xabcdcxabx
# xabxcxabx
# xabxcabx
# xabcxabx
# xabcabx
