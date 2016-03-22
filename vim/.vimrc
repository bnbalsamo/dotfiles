set number
set background=dark
let mapleader = "-"
syntax on
filetype plugin indent on
set linespace=0
set hlsearch
set autoindent
set shiftwidth=4
set expandtab
set softtabstop=4
nnoremap Y y$
nnoremap ; :
set mouse=a
set background=dark
colorscheme zenburn 
"Searches only case sensitive when uppercase is present
set ignorecase smartcase
set history=1000
set cursorline
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
set pastetoggle=<F2>
set shiftround
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
call pathogen#infect()
call pathogen#helptags()

let g:pymode = 1
let g:pymode_python = 'python'
let g:pymode_rope = 0
let g:pymode_syntax_all = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
nnoremap <F8> :PymodeLint<CR>
