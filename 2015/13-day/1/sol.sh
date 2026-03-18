#!/bin/bash

mkdir -p out/;

# cleaning the data.
sed 's/gain /+/g;s/lose /-/g' input.txt > out/clean.txt;
