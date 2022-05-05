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

if type gh > /dev/null 2>&1; then
  eval "$(gh completion -s zsh)"
fi

UNAME="$(uname)"
if [ $UNAME = 'Darwin' ]; then
  export PATH="/usr/local/opt/openssl/bin:$PATH"
elif [ $UNAME = 'Linux' ]; then
    echo "this is Linux."
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
    export PATH="/usr/local/cuda/bin:$PATH"
fi
