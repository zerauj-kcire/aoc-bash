#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

# input="input.txt";
input="try";

cat $input | tr -d " " | sed "s/\//\\\\\//g" > out/newin;
input=out/newin;

head -1 $input > out/root;

# remove first line and filter special characters.
# and ( - ) all the operators to not have problems on order on the execution.
cat out/root $input | uniq -u | sed "s/:/\//g;s///g" > out/cond; 

# the idea is the following:
# while out/cond is nonempty:
	# grep all [a-z]\{4\} from current root
	# save them in a file out/subs
	# for word in cat out/subs; do
		# grep "^$word" out/cond and save it to a variable $COND
		# sed "$COND" out/root 
		# remove $COND from out/cond;
	# done
# done
# finally: cat out/root | bc;


# rm -r out;
