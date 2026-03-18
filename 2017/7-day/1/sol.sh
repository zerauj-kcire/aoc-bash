#!/bin/bash

grep -o "\<[a-z]\+\>" input.txt | sort | uniq -c | sort -n | head -1 | grep -o "[a-z]\+" > head.txt;

# grep -o "\<[a-z]\+\>" input.txt | sort -u > out/words.txt;
# 
# for word in $(cat out/words.txt); do
	# instance=$(grep "$word" input.txt | wc -l);
	# echo $word " : " $instance;
	# [ $instance -eq 1 ] && final=$word && break;
# done
# 
# echo $final;
