#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";
numrows=$(wc -l $input --total=only);
digits=${#numrows};

split -l 3 -d -a $digits $input out/x;
for dir in out/*; do
	file=$(basename $dir);
	dir="out/d-$file";
	mkdir -p $dir;
	mv out/$file $dir/;
	split -l 1 -d -a 1 $dir/$file $dir/p;
done

for dir in out/d-*; do
	for i in $(seq 0 2); do
		sed "s/./&\n/g" $dir/p$i | sort | uniq > $dir/u$i;
	done
	cat $dir/u* | sort | uniq -c | sort -rk 2n,2 | head -1 | tr -d " " | cut -c2 >> out/rep;
done

# it remains to do the substitutions of letters to numbers and add them up.

sed "s/a/1/;s/b/2/;s/c/3/;s/d/4/;s/e/5/;s/f/6/;s/g/7/;s/h/8/;s/i/9/;s/j/10/;s/k/11/; \
		s/l/12/;s/m/13/;s/n/14/;s/o/15/;s/p/16/;s/q/17/;s/r/18/;s/s/19/;s/t/20/;s/u/21/; \
		s/v/22/;s/w/23/;s/x/24/;s/y/25/;s/z/26/;s/A/27/;s/B/28/;s/C/29/;s/D/30/;s/E/31/; \
		s/F/32/;s/G/33/;s/H/34/;s/I/35/;s/J/36/;s/K/37/;s/L/38/;s/M/39/;s/N/40/;s/O/41/; \
		s/P/42/;s/Q/43/;s/R/44/;s/S/45/;s/T/46/;s/U/47/;s/V/48/;s/W/49/;s/X/50/;s/Y/51/; \
		s/Z/52/;" out/rep > out/nums;

gawk '{s+=$1} END {print s}' out/nums | numfmt --grouping;

# rm -r out;
