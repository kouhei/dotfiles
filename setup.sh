#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"
echo $script_dir

DOT_FILES=(.vimrc .bashrc .bashAliases .bash_profile .zshrc .zprofile .tmux.conf)
if [ ! -e $HOME/dotfiles ];then
  mkdir $HOME/dotfiles
fi

for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    echo "既に存在します: $file"
    cp -r $script_dir/$file $HOME/dotfiles/dotfile$file
  elif [ -L $HOME/$file ]; then
    echo "既に存在します(シンボリックリンクです): $file"
    cp -r $script_dir/$file $HOME/dotfiles/dotfile$file
  else
    ln -s $script_dir/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
