#!/bin/bash

input="input.txt"
# input="try"

paste -d" " <(cut -d" " -f1 $input | sort) <(cut -d" " -f4 $input | sort) \
	| gawk '{print $1 - $2 >= 0 ? $1 - $2 : $2 - $1}' \
	| gawk '{s+=$1} END{print s}' \
	| numfmt --grouping;

# SOLVED
