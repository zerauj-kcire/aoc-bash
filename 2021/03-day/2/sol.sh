#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/{max,min};

input="input.txt";
# input="try";

sort -rn $input > out/newin;
rows=$(wc -l out/newin --total=only);
cols=$(wc -L out/newin --total=only);

currin=out/newin;
# check sort try | uniq --group -w 1;
for i in $(seq -w $cols); do
	mkdir out/max/$i;
	uniq --group -w $i $currin > out/max/$i/glued;
	csplit -s --suppress-matched out/max/$i/glued '/^$/' {*} -f out/max/$i/x -n 1;
	currin=$(ls --sort=size out/max/$i/x* | head -1);
	echo "done max:$i";
done

o2=$(echo "ibase=2;$(cat $currin | tr -d "\n");obase=10" | bc);

# repeat the prev steps but take the min (tail).
currin=out/newin;
for i in $(seq -w $cols); do
	mkdir out/min/$i;
	uniq --group -w $i $currin > out/min/$i/glued;
	csplit -s --suppress-matched out/min/$i/glued '/^$/' {*} -f out/min/$i/x -n 1;
	currin=$(ls --sort=size out/min/$i/x* | tail -1);
	echo "done min:$i";
done

co2=$(echo "ibase=2;$(cat $currin | tr -d "\n");obase=10" | bc);
echo $o2 $co2 "RESULT:" $((o2*co2));
