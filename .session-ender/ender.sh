#!/bin/bash

# update the solved problems
grep -r "SOLVED" * | cut -d":" -f1 | tree -d --fromfile --compress=3 \
	| pr -f -3 -h "CONTENTS" -o 8 > README.txt;
# do the git stuff
git add .
read -p "Message to commit: " msg;
git commit -m "$msg";
# this works only on wayland, or if you have the wl-copy program.
# the token contains the stupid (long) password of github.
cat $HOME/.config/token.git.txt | tr -d "\n" | wl-copy;
git push origin master;
ps aux | grep wl-copy;
exit 0;
