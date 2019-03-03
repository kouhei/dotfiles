#!/bin/bash
LANG=C xdg-user-dirs-gtk-update

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
  elif [ -L $HOME/$file ]; then
    echo "既に存在します(シンボリックリンクです): $file"
  else
    ln -s $script_dir/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done

sudo apt-get install vim tmux zsh curl vlc build-essential openssh-server

echo "Install vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo "Install pyenv..."
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo "Install nodebrew..."
curl -L git.io/nodebrew | perl - setup
