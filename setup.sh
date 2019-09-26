#!/bin/bash
#====================================================================
# 『デスクトップ』『音楽』などの日本語フォルダー名を英語表記にする
#====================================================================
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

script_dir="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"
echo $script_dir

DOT_FILES=(.vimrc .bashrc .bashAliases .bash_profile .zshrc .zprofile .tmux.conf)
if [ ! -e $HOME/dotfiles ];then
  mkdir $HOME/dotfiles
fi

echo "================================"
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
echo "================================"

if type apt-get > /dev/null 2>&1; then
    echo "apt-get exist!"     #コマンドが存在する時の処理
    echo "apt update & upgrade"
    yes | sudo apt-get update
    yes | sudo apt-get upgrade
    echo "install vim tmux zsh curl vlc build-essential openssh-server"
    sudo apt-get install -y vim tmux zsh curl vlc build-essential openssh-server
fi

UNAME="$(uname)"
echo "Install anyenv..."
if [ $UNAME = 'Darwin' ]; then
    brew install anyenv
elif [ $UNAME = 'Linux' ]; then
    git clone https://github.com/anyenv/anyenv ~/.anyenv
fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
exec $SHELL -l

echo "Install pyenv, nodenv..."
anyenv install pyenv
anyenv install nodenv

echo "Install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "DONE!"
