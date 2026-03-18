#!/bin/bash

# mkdir -p out/;

# cat input.txt | tr " " "\n" | tr -d , > out/instr.txt;

eyes=0
# : eyes : 
#    0
# 3     1
#    2

xpos=0
ypos=0

for word in $(cat input.txt | tr -d ,); do
	direct=$(echo $word | cut -c1);
	length=$(echo $word | cut -c1 --complement);
	echo -n "($xpos,$ypos) + $word : ";
	case $direct in
		R) case $eyes in 
			0) xpos=$((xpos + length));;
			1) ypos=$((ypos - length));;
			2) xpos=$((xpos - length));;
			3) ypos=$((ypos + length));;
		esac
			eyes=$(( (eyes +1+4) % 4));;# echo $eyes;;
		L) case $eyes in
			0) xpos=$((xpos - length));;
			1) ypos=$((ypos + length));;
			2) xpos=$((xpos + length));;
			3) ypos=$((ypos - length));;
		esac
			eyes=$(( (eyes -1+4) % 4));;# echo $eyes;;
	esac
	echo " ($xpos,$ypos).";
done
finx="${xpos/#-}";
finy="${ypos/#-}";
echo " FINAL POS:  ($xpos,$ypos) : " $((finx + finy));
