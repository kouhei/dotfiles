#!/bin/bash

DOT_FILES=(.vimrc .bashrc .bashAliases .bash_profile .bash .zshrc)
for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    echo "既に存在します: $file"
    cp -r $file $HOME/dotfile$file 
  elif [ -n $HOME/$file ]; then
    echo "既に存在します(シンボリックリンクです): $file"
    cp -r $file $HOME/dotfile$file
  else
    ln -s $file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
