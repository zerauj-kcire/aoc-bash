#!/bin/bash

# update the solved problems
grep -o "adventofcode.*" $HOME/.local/share/lf/tags | sort -n | tree --fromfile > README.md;
# do the git stuff
git add .
read -s -p "Message to commit: " msg;
git commit -m "$msg";
cat $HOME/.config/token-git | tr -d "\n" | wl-copy;
git push origin master;
