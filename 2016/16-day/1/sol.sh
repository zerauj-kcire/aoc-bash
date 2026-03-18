#!/bin/bash

MAX=272;

function fill(){
	reversed=$(echo $input | sed "s/./& /g" | tac -s" " | tr -d " \n");
	n=$(echo -n $input | wc -m);
	ones=$(for _ in $(seq $n); do echo -n 1;done);

	complement=$(echo "ibase=2;obase=2;$ones-$reversed" | bc);
	complement=$(echo $complement | tr -d "\\\\ "); # cleaning due to the abuse of bc
	m=$(echo -n $complement | wc -m);
	zeros=$(for _ in $(seq $((n-m+1)) ); do echo -n 0;done);
	# echo $n $m $zeros
	output="$input$zeros$complement";
	echo "INPUT:" $input.
	# echo "COMPLEMENT:" $complement.
	echo "OUPUT:" $output.
	echo "wc -m:" $(echo $output | wc -m);
}

function mysum(){
	local sum=0;
}

function bor(){
	[ "$a" -eq "0" ]; testa=$?;
	[ "$b" -eq "0" ]; testa=$?;
	echo $testa $testb;
	# bit=1;
	# if [ $testa -ne $testb ]; then
		# bit=0;
	# fi
	# echo $bit;
}

# input=$(cat input.txt | tr -d "\n");
input="10000";
output="";

# while [ $(echo $output | wc -m) -le $MAX ]; do
	# fill;
	# input=$output;
# done

truncated=$(echo $output | head -c$MAX);
# echo "TRUNC:" $truncated;

echo "BORES:" 
a=0;b=0;
bor;
a=1;b=1;
bor;
a=0;b=1;
bor;
