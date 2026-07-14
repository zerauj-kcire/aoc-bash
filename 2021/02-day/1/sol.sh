#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

grep "forward" $input | cut -d" " -f2 > out/xpos;
grep -v "forward" $input | sed "s/up /-/g;s/down /+/g" > out/hpos;

hpos=$(echo "0$(cat out/hpos | tr -d "\n")" | bc);
xpos=$(echo "$(cat out/xpos | tr "\n" "+")0" | bc);
echo $((hpos*xpos)) | numfmt --grouping;
