set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
syntax on
set number
set hlsearch
map <C-L> :bnext<CR>
map <C-H> :bprev<CR>
command Dn  :set nonumber
command En  :set number
colorscheme molokai
:set formatoptions-=cro
let g:airline_theme='minimalist'

" Will only search case sensitive if there is a capital letter in the search
" string
:set ignorecase "Necessary in conjunction with smartcase
:set smartcase 
