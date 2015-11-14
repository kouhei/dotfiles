if [ "$(uname)" = "Darwin" ]; then
  if [ -e $HOME/.bash/itunes_completion.sh ]; then
    source $HOME/.bash/itunes_completion.sh
  fi
  eval "$(rbenv init -)"
  powerline-daemon -q
  . ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
fi

bashAliases=$HOME/.bashAliases
bash_aliases=$HOME/.bash_aliases
if [ -e $bashAliases ]; then
  . $bashAliases
elif [ -L $bashAliases ];then
  . $bashAliases
fi

if [ -e $bash_aliases ]; then
  echo "bash_aliases exist"
  . $bash_aliases
elif [ -L $bash_aliases ];then
  echo "bash_aliases ln"
  . $bash_aliases
fi
