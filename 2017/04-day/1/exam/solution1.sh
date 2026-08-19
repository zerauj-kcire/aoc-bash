#!/bin/bash


wrongpassphrases=$(grep "\<\(.*\)\>.*\1" input.txt | wc -l);
numlines=$(wc -l input.txt --total=only);
echo $((numlines - wrongpassphrases));

