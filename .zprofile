echo "zprofile"
export PATH="$PATH:$HOME/.tmux"
export PATH="$PATH:/usr/sbin"
if [ -f /usr/local/lib/node_modules ]; then
  export NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules"
fi

UNAME="$(uname)"
if [ $UNAME = 'Darwin' ]; then
  #GREP_OPTIONS="--color=always";export GREP_OPTIONS
  #export PATH="$PATH:$HOME/android-sdk-macosx/platform-tools/adb"
elif [ $UNAME = 'Linux' ]; then
    echo "this is Linux."
fi

#pathの重複を修正
#typeset -U path cdpath fpath manpath
