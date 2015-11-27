set t_co=256
set number
set background=dark
syntax on
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
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete