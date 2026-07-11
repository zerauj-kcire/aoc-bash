#!/bin/bash

function inc() {
	local snum=$(echo $line | cut -d" " -f2);
	local sign=$(echo $snum | cut -c1);
	local num=$(echo $snum | cut -c1 --complement);
	[ $sign == "+" ] && sum=$((sum+num)) || sum=$((sum-num));
}

[ -d out ] && rm -r out;
mkdir out;

# input="input.txt";
input="try";

# while 
# done

# OLDIFS=$IFS;
# IFS="\n";
# for line in $input; do
# 
# done
# IFS=$OLDIFS;
