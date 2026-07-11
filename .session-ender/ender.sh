#!/bin/bash

# update the solved problems
rm README.txt;
echo -e "SOLVED PROBLEMS: *\n" >> README.txt;
grep -o "adventofcode.*" $HOME/.local/share/lf/tags | \
 	tree --fromfile | \
	grep -v "[[:digit:]]\{4\}:\*" | \
	grep -v "directories" | \
	grep -v "\-day:\*$" >> README.txt;
# do the git stuff
git add .
read -p "Message to commit: " msg;
git commit -m "$msg";
# this works only on wayland, or if you have the wl-copy program.
# the token contains the stupid (long) password of github.
cat $HOME/.config/token.git.txt | tr -d "\n" | wl-copy;
git push origin master;
