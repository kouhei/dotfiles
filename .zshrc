echo "zshrc"
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
  fi

fpath+=("$HOME/.anyenv/envs/nodenv/versions/11.13.0/lib/node_modules/pure-prompt/functions") # TODO: anyenvを使ってないからパスを変えること


# 色を使用出来るようにする
autoload -Uz colors
colors

# プロンプト
# autoload -Uz promptinit
# promptinit
# prompt pure

# 補完機能を有効にする
autoload -U compinit
compinit -u
setopt auto_list         # 補完候補を一覧で表示する(d)
setopt auto_menu         # 補完キー連打で補完候補を順に表示する(d)
setopt correct           # コマンドのスペルを訂正する
setopt list_packed       # 補完候補をできるだけ詰めて表示する
setopt list_types        # 補完候補にファイルの種類も表示する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
# マッチング規則の変更をまずなし（''）でやって，マッチするものがなければ 'm:{a-z}={A-Z} r:|[-_.]=**' で小文字を大文字に置換しつつ補完すると同時に，右側に-か_か.が来る所には * を補ったかのように補完して、それでもなければ大文字を小文字に置き換えるルールを追加して補完する
# https://gihyo.jp/dev/serial/01/zsh-book/0005
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} r:|[-_.]=**' '+m:{A-Z}={a-z}'
zstyle ':completion:*' ignore-parents parent pwd .. # ../ の後は今いるディレクトリを補完しない
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 履歴
HISTTIMEFORMAT='%F %T '     # 履歴に実行日時も追加
setopt HIST_IGNORE_DUPS     # 前と重複する行は記録しない
setopt HIST_IGNORE_ALL_DUPS # 履歴中の重複行をファイル記録前に無くす
setopt hist_ignore_space    # コマンドがスペースで始まる場合、コマンド履歴に追加しない
setopt HIST_FIND_NO_DUPS    # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt hist_reduce_blanks   # ヒストリに保存するときに余分なスペースを削除する
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
bindkey '^R' history-incremental-pattern-search-backward # ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
# autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end #sudo の後のコマンドでエイリアスを有効にする

# cd
setopt auto_cd           # ディレクトリ名を入力するだけで移動
setopt auto_pushd        # 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt pushd_ignore_dups # pushd したときディレクトリがすでにスタックにあれば追加しない

# そのほか
setopt extended_glob        # 拡張 glob を有効にする(# ~ ^ もパターンとして扱われる)
setopt print_eight_bit      # 日本語ファイル名を表示可能にする
setopt no_beep              # beep を無効にする
setopt ignore_eof           # Ctrl+Dでzshを終了しない
setopt interactive_comments # '#' 以降をコメントとして扱う
#export EDITOR=vim          # エディタをvimに設定
bindkey -e                  # キーバインドをemacsモードに設定
autoload -Uz zmv
alias zmv='noglob zmv -W'
alias zcp='zmv -C'
fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# コンパイル
if [ $HOME/.zshrc -nt $HOME/.zshrc.zwc ];then
  echo "compiling zshrc..."
  zcompile $HOME/.zshrc
fi
if [ $HOME/.bashAliases -nt $HOME/.bashAliases.zwc ];then
  echo "compiling bashAliases..."
  zcompile $HOME/.bashAliases
fi

if [ "$(uname)" = 'Darwin' ];then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi


#export LDFLAGS="-L/usr/local/opt/python@3.8/lib"
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# https://weblog.bulknews.net/ghq-peco-percol-b6be7828dc1b
function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

### 過去に移動したことのあるディレクトリを選択。ctrl-uにバインド
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^u' peco-cdr

# ブランチを簡単切り替え。gcoで実行できる
alias -g gco='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'


if [ -e $HOME/.bashAliases ];then
  source $HOME/.bashAliases
elif [ -L $HOME/.bashAliases ];then
  source $HOME/.bashAliases
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
