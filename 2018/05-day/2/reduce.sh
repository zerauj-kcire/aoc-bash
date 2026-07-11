#!/bin/bash

# rm -r out;
# mkdir out;

input=$1;
dif=1;

# info sed | grep LOWER | head -1 | grep -o "[a-z]" > out/alflower
# info sed | grep UPPER | head -1 | cut -d"'" -f2 |grep -o "[A-Z]" > out/alfupper
lowupr=$(paste -d"\0" out/alflower out/alfupper | tr "\n" "|" | sed "s/|/\\\|/g");
uprlow=$(paste -d"\0" out/alfupper out/alflower | tr "\n" "|" | sed "s/|/\\\|/g");

fn=$(basename $input);
lettername=${fn:0:1};
mkdir -p out/process/$lettername;
touch out/process/$lettername/fil0;
i=0;
echo "STARTING FILE: $lettername";
while [ $dif -ne 0 ]; do
	currlen=$(wc -m --total=only $input);
	sed "s/$lowupr//g;s/$uprlow//g" $input > out/process/$lettername/fil$i;
	newlen=$(wc -m --total=only out/process/$lettername/fil$i);
	dif=$((currlen - newlen));
	echo "FILE: $lettername/fil$i";
	head -c50 out/process/$lettername/fil$i;
	echo;
	echo "DIF: " $dif;
	echo "NEWLEN: " $newlen;
	input=out/process/$lettername/fil$i;
	i=$((i+1));
done
wc -m out/process/$lettername/fil* | sort -n | head -2 | tail -1 >> out/final;
