#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

cut -d"|" -f2 $input > out/output;

ones=$(grep -o "\<[a-g]\{2\}\>" out/output | wc -l);
four=$(grep -o "\<[a-g]\{4\}\>" out/output | wc -l);
seve=$(grep -o "\<[a-g]\{3\}\>" out/output | wc -l);
eigh=$(grep -o "\<[a-g]\{7\}\>" out/output | wc -l);

echo $ones $four $seve $eigh;
echo "RESULT ":
echo $((ones+four+seve+eigh)) | numfmt --grouping;
