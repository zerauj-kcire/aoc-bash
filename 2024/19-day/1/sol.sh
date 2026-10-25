#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

# input="input.txt";
input="try";

head -1 $input | tr -d " " | tr "," "\n" > out/words;
tail -n+3 $input > out/chains;



# rm -r out;
