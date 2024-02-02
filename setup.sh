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

# echo "re-apply zshrc"
# source $HOME/.zshrc

echo "start setup"

function setup {
  git config --global ghq.root '~/src'

  # ln -s $script_dir/dotfiles/.macup.cfg $HOME/.macup.cfg

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

  echo "Install node(latest LTS) ..."
  volta install node

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

  echo "setup vim"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function ask_yes_no {
  while true; do
    echo -n "$* [y/n]: "
    read ANS
    case $ANS in
      [Yy]*)
        return 0
        ;;
      [Nn]*)
        return 1
        ;;
      *)
        echo "yまたはnを入力してください"
        ;;
    esac
  done
}

if ask_yes_no "appStoreにログインした & vscodeのcodeコマンド使える? (Yy/Nn)"; then
  # ここに「Yes」の時の処理を書く
  setup
  echo "setup done!"
  echo "reopen terminal & open vim and ':PlugInstall' & 手作業！"
else
  # ここに「No」の時の処理を書く
  ask_yes_no
fi

# TODO:
# launchpadのグループ化制御できる？
# 設定の値いじれる？(キーボードとかマウスとかネットワーク、コントロールセンター,おやすみモード)

# direnv 使うと便利そう (https://zenn.dev/nakaatsu/articles/7133e16a0f787c#direnv)
# zpreztoまた使ってみる？
# mackup便利そう https://tech.nomunomu0504.dev/entry/2020/01/27/083000
## dotfilesを別の場所で管理してシンボリックリンクを貼ってる場合は面倒なようで使わないことにした
# caffeinate便利かも https://qiita.com/hakuro/items/c2302f1ad83bf3424a1a
