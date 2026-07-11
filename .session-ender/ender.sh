#!/bin/bash

# update the solved problems
grep -o "adventofcode.*" $HOME/.local/share/lf/tags | sort -n | tree --fromfile > README.txt;
# do the git stuff
git add .
read -p "Message to commit: " msg;
git commit -m "$msg";
cat $HOME/.config/token.git.txt | tr -d "\n" | wl-copy;
git push origin master;
