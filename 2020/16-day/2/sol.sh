#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/{rls,tiks};

input="input.txt";
# input="try";
csplit -s --suppress-matched $input '/^$/' {*} -f out/x -n 1;

mv out/x0 out/rls/rules;
grep -v ":" out/x1 | tr "," "\n" > out/myticket;
grep -v ":" out/x2 > out/tiks/tiks;
rm out/x*;

# filtering the invalid tickets
# results file is taken from the prev step.
sort -nu results | tr "\n" "|" | sed "s/|/\\\\>\\\\|\\\\</g" > out/results;
grep -v "\<$(cat out/results)0\>" out/tiks/tiks > out/tiks/filtd;

# divide the tickets in the number of columns;
numcols=$(head -1  out/tiks/tiks | tr "," "\n" | wc -l);
for i in $(seq -w $numcols); do
	cut -d"," out/tiks/filtd -f$i > out/tiks/$i;
done

# transform the conditions to gnu/bash
sed "s/\(\w*\)\s\?\(\w*\)\?: \(\w*\)-\(\w*\) or \(\w*\)-\(\w*\)/\1\2 \3 \4 \5 \6/g" out/rls/rules > out/rls/dfields;

# once separated by columns, we have to stablish which fields are which cols.
# i think it is easier computationally to see which values are not in the list
# rather than set a counter to have a positive answer that all the numbers are
# in the current field.

cat <(seq 1 $A) <(seq $((B+1)) $((C+1)) ) <(seq $D 999);
