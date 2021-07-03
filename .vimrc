set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set showmatch " shows matching brackets
syntax on
set hlsearch
set number
set relativenumber

" not sure if I like this yet
set list  " shows end-of-line characters

nnoremap <tab>c :tabnew<cr>
nnoremap <tab>x :-tabnew<cr>
nnoremap <tab>n :tabnext<cr>
nnoremap <tab>p :tabprev<cr>
nnoremap <tab>m :tabmove +1<cr>
nnoremap <tab>o :tabmove -1<cr>

" clear out the search highlighting
nnoremap ,<space> :nohlsearch<cr>

nnoremap c8 *''cgn

" C-P for tab completion

