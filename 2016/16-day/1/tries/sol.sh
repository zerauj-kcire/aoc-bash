#!/bin/bash

MAX=200;

function fill(){
	reversed=$(echo $input | sed "s/./& /g" | tac -s" " | tr -d " \n");
	n=$(echo -n $input | wc -m);
	ones=$(for _ in $(seq $n); do echo -n 1;done);

	echo "ONES-REVERSED: $ones-$reversed";
	complement=$(echo "ibase=2;obase=2;$ones-$reversed" | tr -d "\ " | bc);
	m=$(echo -n $complement | wc -m);
	zeros=$(for _ in $(seq $((n-m+1)) ); do echo -n 0;done);
	# echo $n $m $zeros
	output="$input$zeros$complement";
	echo "INPUT:" $input.
	echo "COMPLEMENT:" $complement.
	echo "OUPUT:" $output.
	echo "wc -m:" $(echo $output | wc -m);
}

# input=$(cat input.txt | tr -d "\n");
input="10000";
output="";

while [ $(echo $output | wc -m) -le $MAX ]; do
	fill;
	input=$output;
done
