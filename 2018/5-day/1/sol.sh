#!/bin/bash

rm -r out;
mkdir out;

input=input.txt;
dif=1;

info sed | grep LOWER | head -1 | grep -o "[a-z]" > out/alflower
info sed | grep UPPER | head -1 | cut -d"'" -f2 |grep -o "[A-Z]" > out/alfupper
lowupr=$(paste -d"\0" out/alflower out/alfupper | tr "\n" "|" | sed "s/|/\\\|/g");
uprlow=$(paste -d"\0" out/alfupper out/alflower | tr "\n" "|" | sed "s/|/\\\|/g");

touch out/fil0;
i=0;
while [ $dif -ne 0 ]; do
	currlen=$(wc -m --total=only $input);
	sed "s/$lowupr//g;s/$uprlow//g" $input > out/fil$i;
	newlen=$(wc -m --total=only out/fil$i);
	dif=$((currlen - newlen));
	head -c50 out/fil$i;
	echo;
	echo "DIF: " $dif;
	echo "NEWLEN: " $newlen;
	input=out/fil$i;
	i=$((i+1));
done
wc -m out/fil* | sort -n | head -2 | tail -1;
