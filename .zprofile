echo "zprofile"

fpath=(/usr/local/share/zsh-completions $fpath)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:/usr/local/sbin:$PATH:/usr/sbin"

# export GOPATH=$HOME
# export PATH=$PATH:$GOPATH/bin

# UNAME="$(uname)"
# if [ $UNAME = 'Darwin' ]; then
#   # export PATH="/usr/local/opt/openssl/bin:$PATH"
# elif [ $UNAME = 'Linux' ]; then
#     echo "this is Linux."
# fi
