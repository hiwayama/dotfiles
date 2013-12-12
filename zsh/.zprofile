# --------------------------------- #
# dotfiles/zsh/.zprofile
# 
#
# --------------------------------- #

# show ls when enter `cd`
function cd(){
  builtin cd $@ && ls -F;
}

# open Dictionary.app for mac OS only
function dict() {
  if [ "$@" = "" ]; then
    return
  elif [ `uname` = "Darwin" ]; then
    open "dict://$@"
    echo $@ >> $HOME/dict.log >> $HOME/dict.txt
    say  $@
  fi
}

# prompt-ruby-current
function prompt-current-ruby(){
  local name st color
  
  if [ ! `ls | grep -E -e '(\.rb)|(Rakefile)'` ]
  then
    return
  fi  

  name=`ruby -v | grep -Go -e 'ruby [0-9.p]\+'`
  if [[ -z $name ]]
  then
    return
  fi
  color="blue"
  echo "%F{$color}[$name]%f";
}


# prompt-git-current-branch
# http://smokycat.info/zsh/262より
function prompt-git-current-branch(){
  local name st color
  
  name=`git symbolic-ref HEAD 2> /dev/null`
  if [[ -z $name ]]
  then
    return
  fi

  name=`basename $name`

  st=`git status`
  if [[ -n `echo $st | grep "^nothing to"` ]]
  then
    color="green"
  else
    color="red"
  fi
  echo " on %F{$color}$name%f";
}
