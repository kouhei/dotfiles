#!/bin/bash

DOT_FILES=( .vim .vimrc .bashrc .bashAliases .bash_profile .bash)

for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    echo "既に存在します: $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
