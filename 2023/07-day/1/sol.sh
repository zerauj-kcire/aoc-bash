#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/{types,filts};

# THIS PROBLEM IS A CLASS IN COMBINATORICS:

input="input.txt";
# input="try";

# first aproximation:
paste -d" " <(cut -d" " -f1 $input | tr "AKQJT98765432" "a-m") <(cut -d" " -f2 $input) > out/filts/0;

# fives:
grep "^\(.\)\1\1\1\1" out/filts/0 > out/types/five; # aaaaa

# fours:
cat out/types/five out/filts/0 | sort | uniq -u > out/filts/1;
grep "^\(.\)\1\1\1." out/filts/1 >> out/types/four; # aaaab
grep "^\(.\)\1\1.\1" out/filts/1 >> out/types/four; # aaaba
grep "^\(.\)\1.\1\1" out/filts/1 >> out/types/four; # aabaa
grep "^\(.\).\1\1\1" out/filts/1 >> out/types/four; # abaaa
grep "^.\(.\)\1\1\1" out/filts/1 >> out/types/four; # baaaa

# houses:
cat out/types/four out/filts/1 | sort | uniq -u > out/filts/2;
grep "^\(.\)\1\1\(.\)\2" out/filts/2 >> out/types/house; # aaabb
grep "^\(.\)\1\(.\)\1\2" out/filts/2 >> out/types/house; # aabab
grep "^\(.\)\(.\)\1\1\2" out/filts/2 >> out/types/house; # abaab
grep "^\(.\)\(.\)\2\2\1" out/filts/2 >> out/types/house; # baaab
grep "^\(.\)\1\(.\)\2\1" out/filts/2 >> out/types/house; # aabba
grep "^\(.\)\(.\)\1\2\1" out/filts/2 >> out/types/house; # ababa
grep "^\(.\)\(.\)\2\1\2" out/filts/2 >> out/types/house; # baaba
grep "^\(.\)\(.\)\2\1\1" out/filts/2 >> out/types/house; # abbaa
grep "^\(.\)\(.\)\1\2\2" out/filts/2 >> out/types/house; # babaa
grep "^\(.\)\1\(.\)\2\2" out/filts/2 >> out/types/house; # bbaaa

# threes:
cat out/types/house out/filts/2 | sort | uniq -u > out/filts/3;
grep "^\(.\)\1\1.." out/filts/3 >> out/types/three; # aaabc
grep "^\(.\)\1.\1." out/filts/3 >> out/types/three; # aabac
grep "^\(.\).\1\1." out/filts/3 >> out/types/three; # abaac
grep "^.\(.\)\1\1." out/filts/3 >> out/types/three; # baaac
grep "^\(.\)\1..\1" out/filts/3 >> out/types/three; # aabca
grep "^\(.\).\1.\1" out/filts/3 >> out/types/three; # abaca
grep "^.\(.\)\1.\1" out/filts/3 >> out/types/three; # baaca
grep "^\(.\)..\1\1" out/filts/3 >> out/types/three; # abcaa
grep "^.\(.\).\1\1" out/filts/3 >> out/types/three; # bacaa
grep "^..\(.\)\1\1" out/filts/3 >> out/types/three; # bcaaa

# two pairs:
cat out/types/three out/filts/3 | sort | uniq -u > out/filts/4;
grep "^.\(.\)\1\(.\)\2" out/filts/4 >> out/types/twopairs; # baacc
grep "^\(.\).\1\(.\)\2" out/filts/4 >> out/types/twopairs; # abacc
grep "^\(.\)\1.\(.\)\2" out/filts/4 >> out/types/twopairs; # aabcc
grep "^\(.\)\1\(.\).\2" out/filts/4 >> out/types/twopairs; # aacbc
grep "^\(.\)\1\(.\)\2." out/filts/4 >> out/types/twopairs; # aaccb
grep "^.\(.\)\(.\)\1\2" out/filts/4 >> out/types/twopairs; # bacac
grep "^\(.\).\(.\)\1\2" out/filts/4 >> out/types/twopairs; # abcac
grep "^\(.\)\(.\).\1\2" out/filts/4 >> out/types/twopairs; # acbac
grep "^\(.\)\(.\)\1.\2" out/filts/4 >> out/types/twopairs; # acabc
grep "^\(.\)\(.\)\1\2." out/filts/4 >> out/types/twopairs; # acacb
grep "^.\(.\)\(.\)\2\1" out/filts/4 >> out/types/twopairs; # bacca
grep "^\(.\).\(.\)\2\1" out/filts/4 >> out/types/twopairs; # abcca
grep "^\(.\)\(.\).\2\1" out/filts/4 >> out/types/twopairs; # acbca
grep "^\(.\)\(.\)\2.\1" out/filts/4 >> out/types/twopairs; # accba
grep "^\(.\)\(.\)\2\1." out/filts/4 >> out/types/twopairs; # accab

# unique pair:
cat out/types/twopairs out/filts/4 | sort | uniq -u > out/filts/5;
grep "^.*\(.\).*\1.*\s" out/filts/5 >> out/types/upair;

# all different:
cat out/types/upair out/filts/5 | sort | uniq -u > out/filts/6;
cp out/filts/6 out/types/zdiff;

cat <(sort  out/types/five) <(sort  out/types/four) <(sort  out/types/house) \
	<(sort  out/types/three) <(sort  out/types/twopairs) <(sort  out/types/upair) \
	<(sort  out/types/zdiff) | tr "a-m" "AKQJT98765432" > out/sorted;

tac out/sorted | gawk '{s+=NR * $2} END {print s}' | numfmt --grouping;

# rm -r out;
