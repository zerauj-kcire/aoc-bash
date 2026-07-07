#!/bin/bash

rm -r out;
mkdir out;

sort -n input.txt > out/sorted;
grep -o "#[0-9]*" input.txt | cut -c1 --complement | sort -n | uniq >> out/guards;

# begins shift
# falls asleep
# wakes up
# grep -c context!!

