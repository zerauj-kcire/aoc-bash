#!/bin/bash

mkdir -p out/;

# preparing the file to be readed to capture a square 3x3 
# for each of its characters.
cat <(for i in {1..100}; do echo -n " ";done) <(echo "") input.txt <(for i in {1..100}; do echo -n " ";done) > out/in1.txt;
paste -d" " - out/in1.txt - < <(echo "") > out/newin.txt;

function rectangle() {
	local x1=$((x-1));
	local y2=$((y+1));
	local x2=$((x+1));
	cut -c$x1-$x2 out/newin.txt | head -n+$y2 | tail -3;
}

mkdir -p out/sq/;

# for i in $(seq 100); do
	for b in $(seq 100); do
		line="";
		y=$((b+1));
		for a in $(seq 100); do
			x=$((a+1));
			n=$(rectangle | grep -o "#" | wc -l);
			# 101 is for the newlines of input. (wc -m input).
			pos=$(( (b-1) * 101+a )); 
			char=$(head -c$pos input.txt | tail -c1);
			if [ "$char" == "#" ]; then 
				# 3 or 4 is the case, since the current cell is on.
				if [ \( $n -eq 3 \) -o \( $n -eq 4 \) ]; then
					line="${line}#";
				else
					line="${line}.";
				fi
			fi
			if [ "$char" == "." ]; then 
				if [[ $n -eq 3 ]]; then
					line="${line}#";
				else
					line="${line}.";
				fi
			fi
		done
		# echo $line >> out/sq/$i.txt;
		echo $line >> out/output.txt;
		echo "done $b";
	done
	clear;
	# cat out/sq/$i.txt;
	cat out/output.txt;
# done
