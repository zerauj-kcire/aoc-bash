#!/bin/bash

# rm newinput;
# for line in $(cat input.txt); do
	# echo "$line" | tr "x" "\n" | sort -n | tr "\n" "x" >> newinput;
	# echo "" >> newinput;
	# echo "DONE $line";
# done

sed "s/\(.\+\)x\(.\+\)x\(.\+\)x//g" newinput | bc > final.txt;
echo "$(cat final.txt | tr "\n" "+")0" | bc;
