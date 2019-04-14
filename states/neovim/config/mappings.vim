""" Define map <Leader>
let mapleader = ","

""" Additionnal Mappings
nnoremap ; :
nmap <silent> ./ :nohlsearch<CR>

tnoremap <Esc> <C-\><C-n>

" Make these commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" open help in a new tab
cabbrev help tab help

" Make navigating long, wrapped lines behave like normal lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
noremap <silent> _ g_

" use 'Y' to yank to the end of a line, instead of the whole line
noremap <silent> Y y$
