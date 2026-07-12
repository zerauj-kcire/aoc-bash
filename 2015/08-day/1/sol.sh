#!/bin/bash

mkdir -p out/;

a=$(wc -m --total=only input.txt);

sed 's/^"//' input.txt | sed 's/"$//' > out/no-quotes.txt;
b=$(for line in $(cat out/no-quotes.txt); do printf "$line\n"; done | wc -m);
echo $a $b $((a-b));
# printf "$(cat out/no-quotes.txt)" >> out/clean.file.in;
# b=$(wc -m --total=only out/clean.file.in);
# echo $a $b $((a-b));
#
# one should be able to use the printf command
# or the print command, to manipulate the ascii characters by their representation
# currently, i have no time to see the info pages about it.
