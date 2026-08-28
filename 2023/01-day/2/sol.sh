#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

sed "s/oneight/1/g;s/twone/2/g;s/threeight/3/g;s/fiveight/5/g;s/sevenine/7/g;s/eightwo/8/g;s/eighthree/8/g;s/nineight/9/g;" $input > out/leftsubs;
sed "s/twone/1/g;s/eightwo/2/g;s/eighthree/3/g;s/oneight/8/g;s/threeight/8/g;s/fiveight/8/g;s/nineight/8/g;s/sevenine/9/g;" $input > out/rightsubs;

paste -d "\0" out/leftsubs out/rightsubs > out/pclean;

sed "s/one/1/g;s/two/2/g;s/three/3/g;s/four/4/g;s/five/5/g;s/six/6/g;s/seven/7/g;s/eight/8/g;s/nine/9/g;" out/pclean > out/clean

cat out/clean | tr -d "a-z" | sed "s/^\(.\).*\(.\)$/\1\2/g;s/^\(.\)$/\1\1/g" > out/digits;

gawk '{sum+=$1} END {print sum}' out/digits | numfmt --grouping;

# rm -r out;
