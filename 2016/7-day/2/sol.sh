#!/bin/bash

# rm -r out/;
# mkdir -p out/;

# grep "\[[a-z]*\(.\)\(.\)\1[a-z]*\][a-z]*\2\1\2" input.txt;

# (?(?=condition)then|else)
# grep "\[[a-z]*\(.\)\(.\)\1[a-z]*\](?(?=.*\[).*\]|[a-z]*)\2\1\2" input.txt;
grep "[a-z]*\(.\)\(.\)\1[a-z]*\[[a-z]*\2\1\2[a-z]*\]" input.txt;
# it just remains to do it backwards and merge the matches c:
