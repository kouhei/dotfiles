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
    # TODO brew bundleにvscodeとかmasコマンド使うので先にtapとかvscodeのインストールとか必要かも
  fi
  echo "install packages"
  brew bundle
fi

echo "re-apply zshrc"
source $HOME/.zshrc

echo "setup"
git config --global ghq.root '~/src'

# https://macos-defaults.com/
echo "backup defaults to defaults-backup"
defaults read > defaults-backup
echo "modify settings"
defaults write com.apple.screencapture name "SS" # スクリーンショットの先頭の文字をSSに
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # 拡張子変更の警告なし
defaults write -g AppleShowAllExtensions -bool true # 拡張子表示
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # ネットワークディスク上に.DS_Storeを作らない
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "tilesize" -int 33
defaults write com.apple.dock "largesize" -int 66
defaults write com.apple.finder "ShowPathbar" -bool "true"
killall Dock
killall Finder

echo "modify dock"
./dock.sh

echo "Install node..."
volta install node@latest

echo "change default app"
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

# TODO:
# launchpadのグループ化制御できる？
# 設定の値いじれる？(キーボードとかマウスとかネットワーク、コントロールセンター,おやすみモード)

# direnv 使うと便利そう (https://zenn.dev/nakaatsu/articles/7133e16a0f787c#direnv)
# zpreztoまた使ってみる？

## 手作業 (qiitaか何かにまとめておきたい)
# vscodeの設定ファイルをコピペ
# git リポジトリのクローン
# googleカレンダーとかをネイティブアプリ化
# git のユーザー名とかSSH鍵の設定とか
# git config --global user.name "Your Name"
# git config --global user.email "your.email@bmail.com"
# https://qiita.com/39pon/items/225cd10a91f09705d788
# Google Meetなどのスクリーン共有機能を使う場合、あらかじめ設定をしておく必要があります。Macの設定の「Security & Privacy」中の「Screen Recording」から、「Google Chrome」をチェック。いざ会議中に設定しようとしても遅いのであらかじめやっておくのがおすすめです。(https://qiita.com/sh0nk/items/f88baa508746f06f30ed)
# postmanの設定
# メーラーなどのログイン?
# chrome拡張機能

echo "setup done!"
echo "reopen terminal & open vim and ':PlugInstall'"
