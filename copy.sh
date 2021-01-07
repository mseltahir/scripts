#!/bin/bash

# Used for backing up dotfiles to git.

cp ~/.bash_aliases ~/scripts
cp ~/.bashrc ~/scripts
cp ~/.vimrc ~/scripts
cp -r ~/.config/sublime-text-3/Packages/User ~/scripts/Sublime-text/