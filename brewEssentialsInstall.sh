#!/bin/sh
echo "install from brew"
brew install peco git volta mas pure gh ghq trash duti wget tree exa fd jq
# cask (--caskオプションなしだとCLIのdockerが入ってしまう)
brew install --cask docker visual-studio-code clipy appcleaner google-chrome deepl rectangle scroll-reverser karabiner-elements bitwarden raycast qlmarkdown postman logitech-options the-unarciver discord slack sourcetree figma

# font https://github.com/yuru7/PlemolJP
# source han code だとhomebrewで管理できないのでこれ使う。
brew tap homebrew/cask-fonts
brew install font-plemol-jp
brew install font-plemol-jp-nf
brew install font-plemol-jp-hs

echo "done"
