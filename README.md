# 手順
1. mkdir -r $HOME/src/github.com/kouhei
2. cd $HOME/src/github.com/kouhei
3. git clone https://github.com/kouhei/dotfiles.git
4. 適したブランチを選択
5. ./setup.sh
6. ターミナル開き直す
7. vimを開いて':PlugInstall'
8. 手作業系

# 手作業
- ソフトウェアアップデート
- vscodeの設定ファイルをコピペ
- git のユーザー名とかSSH鍵の設定とか
  - https://qiita.com/ucan-lab/items/aadbedcacbc2ac86a2b3#git%E5%88%9D%E6%9C%9F%E8%A8%AD%E5%AE%9A%E6%89%8B%E9%A0%86%E5%BF%85%E9%A0%88
  - git config --global user.name "Your Name"
  - git config --global user.email "your.email@bmail.com"
- メーラーや入れたアプリの設定 TODO: やったことまとめておく
  - Google Meetなどのスクリーン共有機能を使う場合、設定が必要。Macの設定の「Security & Privacy」中の「Screen Recording」から、「Google Chrome」をチェック。(https://qiita.com/sh0nk/items/f88baa508746f06f30ed)
  - chrome拡張機能
    - Adblock Plus / uBlock Origin
    - Google 翻訳
    - uBlacklist
    - User-Agent Switcher for Chrome
    - Video Speed Controller
    - Wappalyzer
    - Absolute Enable Right Click & Copy
    - WhatFont
    - CSSViewer
    - redux
- googleカレンダーとか必要なwebアプリをネイティブアプリ化
- git リポジトリのクローン