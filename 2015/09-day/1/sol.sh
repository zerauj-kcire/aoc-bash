#!/bin/bash

mkdir -p out/;

# cut -d' ' -f1 input.txt >> out/1.txt;
# cut -d' ' -f3 input.txt >> out/2.txt;
# cat out/1.txt out/2.txt >> out/3.txt;
# sort out/3.txt | uniq >> out/cities.txt;

num=$(wc -l out/cities.txt);
cat out/cities.txt >> out/unvisited.txt;

