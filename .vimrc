
" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" colorscheme
Plugin 'altercation/vim-colors-solarized'
" easy file navigation
Plugin 'scrooloose/nerdtree'
" does some stuff
Plugin 'L9'
" better file search
Plugin 'vim-scripts/FuzzyFinder'
" status bar
Plugin 'itchyny/lightline.vim'
" better selection
Plugin 'terryma/vim-expand-region'
" syntax my dude
Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on

" something to do with file changes
set autoread

" show last command (i think)
set showcmd
set showmode

"run jshint only on save
let JSHintUpdateWriteOnly=1

" syntax highlighting
syntax enable
" no idea what this fella does
set grepprg=grep\ -nh\ $*

" self explanatory
set autoindent
set lazyredraw

" keep lines above/below
set scrolloff=7

" history (don't want a repeat of CSCI-251 project :( )
set history=500

" spaces > tabs
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" tab completion?
set wildmenu
set wildmode=list:longest,full

" why doesnt backspace work normally by default
set backspace=2

" line numbers
set number

autocmd InsertEnter * :set relativenumber!
autocmd InsertLeave * :set relativenumber
autocmd BufNewFile  * :set relativenumber
autocmd BufReadPost * :set relativenumber

" i hate captialization
set ignorecase
set smartcase

" jk exits insert mode
inoremap jk <Esc>

" something about searching
set incsearch
set hlsearch

set laststatus=2
" in case plugins aren't installed
" full filename[flags] --- Filetype [R: row/C: col] Percent 
set statusline=%F%m%r%h%w%=\{%Y}\ [R:%l/C:%v]\ %p%%

" i think this terminal is kinda fast
set ttyfast

" i hate sounds
set noerrorbells

" colorscheme
set t_Co=256
set background=dark
colorscheme solarized
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ }
hi Normal ctermbg=black

" cursor line
set cursorline
hi CursorLine ctermbg=23

" column line
set cursorcolumn
hi CursorColumn ctermbg=23

" 80 character limit
set colorcolumn=80
hi ColorColumn ctermbg=1

" show matching brackets
set showmatch

set timeoutlen=150

" vim expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" leader stuff
let mapleader="\<Space>"
" open nerdtree
map <Leader>n :NERDTree<cr>
" save
map <Leader>w :w<cr>
" quit
map <Leader>q :q<cr>
" save & quit
map <Leader>wq :wq<cr>
" vsplit
map <Leader>vs :vsplit 
" delete without copying
nnoremap sd "_d

" syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '⚠️'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
