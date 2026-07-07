#!/bin/bash

[ -d out ] && rm -r out;
# mkdir out;

N=9;
# first action: new stack
seq 0 $N | tac;

# second action: cut and cut -
k=3;
cat <(seq 0 $N | tail -$((N-k+1)) ) <(seq 0 $N | head -$k );
k=4;
cat <(seq 0 $N | tail -$k ) <(seq 0 $N | head -$((N-k+1)) );

# third action: increment
m=3;
# read info split
# seq 0 $N | split -nr/3
# head xa*
# read info sed
# seq 0 $N | sed "p;n;n;p"
