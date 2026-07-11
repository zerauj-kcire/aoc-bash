#!/bin/bash

# mkdir -p out/;

# grep "\(\^\?.\+\)\s\1\s" input.txt 
# 11
# grep "\(\^\?[a-z]\+\)\s\([a-z]\s\)*\1\s" input.txt 
# 11
# grep "\([a-z]\+\)\s\([a-z]\+\s\)*\1" input.txt
# not the answer

grep "[^a-z]\([a-z]\+\)\s\([a-z]\+\s\)*\1" input.txt
# 29

grep "^\([a-z]\+\)\s\([a-z]\+\s\)*\1" input.txt
# 18
# combined are 35.
# or the most elegant one:

grep -v "\b\(\w\+\)\b.*\b\1\b" input.txt | wc -l;
