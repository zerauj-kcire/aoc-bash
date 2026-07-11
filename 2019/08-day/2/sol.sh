#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

# interchange 0 and 2.
sed -i "s/2/T/g;s/0/2/g;s/T/0/g" input.txt;

# get images.
fold -w 25 input.txt | split - -l 6 -d -a 2 out/f;

# maybe the use of objfile and strip could help.
