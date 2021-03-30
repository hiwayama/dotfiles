" ==============================================
" dotfiles/.vim/basic.vimrc
"
" independent ViM plugin
"
" Author: Hiromasa IWAYAMA
" based on http://github.com/hiwayama/dotfiles
" ==============================================

filetype plugin indent on

syntax on
set modelines=5
set number
set directory=$HOME/.vim/tmp " Backup Directory
set clipboard=unnamed
set history=100 " keep 100 lines of command line history

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
set statusline=%F%m%r%h%w\%=%[TYPE=%Y]\[ENC=%{&fileencoding}:%{&ff}]\[ROW=%l/%L]
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

"------------------------------------------
" Key Mapping
"------------------------------------------
" display lines moving
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" alternative to <ESC>
inoremap <C-j> <esc>

" Closing Parenthesis Complement
inoremap {<CR> {<CR>}<Up><End><CR>
inoremap (<CR> (<CR>)<Up><End><CR>
inoremap [<CR> [<CR>]<Up><End><CR>
"inoremap <C-s> <Esc>:w<Enter>i

inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>


" add space next to dot
inoremap , ,<Space>