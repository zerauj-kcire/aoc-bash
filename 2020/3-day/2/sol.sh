#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/sec{1,3,5,7,2};

input="input.txt";

cols=$(wc -L $input --total=only);
rows=$(wc -l $input --total=only);
num_repeats=$((7*rows/cols+1));
paste -d"\0" $(for _ in $(seq $num_repeats); do echo -n " $input"; done) > out/newin;

for i in $(seq $rows); do
	tail -$((rows-i)) out/newin | head -1 | cut -c1-$i --complement > out/sec1/$i;
done
echo "done 1";
for i in $(seq $rows); do
	tail -$((rows-i)) out/newin | head -1 | cut -c1-$((3*i)) --complement > out/sec3/$i;
done
echo "done 3";
for i in $(seq $rows); do
	tail -$((rows-i)) out/newin | head -1 | cut -c1-$((5*i)) --complement > out/sec5/$i;
done
echo "done 5";
for i in $(seq $rows); do
	tail -$((rows-i)) out/newin | head -1 | cut -c1-$((7*i)) --complement > out/sec7/$i;
done
echo "done 7";
for i in $(seq $((rows/2)) ); do
	tail -$((rows-2*i)) out/newin | head -1 | cut -c1-$i --complement > out/sec2/$i;
done
echo "done 2/1";

cat out/sec1/* > out/final1;
cat out/sec3/* > out/final3;
cat out/sec5/* > out/final5;
cat out/sec7/* > out/final7;
cat out/sec2/* > out/final2;

for i in 1 3 5 7 2; do
	cut -c1 out/final$i | grep -c "#" >> out/results;
done

cat out/results;
echo "$(cat out/results | tr "\n" "*")1" | bc | numfmt --grouping;
