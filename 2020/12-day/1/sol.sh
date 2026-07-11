#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

xpos=0;
ypos=0;


for word in $input; do
	dir=$(echo -e $line | cut -c1);
	steps=$(echo -e $line | cut -c1 --complement);
done
