#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="real-rooms";
# input="try";

sed "s/\[[a-z]\+\]//g" $input > out/newin;
input="out/newin";

echo -n "abcdefghijklmnopqrstuvwxyz" > out/letters;

for line in $(cat $input); do
	num=$(echo $line | tail -c-4);
	shif=$((num % 26));
	del1=$(tail -c-$((26 - shif)) out/letters | head -c1);
	del2="z";
	del3="a";
	del4=$(head -c$shif out/letters | tail -c1);
	shifter="$del1-$del2$del3-$del4"
	echo $line | tr "a-z" "$shifter" >> out/decrypted;
	echo "done $num";
done

grep "north" out/decrypted | tail -c4;

# rm -r out;
