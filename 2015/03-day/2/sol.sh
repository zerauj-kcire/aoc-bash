#!/bin/bash

mkdir -p out/;

sed 's/./&\n/g' input.txt >> out/total.txt;

for i in $(seq $(wc -l --total=only out/total.txt)); do
	if [ $((i % 2)) == 1 ]; then
		head -n+$i out/total.txt | tail -1 >> out/santa.txt;
	fi
	if [ $((i % 2)) == 0 ]; then
		head -n+$i out/total.txt | tail -1 >> out/robot.txt;
	fi
	echo "$i";
done

bash steps.sh santa;
bash steps.sh robot;
cat out/hist.santa.file out/hist.robot.file >> out/pasted.file;
sort -u out/pasted.file > out/sorted.file;
uniq -u out/sorted.file > out/uniq.file;
wc -l out/uniq.file;
