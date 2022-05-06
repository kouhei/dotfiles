echo "zprofile"

fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

export PATH="$PATH:$HOME/.tmux"
export PATH="$PATH:/usr/sbin"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

UNAME="$(uname)"
if [ $UNAME = 'Darwin' ]; then
  # export PATH="/usr/local/opt/openssl/bin:$PATH"
elif [ $UNAME = 'Linux' ]; then
    echo "this is Linux."
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
    export PATH="/usr/local/cuda/bin:$PATH"
fi
