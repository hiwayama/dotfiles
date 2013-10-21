" ==================================================
" vim/ftdetect/ft.vim
"
" Author: Hiromasa IWAYAMA
" based on http://github.com/ymis1080/dotfiles
" ==================================================

autocmd BufNewFile,BufRead *.coffee   setl filetype=coffee
autocmd BufNewFile,BufRead *.R        setl filetype=R
autocmd BufNewFile,BufRead *.spec     setl filetype=ruby
autocmd BufNewFile,BufRead *.scala    setl filetype=scala

autocmd BufNewFile,BufRead *.psgi     setl filetype=perl
autocmd BufNewFile,BufRead *.t        setl filetype=perl
autocmd BufNewFile,BufRead *.spec     setl filetype=ruby
autocmd BufNewFile,BufRead *.scala    setl filetype=scala
autocmd BufNewFile,BufRead *.md       setl filetype=markdown

autocmd BufNewFile,BufRead *.html.ep  setl filetype=html
autocmd BufNewFile,BufRead *.tx       setl filetype=html
autocmd BufNewFile,BufRead *.tt       setl filetype=html
