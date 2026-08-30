#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/crds/;

input="input.txt";
# input="try";

max=$(wc -l $input --total=only);

cut -d":" $input -f2 > out/newin;

for num in $(seq -w $max); do
	head -$num out/newin | tail -1 | grep -o "\<[[:digit:]]\+\>" > out/crds/card-$num;
done

for file in out/crds/card-*; do
	sort $file | uniq -d | wc -l >> out/seqs;
done

seq $max | tr "\n" " " >> out/allcards;
echo "" >> out/allcards;

# efficiency problem: it is exponential
for num in $(seq $max); do
	add=$(grep -o "\<$num\>" out/allcards | wc -l);
	end_seq=$(head -$num out/seqs | tail -1);
	[ $end_seq -eq 0 ] && continue;
	for _ in $(seq $add); do
		seq $((num+1)) $((num+end_seq)) | tr "\n" " " >> out/allcards;
	done
	echo "" >> out/allcards;
	echo "done $num";
done

wc -w out/allcards --total=only | numfmt --grouping;

# rm -r out;
