#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"
echo $script_dir

DOT_FILES=(.vimrc .bashAliases .zshrc .zprofile .tmux.conf)
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

if [ $UNAME = 'linux' ];then
  # 『デスクトップ』『音楽』などの日本語フォルダー名を英語表記にする
  env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update
fi

if [ $UNAME = 'Darwin' ]; then
  if type brew > /dev/null 2>&1; then
    echo "brew exist!"
  else
    echo "Install HomeBrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
fi

echo "Install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "DONE!"
