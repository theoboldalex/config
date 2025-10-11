syntax on
let mapleader=" "
let g:netrw_banner=0
set path+=**
set nu
set relativenumber
set softtabstop=4
set sw=4
set smarttab
set expandtab
set autoindent
set smartindent
set scrolloff=10
set noswapfile
set nohlsearch
set grepprg=rg\ -S\ --hidden\ --vimgrep
set grepformat=%f:%l:%c:%m

nnoremap <leader>sf :find 
nnoremap <leader>sg :grep 
nnoremap <leader>sb :b 
nnoremap b] :bn<cr>
nnoremap b[ :bp<cr>
nnoremap c] :cn<cr>
nnoremap c[ :cp<cr>
nnoremap cx :ccl<cr>
nnoremap co :copen<cr>
nnoremap - :E<cr>
