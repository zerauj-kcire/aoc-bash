#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/{horizontal,vertical};

input="input.txt";
# input="try";

head -1 $input | tr "," "\n" | sed "s/\<.\>/0&/g" > out/calls;
rows=$(wc -l $input --total=only);
tail -$((rows - 2)) $input | sed "s/ \?\(\<.\>\)/0\1/g" > out/horizontal/boards-h;

words=$(head -1 out/horizontal/boards-h | wc -w);
csplit -s --suppress-matched out/horizontal/boards-h '/^$/' {*} -f out/vertical/x -n 2;
for file in out/vertical/x*; do
	for i in $(seq $words); do
		cut $file -d" " -f$i | paste -s -d' ' >> $file-trans;
	done
	echo "" >> $file-trans;
done
cat out/vertical/*-trans > out/v;

cp out/horizontal/boards-h out/h; 

call=0; 
typesol="";
winrow="-- -- -- -- --";
for num in $(cat out/calls); do
	sed -i "s/\<$num\>/--/g" out/h;
	sed -i "s/\<$num\>/--/g" out/v;
	numsinrow=$(grep -- "$winrow" out/h);
	numsincol=$(grep -- "$winrow" out/v);
	echo $numsinrow $numsincol;
	[ "$numsinrow" == "$winrow" ] && call=$num && echo "done in $num"  && grep -C 5 -- "$winrow" out/h > out/horizontal/glued && typesol="h" && break;
	[ "$numsincol" == "$winrow" ] && call=$num && echo "done in $num"  && grep -C 5 -- "$winrow" out/v > out/vertical/glued && typesol="v" && break;
done

[ "$typesol" == "h" ] && base="out/horizontal";
[ "$typesol" == "v" ] && base="out/vertical";
csplit -s --suppress-matched $base/glued '/^$/' {*} -f $base/n -n 1;
winnerbingo=$(ls --sort=size $base/n* | head -1);
winsum=$(echo "$(grep -o "[[:digit:]][[:digit:]]" $winnerbingo | tr "\n" "+")0" | bc);
echo $call $winsum;
echo "RESULT: ";
echo $((call * winsum)) | numfmt --grouping;
