#!/bin/bash

rm -r out;
mkdir -p out;

for line in $(cat input.txt); do
	sline=$(echo -e "$line" | sed "s/./&\n/g" | sort | tr -d "\n");
	echo $sline >> out/sc;
done

sed "s/\(.\)\1\1\+/3/g"  out/sc > out/1f;
sed "s/\(.\)\1/2/g"      out/1f > out/2f;
cat out/2f | tr -d "a-z"        > out/3f;
sed "s/\(.\)\1\1\+/\1/g" out/3f > out/4f;
sed "s/\(.\)\1/\1/g"     out/4f > out/final;
tws=$(grep "2" out/final | wc -l);
# echo "TWS: " $tws.
trs=$(grep "3" out/final | wc -l);
# echo "TRS: " $trs.
echo "RESULT: " $((tws*trs));
