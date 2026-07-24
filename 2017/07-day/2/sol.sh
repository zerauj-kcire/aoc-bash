#!/bin/bash

function createsubdirs() {
	mkdir -p $currdir;
	cd $currdir;
	list=$(grep -o "$currdir" $pathinput/input.txt | grep -o "\<[a-z]\+\>" | grep -v "$currdir" );
	[ ${#list} -eq 0 ] && stop=0 || mkdir $list;
	cd ..;
}

function descendtree() {
	newlist=$(ls) # todo.
	createsubdirs()
	descendtree()
}

rm -r out;
mkdir -p out;

sort input.txt | tr -d "()" | cut -d" " -f1   > out/words.txt;
sort input.txt | tr -d "()" | cut -d" " -f2   > out/value.txt;
sort input.txt | tr -d "()" | cut -d" " -f1,2 > out/wandv.txt;

# we have the head from the PART 1.

pathinput=$(pwd);
cd out/;
currdir=$(cat head.txt | tr -d " ");
stop=1;

