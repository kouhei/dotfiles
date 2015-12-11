echo "bash_profile"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH=$PATH:/opt/local/bin
if [ -f /usr/local/lib/node_modules  ]; then
  export NODE_PATH=/usr/local/lib/node_modules
fi

if [ "$(uname)" = 'Darwin' ]; then
  PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\]"
  PATH=/Users/kohei/.nodebrew/current/bin:$PATH
  GREP_OPTIONS="--color=always";export GREP_OPTIONS
 # export PATH=$PATH:/Users/kohei/android-sdk-macosx/platform-tools/adb
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
 # export PATH=$PATH:~/Library/Python/2.7/bin
#else
 # if [ "$(uname)" = 'Linux' ]; then
 #   echo "this is Linux."
 # fi
fi
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
