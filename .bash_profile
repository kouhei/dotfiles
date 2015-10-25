
#python
#export WORKON_HOME=~/.virtualenvs
#. /usr/local/bin/virtualenvwrapper.sh

export PATH="/usr/local/sbin:$PATH"

export PATH=$PATH:/opt/local/bin
if [ -f /usr/local/lib/node_modules  ]; then
  export NODE_PATH=/usr/local/lib/node_modules
fi

if [ "$(uname)" = 'Darwin' ]; then
 # export LSCOLORS=xbfxcxdxbxegedabagacad
  PATH=/Users/kohei/.nodebrew/current/bin:$PATH
  GREP_OPTIONS="--color=always";export GREP_OPTIONS
  export PATH=$PATH:/Users/kohei/android-sdk-macosx/platform-tools/adb
else
  echo "this is not mac."
  if [ "$(uname)" = 'Linux' ]; then
    echo "this is Linux."
  fi
fi
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
