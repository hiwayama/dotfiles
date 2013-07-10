" ==============================================
" dotfiles/vimrc
"
" Author: Hiromasa IWAYAMA
" based on http://github.com/ymis1080/dotfiles
" ==============================================

set nocompatible " vi interchange off
filetype off

" get current directory path
let scriptdir = fnamemodify("vimrc", ":p:h") . "/"

" vundleを使うためのおまじない
set rtp+=~/.vim/vundle.git/
call vundle#rc('~/.vim/bundle')

" Plugin list
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'plasticboy/vim-markdown'
Bundle 'derekwyatt/vim-scala'
Bundle 'vim-perl/vim-perl'
Bundle 'Shougo/unite.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'tpope/vim-fugitive'
"Bundle 'mdreves/vim-scaladoc' +pythonでvimをコンパイルしてから...
"Bundle 'scrooloose/syntastic' 保存が遅くなる...

syntax on
set number
set directory=$HOME/.vim/tmp " Backup Directory
set clipboard=unnamed
set history=100 " keep 100 lines of command line history

filetype plugin indent on

" Search
set hlsearch
set incsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" Cursorline
set cursorline
highlight clear CursorLine
highlight CursorLine gui=underline ctermbg=black

" Statusline
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[ENC=%{&fileencoding}:%{&ff}]\[ROW=%l/%L]
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

" Load Templates
augroup load_templates
  autocmd!
  autocmd BufNewFile *.haml 0r $HOME/.vim/template/template.haml 
  autocmd BufNewFile *.rb   0r $HOME/.vim/template/template.rb
  autocmd BufNewFile *.py   0r $HOME/.vim/template/template.py
  autocmd BufNewFile *.pl   0r $HOME/.vim/template/template.pl
  autocmd BufNewFile *.vim  0r $HOME/.vim/template/template.vim
  autocmd BufNewFile *Suite.scala 0r $HOME/.vim/template/template.suite.scala
augroup END

" load key mapping setting
source ~/dotfiles/vimrc.mapping

" load plugin dependent setting file
source ~/dotfiles/vimrc.plugins_setting

