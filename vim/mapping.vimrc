" ===========================================
" dotfiles/vimrc.mapping
"
" Author: Hiromasa IWAYAMA
" ===========================================

"------------------------------------------
" Key Mapping
"------------------------------------------
" display lines moving
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap Y y$

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
