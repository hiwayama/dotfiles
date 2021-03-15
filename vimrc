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

NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload': {'filetypes':['ruby', 'erb']}}
NeoBundleLazy 'plasticboy/vim-markdown', {'autoload': {'filetypes':['markdown']}}

call neobundle#end()

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,sjis,cp932,cp20932

filetype plugin indent on

syntax on
set modelines=5
set number
set directory=$HOME/.vim/tmp " Backup Directory
set clipboard=unnamed
set history=100 " keep 100 lines of command line history
set display=lastline

" Search
set hlsearch
set incsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" Cursorline
set cursorline cursorcolumn
highlight clear CursorLine
highlight CursorLine gui=underline ctermbg=black
highlight clear CursorColumn
highlight CursorColumn gui=underline ctermbg=black

" Statusline
set statusline=%F%m%r%h%w\%=%{fugitive#statusline()}[TYPE=%Y]\[ENC=%{&fileencoding}:%{&ff}]\[ROW=%l/%L]
set laststatus=2
highlight StatusLine ctermfg=Green
augroup ch_status_color
  autocmd! ch_status_color
  autocmd InsertEnter * highlight StatusLine ctermfg=Yellow
  autocmd InsertLeave * highlight StatusLine ctermfg=Green
augroup END

" Tab,Indent
set expandtab
set tabstop=2 softtabstop=0
set shiftwidth=2

" Key bind for Wraparound
set whichwrap=b,s,h,l,[,],<,>,~

" 行末スペース自動削除
autocmd BufWritePre * :%s/\s\+$//e

" load key mapping setting
source $HOME/.vim/vimrc.mapping
" load plugin dependent setting file
source $HOME/.vim/vimrc.plugins_setting

let omni_sql_no_default_maps=1
