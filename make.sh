#!/bin/bash
############
# make.sh creates backs up all current dot-files
# in the home directory to old/ and creates symlinks
# for all the dotfiles in this directory
# to the home directory.
# Creates dot-files for zsh, vim, and tmux.
############

dir=~/dot-files
olddir=~/dot-files/old
files=".tmux .tmux.conf .vim .vimrc .zprezto .zpreztorc .zshrc"

mkdir -p $olddir

echo "Moving old dot files to $olddir and creating symlinks for the new files to the home directory."
for file in $files; do
	mv ~/.$file $olddir
	echo "Creating a symlink for $file"
	ln -s $dir/$file ~/$file
done
