#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/{rls,strs};

# we should use the grep command:
# echo -e "aaa\nbba\nadc\nttt" | grep "aa\|bb";

# input="input.txt"
input="try"
csplit -s --suppress-matched $input '/^$/' {*} -f out/x -n 1;
grep "\"" out/x0 > out/rls/lettrs;
grep -v "\"" out/x0 > out/rls/rules;

# fucking recursion.
# each of the desition of XX \| YY it increases the number of cases in a 
# power of 2. So we are going to have 2^n possible strings if n is the number
# of rules.
