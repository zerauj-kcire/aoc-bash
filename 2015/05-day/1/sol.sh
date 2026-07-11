#!/bin/bash

mkdir -p out/;

# grep -G '\(a\|e\|i\|o\|u\).*\(a\|e\|i\|o\|u\).*\(a\|e\|i\|o\|u\)' input.txt
# grep -G '[aeiou].*[aeiou].*[aeiou]' input.txt
# grep -G '\([aeiou].*\)\{3}' input.txt
# grep -G '\([aeiou].*\)\{3}' input.txt | grep '\([a-z]\)\1'
grep -G '\([aeiou].*\)\{3\}' input.txt | grep '\(.\)\1' | grep -v 'ab' | grep -v 'cd' | grep -v 'pq' | grep -v 'xy' >> out/nice.txt
wc -l out/nice.txt;
# 238
