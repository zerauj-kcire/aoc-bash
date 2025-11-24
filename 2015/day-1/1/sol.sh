#!/bin/sh

# find the position where santa is.

declare -i up=$(grep -o "(" input.txt | wc -l)
declare -i down=$(grep -o ")" input.txt | wc -l)

echo $((up - down))
# 232
