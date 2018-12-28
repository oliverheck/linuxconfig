execute pathogen#infect()

filetype off
set runtimepath+=/usr/local/share/lilypond/current/vim/
filetype on
syntax on

filetype plugin indent on

syntax on

let g:tex_flavor='latex'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_DefaultTargetFormat = 'pdf'

command! Lily :!/usr/bin/lilypond --output="%:h" %
command! Lua  :!/usr/bin/lualatex --shell-escape %:t
command! Lup  :!/usr/bin/lualatex --shell-escape %:t && pdfjam --nup 2x1 "%:r.pdf" --landscape --a4paper --outfile "%:r2.pdf"
command! Lpb  :!/usr/bin/lilypond-book %:t && pdflatex "%:r.tex" && pdfjam --nup 2x1 "%:r.pdf" --landscape --a4paper --outfile "%:r2.pdf"

command! Pdf :!qpdfview "%:r.pdf" &

autocmd BufNewFile,BufRead *.lytex set syntax=lilypond

let mapleader = " "
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>lu :w<CR>:Lua<cr>
nnoremap <leader>lpb :w<cr>:Lpb<cr>
nnoremap <leader>l2 :w<CR>:Lup<cr>
nnoremap <leader>cho :%s/(\(\u.\{-}\))/^{\1}/g<cr>
