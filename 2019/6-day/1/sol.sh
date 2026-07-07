#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;


# cat <(cut -d")" -f1 input.txt) <(cut -d")" -f2 input.txt) | sort -u | uniq -u > out/bodies;

# by theorem the number of bodies is n+1 (where n is the number of rules);
length=$(wc -l --total=only input.txt);
length=$((length+1));


# the maximum possible output is the sum_{i=1}^{n-1} i = n(n-1) /2.
# the minimum possible output is the sum_{i=1}^{n-1} 1 = n-1.

# COM)B
# B)C
# C)D
# D)E
# E)F
# B)G
# G)H
# D)I
# E)J
# J)K
# K)L

# maybe we can categorize two sets: the explored and non-explored.
# and counting backwards.
# lets try with the example:
#
#
# STEP 0): get all terminal nodes.
#
#             G - H       J - K - L
#            /           /
#     COM - B - C - D - E - F
#                    \
#                     I
#
# E)F
# G)H
# D)I
# K)L
#
# and make the following process for each terminal node:

# STEP L):

# 1. remove L:
#
# COM)B
# B)C
# C)D
# D)E
# E)F
# B)G
# G)H
# D)I
# E)J
# J)K

# 2. get the terminal nodes again:

# E)F   # E)F
# G)H   # G)H
# D)I   # D)I
# J)K   # K)L

# 3. the one that is different, is its parent.
# J)K   # K)L
#
#
#
#
