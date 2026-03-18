#!/bin/bash

rm -r out;
mkdir -p out;

# pos=(0,0,0);
xpos=0;
ypos=0;
zpos=0;

# n  = (-1, 1, 0);
# ne = ( 0, 1,-1);
# nw = (-1, 0, 1);
# s  = ( 1,-1, 0);
# se = ( 1, 0,-1);
# sw = ( 0,-1, 1);
# works because they are all the coplanar 6 cube vertex!!!!

cat input.txt | tr "," "\n" > out/directions.txt;

for dir in $(cat out/directions.txt); do
	case $dir in
		"n")  xpos=$((xpos-1)); ypos=$((ypos+1));;
		"ne") ypos=$((ypos+1)); zpos=$((zpos-1));;
		"nw") xpos=$((xpos-1)); zpos=$((zpos+1));;
		"s")  xpos=$((xpos+1)); ypos=$((ypos-1));;
		"se") xpos=$((xpos+1)); zpos=$((zpos-1));;
		"sw") ypos=$((ypos-1)); zpos=$((zpos+1));;
	esac
	echo "( "$xpos ", " $ypos ", " $zpos " )";
	echo "( "$xpos ", " $ypos ", " $zpos " )" >> out/path.txt;
done

echo "FINAL:"
echo "( "$xpos ", " $ypos ", " $zpos " )";

