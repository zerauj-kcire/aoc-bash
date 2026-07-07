#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/sep/;

csplit input.txt --suppress-matched '/^$/' '{*}' -f out/sep/s -n 3;
sed -i "s/ /\n/g" out/sep/s*;

# for file in out/sep/s*; do
# done

# 1. byr (Birth Year) - four digits; at least 1920 and at most 2002.
# 2. iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# 3. eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# 4. hgt (Height) - a number followed by either cm or in:
    # - If cm, the number must be at least 150 and at most 193.
    # - If in, the number must be at least 59 and at most 76.
# 5. hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# 6. ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# 7. pid (Passport ID) - a nine-digit number, including leading zeroes.
