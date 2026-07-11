#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/sep/;

csplit input.txt --suppress-matched '/^$/' '{*}' -f out/sep/s -n 3;

for file in out/sep/*; do
	byr=$(grep -c "byr" $file);
	iyr=$(grep -c "iyr" $file);
	eyr=$(grep -c "eyr" $file);
	hgt=$(grep -c "hgt" $file);
	ecl=$(grep -c "ecl" $file);
	pid=$(grep -c "pid" $file);
	hcl=$(grep -c "hcl" $file);
	# cid=$(grep -c "cid" $file);
	sum=$(( byr+iyr+eyr+hgt+ecl+pid+hcl ));
	# echo $sum;
	[ $sum -eq 7 ] && echo "ONE REG" >> out/results;
done

wc -l out/results;
