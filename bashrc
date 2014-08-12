# ------------------------- #
# dotfiles/bashrc
# 
# Author: Hiromasa IWAYAMA 
# ------------------------- #


export EDITOR='vim'

# alias
if [ -f ${HOME}/.aliases ]; then
  source ${HOME}/.aliases
fi
