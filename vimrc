" ==============================================
" dotfiles/vimrc
"
" Author: Hiromasa IWAYAMA
" based on http://github.com/hiwayama/dotfiles
" ==============================================

if 0 | endif

" neobundle
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Plugin list
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'junegunn/vim-easy-align'

NeoBundleLazy 'plasticboy/vim-markdown', {'autoload': {'filetypes':['markdown']}}

call neobundle#end()

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,sjis,cp932,cp20932

" load basic settings
source ${HOME}/.vim/basic.vimrc
" load key mapping setting
source $HOME/.vim/mapping.vimrc
" load plugin dependent setting file
source $HOME/.vim/plugins_setting.vimrc

let omni_sql_no_default_maps=1
