#!/bin/bash

rm -r out/;
mkdir -p out/;

cat input.txt | tr "\t" " " | column -t -s " " > out/newin.txt;


