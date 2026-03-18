#!/bin/bash

rm -r out/;
mkdir -p out/;
touch out/path.txt;
touch out/moves.txt;

eyes=0
# : eyes : 
#    0
# 3     1
#    2

xpos=0;
ypos=0;

echo "($xpos,$ypos)" >> out/path.txt;

for word in $(cat input.txt | tr -d ,); do
	direct=$(echo $word | cut -c1);
	length=$(echo $word | cut -c1 --complement);
	xprev=$xpos;
	yprev=$ypos;
	case $direct in
		R) case $eyes in 
			0) xpos=$((xpos + length));
				for i in $(seq $((xprev+1)) 1 $xpos); do echo "($i,$ypos)" >> out/path.txt;done;
				;;
			1) ypos=$((ypos - length));
				for i in $(seq $((yprev-1)) -1 $ypos); do echo "($xpos,$i)" >> out/path.txt;done;
				;;
			2) xpos=$((xpos - length));
				for i in $(seq $((xprev-1)) -1 $xpos); do echo "($i,$ypos)" >> out/path.txt;done;
				;;
			3) ypos=$((ypos + length));
				for i in $(seq $((yprev+1)) 1 $ypos); do echo "($xpos,$i)" >> out/path.txt;done;
				;;
		esac
			eyes=$(( (eyes +1+4) % 4));;
		L) case $eyes in
			0) xpos=$((xpos - length));
				for i in $(seq $((xprev-1)) -1 $xpos); do echo "($i,$ypos)" >> out/path.txt;done;
				;;
			1) ypos=$((ypos + length));
				for i in $(seq $((yprev+1)) 1 $ypos); do echo "($xpos,$i)" >> out/path.txt;done;
				;;
			2) xpos=$((xpos + length));
				for i in $(seq $((xprev+1)) 1 $xpos); do echo "($i,$ypos)" >> out/path.txt;done;
				;;
			3) ypos=$((ypos - length));
				for i in $(seq $((yprev-1)) -1 $ypos); do echo "($xpos,$i)" >> out/path.txt;done;
				;;
		esac
			eyes=$(( (eyes -1+4) % 4));;
	esac
	echo "($xprev,$yprev) + $word : ($xpos,$ypos)." >> out/moves.txt;
	echo "done $word";
done

line=$(awk '{ if(seen[$0]) { print; exit } seen[$0] = 1 }' out/path.txt | tr -d "()-");
x=$(echo $line | cut -d, -f1);
y=$(echo $line | cut -d, -f2);
expr $x "+" $y;
