" ==============================================
" Author: Hiromasa IWAYAMA
" based on http://github.com/ymis1080/dotfiles
" ==============================================

" vi互換off
set nocompatible

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

syntax on
set number
filetype plugin indent on
set directory=$HOME/.vim/tmp " Backup Directory
set clipboard=unnamed
set history=100 " keep 100 lines of command line history

" Search
set hlsearch
set incsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" Cursorline
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black


" Statusline
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[ROW=%l/%L]
set laststatus=2
augroup ch_status_color
  autocmd! ch_status_color
  autocmd InsertEnter * highlight StatusLine ctermfg=Yellow
  autocmd InsertLeave * highlight StatusLine ctermfg=Green
augroup END

" Tab,Indent
set expandtab
set tabstop=2 softtabstop=0
set shiftwidth=2
set smartindent

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

" Closing Parenthesis Complement
inoremap {<CR> {<CR>}<Up><End><CR>
inoremap (<CR> (<CR>)<Up><End><CR>
inoremap [<CR> [<CR>]<Up><End><CR>

" Symbol Alias
inoremap <C-d> $
inoremap <C-a> @

" Set filetypes
autocmd BufNewFile,BufRead *.coffee   setl filetype=coffee
autocmd BufNewFile,BufRead *.R        setl filetype=R
autocmd BufNewFile,BufRead *.psgi     setl filetype=perl
autocmd BufNewFile,BufRead *.t        setl filetype=perl
autocmd BufNewFile,BufRead *.html.ep  setl filetype=html
autocmd BufNewFile,BufRead *.spec     setl filetype=ruby

" Load Templates
augroup load_templates
  autocmd!
  autocmd BufNewFile *.haml 0r $HOME/.vim/template/template.haml
  autocmd BufNewFile *.rb 0r $HOME/.vim/template/template.rb
  autocmd BufNewFile *.py 0r $HOME/.vim/template/template.py
  autocmd BufNewFile *.pl 0r $HOME/.vim/template/template.pl
augroup END


" makefile Settings
autocmd FileType make setl noexpandtab

" python Settings
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


" ------------------------------
" Neosnippet Settings
" ------------------------------

" Plugin key-mappings. for neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" -------------------------
" Neocomplcache Settings
" -------------------------
	
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
 

