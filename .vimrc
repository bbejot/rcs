set number
set relativenumber

set smarttab
set tabstop=4
set expandtab
set softtabstop=2
set shiftwidth=2
set autoindent

set hlsearch
set backspace=indent,eol,start

filetype plugin indent on
retab

set visualbell
set t_vb=

nnoremap Q :echo "Ex mode disabled"<CR>
nnoremap H h:echo "CAPSLOCK is on"<CR> 
nnoremap J j:echo "CAPSLOCK is on"<CR> 
nnoremap K k:echo "CAPSLOCK is on"<CR> 
nnoremap L L:echo "CAPSLOCK is on"<CR> 

nnoremap <tab>c :tabnew<cr>
nnoremap <tab>x :-tabnew<cr>
nnoremap <tab>n :tabnext<cr>
nnoremap <tab>p :tabprev<cr>
nnoremap <tab>m :tabmove +1<cr>
nnoremap <tab>o :tabmove -1<cr>

function! SmartTabComplete()
  let prechar = strpart(getline('.'), col('.')-2, 1)
  let match_chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_.:/0123456789"
  if (len(matchstr(prechar, "[".match_chars."]"))==1)
    return "\<C-P>"
  else
    return "\<tab>"
  endif
endfunction

inoremap <tab> <c-r>=SmartTabComplete()<CR>

nnoremap B :ls<cr>:b<space>

set showmatch " shows matching brackets
syntax on

" clear out the search highlighting
nnoremap ,<space> :nohlsearch<cr>

" not sure if I like this yet
"set list  " shows end-of-line characters
