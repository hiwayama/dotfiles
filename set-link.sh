#!/bin/sh

# post symbolic link of setting files
for dotfile in ".vimrc" ".vim" ".zshrc" ".tmux.conf" ".gitconfig" ".gemrc"
do  
  ln -s $HOME/dotfile/${dotfile} $HOME/${dotfile}
done

