#!/bin/bash

rm -r out/;
mkdir -p out/;

# grep "\[[a-z]*\(.\)\(.\)\1[a-z]*\][a-z]*\2\1\2" input.txt;

# (?(?=condition)then|else)
grep "\[[a-z]*\(.\)\(.\)\1[a-z]*\](?(?=.*\[).*\]|[a-z]*)\2\1\2" input.txt;
