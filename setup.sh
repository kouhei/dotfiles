#!/bin/sh

echo "link dotfiles"
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
    echo "already exists: $file"
  elif [ -L $HOME/$file ]; then
    echo "already exists(symbolic link): $file"
  else
    ln -s $script_dir/$file $HOME/$file
    echo "link: $file"
  fi
done
echo "================================"
echo "complete link"

echo "install packages"
UNAME="$(uname)"
if [ $UNAME = 'linux' ];then
  # 『デスクトップ』『音楽』などの日本語フォルダー名を英語表記にする
  env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update
  if type apt-get > /dev/null 2>&1; then
    echo "apt-get exist"
    ./aptEssentialsInstall.sh
  fi
fi
if [ $UNAME = 'Darwin' ]; then
  if type brew > /dev/null 2>&1; then
    echo "brew exist"
  else
    echo "Install HomeBrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  ./brewEssentialsInstall.sh
  ./appStore.sh
fi

# echo "Install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "setup done!"

echo "reopen terminal & open vim and `:PlugInstall`"