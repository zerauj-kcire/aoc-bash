#!/bin/bash

# setting the working directory;
[ -d out ] && rm -r out;
mkdir -p out;

# cleaning up the input;
sed "s/\[\|\]\|,\|Before: \|After:  //g" input.txt > out/cleaninput;

# separating each example;
mkdir out/examples;
csplit --suppress-matched out/cleaninput "/^$/" "{*}" -f out/examples/f;

# get the registers, operations and results of the examples;
mkdir out/iosep;
echo "GENERATING INPUT-OUTPUT SEPARATION ...";
for file in $(ls -v out/examples); do
	head -1 out/examples/$file >> out/iosep/reg;
	head -2 out/examples/$file | tail -1 >> out/iosep/op;
	tail -1 out/examples/$file >> out/iosep/res;
done

cut -d" " -f1 --complement out/iosep/op > out/iosep/blindop;

# loading the functions.
# . ./funct.sh;

numexam=$(wc -l out/iosep/blindop --total=only);
for i in $(seq numexam); do
	input=$(head -$i out/iosep/reg | tail -1);
	opert=$(head -$i out/iosep/op  | tail -1);
	resul=$(head -$i out/iosep/res | tail -1);
	# something like this should work (if the funtcion is properly defined).
	# [ $resul -eq $(addr $input $opert) ] && echo "$i: SUCCESS - ADDR";
	# [ $resul -eq $(addi $input $opert) ] && echo "$i: SUCCESS - ADDI";

	# addr;
	# addi;
	# mulr;
	# muli;
	# banr;
	# bani;
	# borr;
	# bori;
	# setr;
	# seti;
	# gtir;
	# gtri;
	# gtrr;
	# eqir;
	# eqri;
	# eqrr;
done


# define every function on the statement
# it is better to define the operations by columns, with awk.
# for that, we get every register lines.
