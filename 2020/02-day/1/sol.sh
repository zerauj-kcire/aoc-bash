#!/bin/bash

[ -d out ] && rm -r out;
# mkdir out;
mkdir -p out/{drules,dstrings};

cut -d":" input.txt -f2 | cut -c1 --complement > out/dstrings/strings;
# cut -d":" input.txt -f1 | cut -d" " -f2 > out/chars;
cut -d":" input.txt -f1 | sed "s/\(\S\+\)-\(\S\+\) \(\S\+\)/\\\\(\3\\\\S*\\\\)\\\\{\1,\2\\\\}/g" > out/drules/rules;

# final format: grep "\(f\S*\)\{NUM1,NUM2\}"

# BAD USE OF SPLIT, IT IS REQUIRED TO USE CSPLIT RULES '/$' {*} -f /PATH/
#
# cd out/drules/;
# split -nl/1000 rules r -a 3 -d;
# cd ../..;
# cd out/dstrings/;
# split -nl/1000 strings s -a 3 -d;
# cd ../..;

max=$(wc -l input.txt --total=only);
max=$((max-1));

for i in $(seq -w 0 $max); do
	# echo "$i";
	# grep "$(cat out/drules/r$i)" out/dstrings/s$i >> out/results && echo "--- match $i ---";
	grep "$(head -$((i+1)) out/drules/rules | tail -1)" out/dstrings/s$i >> out/results && echo "match at $i";
done
# cat out/results;
wc -l out/results;

# for i in $(seq -w 0 $max); do
	# grep "$(head -$i out/drules/rules | head -1)" out/dstrings/s$i && echo $i;
# done
