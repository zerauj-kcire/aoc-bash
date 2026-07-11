#!/bin/bash

# mining...

input=$(cat input.in);
length=2 # lenght of zeroes

string=$(for i in $(seq $length); do echo -n "0";done);
echo $string;

steps=$1; # number of steps to prove.

fin=0;
for i in $(seq $steps); do
	id=$(echo -n "$input$i" | md5sum | cut -c1-$length); 
	echo $i " : " $id;
	if [ $id == $string ]; then
		fin=$i;
		echo "TERMINATE." && break;
	fi;
done;
echo "TERMINATE AT:" $fin;
echo "SOLUTION: ";
echo -n "$input$fin" | md5sum;
# 
