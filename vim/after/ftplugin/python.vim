" ==========================================
" dotfiles/vim/after/ftplugin/python.vim
"
" Author: Hiromasa IWAYAMA
" ==========================================

if exists("b:did_ftplugin_python")
  finish
endif
let b:did_ftplugin_python=1

setlocal autoindent
setlocal smartindent cinwords=if,elif,else,for,while,try,except,def,class

