#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

cat $input | tr ",-" " " > out/clean;

# lets use gawk to start learning from it.
# the place where i found it is:
# info gawk /Regular Expresions as Patterns

# first try
# gawk '$1 <= $3 && $2 >= $4 { print $1, $2, $3, $4 }' out/clean >> out/subs;
# gawk '$1 >= $3 && $2 <= $4 { print $1, $2, $3, $4 }' out/clean >> out/subs;
# sort -u out/subs | uniq -u | grep -v "\(\<\w\+\>\) \(\<\w\+\>\) \1 \2" | wc -l;

# second try
gawk '$1 < $3 && $4 <= $2 { print $0 }' out/clean >> out/subs;
gawk '$1 <= $3 && $4 < $2 { print $0 }' out/clean >> out/subs;
gawk '$3 <= $1 && $2 < $4 { print $0 }' out/clean >> out/subs;
gawk '$3 < $1 && $2 <= $4 { print $0 }' out/clean >> out/subs;
sort -u out/subs | uniq | wc -l;

# rm -r out;
