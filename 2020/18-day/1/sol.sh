#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

# star with the regex
#
# cat try | tr "()" "{}" | sed "s/ \*/) &/g; s/ +/) +/g";
# we have to count somehow the number of operators
# or try something else
