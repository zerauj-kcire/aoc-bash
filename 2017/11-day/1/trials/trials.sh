
# FIRST ERROR

# n  = ( 1, 0, 0);
# ne = ( 0, 1, 0);
# nw = ( 0, 0, 1);
# s  = (-1, 0, 0);
# se = ( 0, 0,-1);
# sw = ( 0,-1, 0);
# doesn't work: nw + ne != n.

# SECOND ERROR

# FINAL_POS = (x,y,z).
# |x| = | -1  0 | |a|
# |y| = |  1 -1 | |b|
# |z| = |  0 -1 | 
# then
# |x| = | -1  0 | |a|
# |y| = |  1 -1 | |b|
# then
# a = -x
# b = -(x+y)
# ANS: a + b = -2x - y.

echo "ANS:" $((-2*xpos - ypos));
echo "ANS:" $((-2*xpos - ypos)) > out/ans.txt;

# THIRD ERROR

# position: |x| + |z|
absx=$(( $xpos * (($xpos > 0) - ($xpos < 0)) ));
absz=$(( $zpos * (($zpos > 0) - ($zpos < 0)) ));
echo "ANS: " $((absx + absz)) > out/ans.txt;
echo "ANS: " $((absx + absz));

