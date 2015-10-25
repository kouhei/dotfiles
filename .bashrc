if [ "$(uname)" = "Darwin" ]; then
  if [ -e $HOME/.bash/itunes_completion.sh ]; then
    source $HOME/.bash/itunes_completion.sh
  fi
  eval "$(rbenv init -)"
fi

if [ -f ~/.bashAliases  ]; then
  . ~/.bashAliases
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
function cl(){
  cd $1;
  ls;
}
function cla(){
  cd $1;
  ls -alF;
}
function mkdirls(){
  mkdir $1;
  cd $1;
}
