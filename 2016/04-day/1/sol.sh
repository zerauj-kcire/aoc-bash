#!/bin/bash

rm -r out/;
mkdir -p out/;

line="not-a-real-room404[oarel]"
# esto ordena a las letras según su cantidad de apariciones.
echo -n $line | tr -d "-" | sed "s/[[:digit:]].\+//g;s/./&\n/g" | sort | uniq -c | sort -nr | tr -d " "
echo ""
# echo -n $line | tr -d "-" | sed "s/[[:digit:]].\+//g;s/./&\n/g" | sort | uniq -c | sort -nr | sed "s/^\s\+//g"
# echo -n $line | tr -d "-" | sed "s/[[:digit:]].\+//g;s/./&\n/g" | sort | uniq -c | sort -nr | sed "s/^\s\+//g" | cut -d" " -f2 | tr -d "\n";

# echo -n "notarealroom" | sed "s/./&\n/g" | sort | uniq -c | sort -r -k ...
# see info sort 
# /Historical
