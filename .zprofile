echo "zprofile"
export PATH="/usr/local/sbin:$HOME/.tmux:$PATH"
export PATH="/usr/local/bin:$PATH"
if [ -f /usr/local/lib/node_modules ]; then
  export NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules"
fi

UNAME="$(uname)"
if [ $UNAME = 'Darwin' ]; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
  GREP_OPTIONS="--color=always";export GREP_OPTIONS
  #export PATH="$PATH:$HOME/android-sdk-macosx/platform-tools/adb"
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PATH="$PATH:$HOME/Library/Python/2.7/bin"
elif [ $UNAME = 'Linux' ]; then
    echo "this is Linux."
fi

#pathの重複を修正
#typeset -U path cdpath fpath manpath
