echo "zshrc"
autoload -U compinit
compinit
if [ "$(uname)" = 'Darwin' ];then
  #if [ -e $HOME/.bash/itunes_completion.sh ];then
  #  source $HOME/.bash/itunes_completion.sh
  #fi

  if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
  powerline-daemon -q
  source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
fi

if [ -e $HOME/.bashAliases ];then
  source $HOME/.bashAliases
elif [ -L $HOME/.bashAliases ];then
  source $HOME/.bashAliases
fi

if [ -e $HOME/.bash_aliases ];then
  source $HOME/.bash_aliases
elif [ -L $HOME/.bash_aliases ];then
  source $HOME/.bash_aliases
fi

# ディレクトリ名を入力するだけで移動
setopt auto_cd

# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd

# コマンド訂正
setopt correct

# cd した先のディレクトリをディレクトリスタックに追加する
# # ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# # `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

# # pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# # 拡張 glob を有効にする
# # glob とはパス名にマッチするワイルドカードパターンのこと
# # （たとえば `mv hoge.* ~/dir` における "*"）
# # 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# # どういう意味を持つかは `man zshexpn` の FILENAME GENERATION を参照
setopt extended_glob

# # 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# # コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups

# # コマンドがスペースで始まる場合、コマンド履歴に追加しない
# # 例： <Space>echo hello と入力
setopt hist_ignore_space

autoload -Uz zmv
alias zmv='noglob zmv -W'
alias zcp='zmv -C'
