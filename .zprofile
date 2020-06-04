echo "zprofile"
export PATH="$PATH:$HOME/.tmux"
export PATH="$PATH:/usr/local/Cellar/zplug/2.4.2"
export PATH="$PATH:/usr/sbin"
if [ -f /usr/local/lib/node_modules ]; then
  export NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules"
fi

if type anyenv > /dev/null 2>&1; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

UNAME="$(uname)"
if [ $UNAME = 'Darwin' ]; then
  #GREP_OPTIONS="--color=always";export GREP_OPTIONS
  #export PATH="$PATH:$HOME/android-sdk-macosx/platform-tools/adb"
  #export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
  export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
elif [ $UNAME = 'Linux' ]; then
    echo "this is Linux."
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
    export PATH="/usr/local/cuda/bin:$PATH"
    export PATH="$HOME/.nodenv/bin:$PATH"
    eval "$(nodenv init -)"
fi

#pathの重複を修正
#typeset -U path cdpath fpath manpath
