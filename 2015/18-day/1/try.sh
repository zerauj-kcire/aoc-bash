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

try=3

for b in $(seq $try); do
	y=$((b+1));
	for a in $(seq $try); do
		x=$((a+1));
		char=$(( (b-1) * 101+a )); # 101 is for the newlines of input. (wc -m input)
		echo -n "($a,$b): ";
		head -c$char input.txt | tail -c1;
		echo " " $((char -b+1));
		rectangle;
		rectangle | grep -o "#" | wc -l;
	done
done
