"The Basics
syntax on
set number
let mapleader = "-"
filetype plugin indent on
set linespace=0
set hlsearch
set autoindent
set shiftwidth=4
set expandtab
set softtabstop=4
set mouse=a
set ignorecase smartcase
set history=1000
set cursorline
set shiftround
set backspace=indent,eol,start

"Color Stuff
set background=dark
"let g:zenburn_high_Contrast=1
"colorscheme zenburn
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = "hard"
let g:airline_theme='gruvbox'
colorscheme gruvbox

"Keybindings
"Tab navigation
nnoremap <C-W>p :tabprevious<CR>
nnoremap <C-W>n :tabnext<CR>
nnoremap <C-W>c :tabnew<CR>
"New horizontal and vertical splits on - and |
nnoremap <C-W>- :new<CR>
nnoremap <C-W>\| :vnew<CR>
"Paste toggle on F2
set pastetoggle=<F2>
"Visual navigation, in case of line wraps
"also, arrow keys
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
"Mistyping
nnoremap Y y$
nnoremap ; :

"Pymode Stuff
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_rope = 0
let g:pymode_syntax_all = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_options_max_line_length=88
autocmd FileType python set colorcolumn=88
nnoremap <F8> :PymodeLint<CR>

"NERDTree Stuff
"Open NERDTree when passing no arguments to vim
"If in a repo, set the repo root as the nerdtree root
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeVCS | endif
"Open NERDTree if vim is opened with vim $some_dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"Completion by file type
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"Pathogen Stuff
call pathogen#infect()
call pathogen#helptags()

"Make the line length column less aggressive
highlight ColorColumn ctermbg=DarkCyan
