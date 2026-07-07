#!/bin/bash

function inc(){
	local num=$(echo $line | cut -d" " -f2);

}

[ -d out ] && rm -r out;
mkdir out;

# input="input.txt";
input="try";


