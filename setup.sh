#!/bin/sh

echo "link dotfiles"
script_dir="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"
echo $script_dir
DOT_FILES=(.vimrc .bashAliases .zshrc .zprofile)
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

UNAME="$(uname)"
if [ $UNAME = 'Darwin' ]; then
  xcode-select --install # xcodeのCLIツールだけ
  if type brew > /dev/null 2>&1; then
    echo "brew exist"
  else
    echo "Install HomeBrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap homebrew/cask-drivers
  fi
  echo "install packages"
  ./brewEssentialsInstall.sh
  ./appStore.sh
fi

echo "setup"
source $HOME/.zshrc
git config --global ghq.root '~/src'
defaults write com.apple.screencapture name "SS" # スクリーンショットの先頭の文字をSSに

volta install node@latest

# デフォルトで開くアプリを変更
# duti -s org.videolan.vlc .mp3 all
# duti -s org.videolan.vlc .mp4 all
# duti -s abnerworks.Typora .md all
duti -s com.microsoft.VSCode .txt all
duti -s com.microsoft.VSCode .md all
duti -s com.microsoft.VSCode .js all
duti -s com.microsoft.VSCode .ts all
duti -s com.microsoft.VSCode .jsx all
duti -s com.microsoft.VSCode .tsx all
duti -s com.microsoft.VSCode .svg all
duti -s com.microsoft.VSCode .html all
duti -s com.microsoft.VSCode .css all
duti -s com.microsoft.VSCode .xml all
duti -s com.microsoft.VSCode .json all

killall Finder

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "setup done!"

echo "reopen terminal & open vim and ':PlugInstall'"
