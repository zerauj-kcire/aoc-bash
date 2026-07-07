#!/bin/bash

rm -r out;
mkdir -p out;

function invert(){
	list=$(sort -r $list);
}

# gernetate the list of 255 numbers.
N=255;
seq 0 $N > out/list;
stepsize=0;

# try:
idx=0;
echo -e "$list\n$list" | tail -$((5+idx)) | head -3 | sort -r | cat - <(echo $list | tail -2);
