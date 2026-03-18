#!/bin/bash

mkdir -p out/;

# INFO FILES (((
cat > out/weapons.txt <<EOF
Weapons:    Cost  Damage  Armor
Dagger        8     4       0
Shortsword   10     5       0
Warhammer    25     6       0
Longsword    40     7       0
Greataxe     74     8       0
EOF

cat > out/armors.txt <<EOF
Armor:      Cost  Damage  Armor
Leather      13     0       1
Chainmail    31     0       2
Splintmail   53     0       3
Bandedmail   75     0       4
Platemail   102     0       5
EOF

cat > out/rings.txt <<EOF
Rings:      Cost  Damage  Armor
Damage +1    25     1       0
Damage +2    50     2       0
Damage +3   100     3       0
Defense +1   20     0       1
Defense +2   40     0       2
Defense +3   80     0       3
EOF
# )))

life=100
attack=0
defense=0

# cut -d" " -f2 input.txt | paste -d" " <(echo -e"a=\nb=\nc=") - | tr -d " " > boss_stats.txt;
# grep "[[:digit:]]\+$" input.txt > boss_stats.txt;
# 
# b_life=$(head -1 boss_stats.txt | tail -1);
# b_attack=$(head -2 boss_stats.txt | tail -1);
# b_defense=$(tail -1 boss_stats.txt);
