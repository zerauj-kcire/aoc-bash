#!/bin/bash

sum=0;
for num in $(cat input.txt); do
	sum=$((sum+num));
	echo $sum;
done
echo "FINAL SUM: " $sum;
