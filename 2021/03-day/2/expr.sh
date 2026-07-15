
# while [ $rows -ne 0 ]; do
	# comdigit=$(cut -c$i $currin | uniq -c | tr -d " \t" | cut -c2 | head -1);
	# the CUT -C2 part is incorrect. it must be the last digit, not the second.
	# sort -n $input;
	# cut -c$i --complement $input | sort -n;
	# rows=$(wc -l $input --total=only);
# done

# instead of give the position in the file with $mid, 
# we should count the most common digits with uniq -c.
# for i in $(seq $cols); do
	# cut -c$i $input | sort -n > out/$i;
# done
# for i in $(seq $cols); do
	# uniq -c out/$i | tr -d " \t" | sort -rn > out/count-$i;
# done
# head out/count-*;

# we should see the join command also, i should use it.
