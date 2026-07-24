#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/{shbf,svbp};
# shbf: split horizontal boards final 
# svbp: split horizontal boards previous

# input="input.txt";
input="try";

# divide the output: from the number of calls to the boards.
head -1 $input | tr "," "\n" | sed "s/\<.\>/0&/g" > out/calls;
rows=$(wc -l $input --total=only);
tail -$((rows - 2)) $input | sed "s/ \?\(\<.\>\)/0\1/g" > out/boards-h;
# we have to transpose the file, working with columns is a pain.
cols=$(head -1 out/boards-h | tr " " "\n" | wc -l);
csplit -s --suppress-matched out/boards-h '/^$/' {*} -f out/svbp/x -n 1; # n=1 is gona need to  be changed.
for file in out/svbp/*; do
	for i in $(seq $cols); do
		cut -d' ' $file # obvious TODO;
	done
done
# mergin, because do sed -i is easier to do in one file at time to do in a lot 
# of files.
# mergin is gonna need cat, with a lot of intermediate <(echo ""), because we
# need to separate each individual board.
exit 0;
# head out/*;


call=0; # the calling number;
cp out/boards-h out/mb; #create a file that iw goung to be changing (see sed -i);

# wincol="-----";
winrow="-- -- -- -- --";
for num in $(cat out/calls); do
	sed -i "s/\<$num\>/--/g" out/mb;
	# numsincol=$(cut -c1 out/mb | tr -d "\n" | grep -- "$wincol");
	numsinrow=$(grep -- "$winrow" out/mb);
	# echo $numsincol $numsinrow;
	# [ "$numsincol" == "$wincol" ] && call=$num && echo "done in $num" && cut -c1 out/mb | tr -d "\n" | grep -C 5 -- "$wincol" > out/shbf/glued && break;
	[ "$numsinrow" == "$winrow" ] && call=$num && echo "done in $num"  && grep -C 5 -- "$winrow" out/mb > out/shbf/glued && break;
done

csplit -s --suppress-matched out/shbf/glued '/^$/' {*} -f out/shbf/x -n 1;
winnerbingo=$(ls --sort=size out/shbf/x* | head -1);
winsum=$(echo "$(grep -o "[[:digit:]][[:digit:]]" $winnerbingo | tr "\n" "+")0" | bc);
echo $call $winsum;
echo "RESULT: " $((call * winsum));
