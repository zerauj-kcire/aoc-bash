#!/bin/bash

# rm -r out/;
# mkdir out/;

cat input.txt <(head -c1 input.txt)  \
	| tr -d "\n"  \
	| grep -E -o "(.)\1{1,}" \
	| cut -c1 --complement  \
	| sed "s/./&\n/g;s/\n/+0+/g"  \
	| tr -d "\n"  \
	| rev \
	| cut -c1 --complement  \
	| rev  \
	| bc;
