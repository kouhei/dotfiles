_itunes()
{
  local _list=$(itunes list)
  COMPREPLY=( $(compgen -W '${_list}' -- ${COMP_WORDS[COMP_CWORD]}) );
}
if [ $SHELL = "/bin/zsh" ];then
  compdef _itunes cmd
elif [ $SHELL = "/bin/sh" ];then
  complete -F _itunes -o default -o bashdefault itunes
fi
