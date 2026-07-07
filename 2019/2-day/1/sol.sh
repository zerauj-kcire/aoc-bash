#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

mkdir out/cols;

function explicit() {
	cat $input; | tr "," "\n" | paste -d " " - - - - \
		| sed "s/^99 \(.\+\$\)/99\n\1/g" > out/inst;

	length=$(wc -l out/inst --total=only);
	cat <(head -$((length-2)) out/inst) <(tail -2 out/inst | tr "\n" " ") > out/final;

	cut -d" " out/final -f1 > out/col/1-col;
	cut -d" " out/final -f2,3 > out/col/2-3-col;
	cut -d" " out/final -f4 > out/col/4-col;

} 

# you can always recover the file from the cols by:
# paste -d " " out/*-col | sed "s/99 99 99 99/99/g";

# lets iterate the process along all the file
# and upgrading it each time 
cp input.txt out/inp;

input=out/inp;

