#!/bin/bash

rm newinput;
for line in $(cat input.txt); do
	echo "$line" | tr "x" "\n" | sort -n | tr "\n" "x" >> newinput;
	echo "" >> newinput;
	echo "DONE $line";
done

sed "s/\(.\+\)x\(.\+\)x\(.\+\)x/3*\1*\2+2*\2*\3+2*\1*\3/g" newinput | bc > final.txt;
echo "$(cat final.txt | tr "\n" "+")0" | bc;
