#!/bin/bash

opens=$(grep -o "(" input.txt | wc -l);
close=$(grep -o ")" input.txt | wc -l);

echo $((opens - close));
# ans: 232
