#!/bin/sh

# find the position where santa is.

up=$(grep -o "(" input.txt | wc -l)
down=$(grep -o ")" input.txt | wc -l)

echo $((up - down))
# 232
