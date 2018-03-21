" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
" colorscheme
Plugin 'altercation/vim-colors-solarized'
" better file search
Plugin 'vim-scripts/FuzzyFinder'
" status bar
Plugin 'itchyny/lightline.vim'
" better selection
Plugin 'terryma/vim-expand-region'
" syntax
Plugin 'scrooloose/syntastic'
" autoformat
Plugin 'Chiel92/vim-autoformat'
" comments
Plugin 'scrooloose/nerdcommenter'
" hardmode
Plugin 'takac/vim-hardtime'

" snippet support
Plugin 'SirVer/ultisnips'
" actual snippets
Plugin 'honza/vim-snippets'

" easy file navigation
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

" no idea what these fellas do
set grepprg=grep\ -nh\ $*
set lazyredraw
set autoread
set wildmenu
set wildmode=list:longest,full

" show last command
set showcmd
set showmode

"run jshint only on save
let JSHintUpdateWriteOnly=1

" syntax highlighting
syntax enable

" self explanatory
set autoindent

" keep lines above/below
set scrolloff=7

set history=500

set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" fix backspace
set backspace=2

" line numbers (relative in normal/visual, absolute in insert)
set number

autocmd InsertEnter * :set relativenumber! 
autocmd InsertLeave * :set relativenumber
autocmd BufNewFile  * :set relativenumber
autocmd BufReadPost * :set relativenumber

set ignorecase
set smartcase

set incsearch
set hlsearch

set laststatus=2
" in case plugins aren't installed
" full filename[flags] --- Filetype [R: row/C: col] Percent 
set statusline=%F%m%r%h%w%=\{%Y}\ [R:%l/C:%v]\ %p%%

set ttyfast

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

" half second delay for maps
set timeoutlen=500

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

" roll across keyboard to quit without saving [removed bc of dvorak]
" map <Leader>qwer :q!<cr> 

" vsplit
map <Leader>vs :vsplit

" jk exits insert mode [removed bc of dvorak]
" inoremap jk <C-[>
" jw exit insert mode and save
"inoremap jw <C-[>:w<cr>
" inoremap jwq <C-[>:wq<cr>

" stop highlighting
noremap <Leader>nh :noh<cr>
" delete without copying
nnoremap sd "_d
" autoindent whole file
nnoremap <Leader>if gg<cr>=G
" autoformat whole file
nnoremap <Leader>af :Autoformat<cr>

" syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
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

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" nerd commenter
let g:NERDSpaceDelims = 1

let g:hardtime_default_on = 0
let g:hardtime_timeout = 500
let g:hardtime_showmsg = 1

" experimental feature, trying to make dvorak usable by remaping the movement keys. 
" if you're looking at this on github, you probably don't want this.

nnoremap t j
nnoreamp n k
nnoremap s l
nnoremap j t
nnoremap k s
nnoremap l n
inoremap tn <C-[>

