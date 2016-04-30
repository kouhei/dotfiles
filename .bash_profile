echo "bash_profile"
export PATH="/usr/local/sbin:$HOME/.tmux:$PATH"
export PATH="/usr/local/bin:$HOME/bin:$PATH"
export PATH=$PATH:/opt/local/bin
if [ -f /usr/local/lib/node_modules ]; then
  export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

UNAME="$(uname)"
if [ $UNAME = 'Darwin' ]; then
  PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\]"
  PATH=$PATH:$HOME/.nodebrew/current/bin
  GREP_OPTIONS="--color=always";export GREP_OPTIONS
  #export PATH=$PATH:$HOME/android-sdk-macosx/platform-tools/adb
  export PATH=$PATH:~/Library/Python/2.7/bin
  export GOPATH="$HOME/.go"
  export PATH="$PATH:$HOME/.go/bin"
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
elif [ $UNAME = 'Linux' ]; then
    echo "this is Linux."
fi
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
#pathの重複を修正
#typeset -U path cdpath fpath manpath
