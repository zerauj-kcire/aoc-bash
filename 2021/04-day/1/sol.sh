#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/fb;

input="input.txt";
# input="try";

# divide the output;
head -1 $input | tr "," "\n" | sed "s/\<.\>/0&/g" > out/select;
rows=$(wc -l $input --total=only);
tail -$((rows - 1)) $input | sed "s/ \?\(\<.\>\)/0\1/g" > out/boards;
# head out/*;


call=0; # the calling number;
cp out/boards out/mb; #create a file that iw goung to be changing (see sed -i);

wincol="-----";
winrow="-- -- -- -- --";
for num in $(cat out/select); do
	sed -i "s/\<$num\>/--/g" out/mb;
	numsincol=$(cut -c1 out/mb | tr -d "\n" | grep -- "$wincol");
	# change -c1 for every column that it need to be checked; although the answer is in the first column;
	numsinrow=$(grep -- "$winrow" out/mb);
	# echo $numsincol $numsinrow;
	[ "$numsinrow" == "$winrow" ] && call=$num && echo "done in $num"  && grep -C 5 -- "$winrow" out/mb > out/fb/glued && break;
	[ "$numsincol" == "$wincol" ] && call=$num && echo "done in $num" && grep -C 5 -- "$wincol" out/mb > out/fb/glued && break;
	# grep -C is the salvation.
done

csplit -s --suppress-matched out/fb/glued '/^$/' {*} -f out/fb/x -n 1;
winnerbingo=$(ls --sort=size out/fb/x* | head -1);
winsum=$(echo "$(grep -o "[[:digit:]][[:digit:]]" $winnerbingo | tr "\n" "+")0" | bc);
echo $call $winsum;
echo "RESULT: " $((call * winsum));
