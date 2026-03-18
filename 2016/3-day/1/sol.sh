#!/bin/bash

rm -r out/;
mkdir -p out/;

awk '{ print ( ($1 + $2 > $3) && ($1 + $3 > $2) && ($2 + $3 > $1) ? "1" : "0" ) }' input.txt > out/01.txt;
grep -o "1" out/01.txt | wc -l > ans.txt;
