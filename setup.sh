#!/bin/sh

DOT_FILES=(.vimrc .bashrc .bashAliases .bash_profile .bash)
cd $HOME
for file in ${DOT_FILES[@]}
do
  if [ -e $file ]; then
    echo "既に存在します: $file"
  elif [ -n $file ]; then
    echo "シンボリックリンクです"
  else
    ln -s dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
