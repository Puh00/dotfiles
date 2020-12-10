"##################################################
" Mac installation
"##################################################
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Runtimepath 
set rtp +=~/.vim

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'
Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

 " Commands
" Opens config file for Alacritty
:command Alcrit e C:\Users\alexp\AppData\Roaming\alacritty\alacritty.yml 

 " Remap <esc> key
:imap jk <Esc>

 " Abbreviations
abbr psvm public static void main(String[] args){<CR>}<esc>O
abbr sysout System.out.println("");<esc>2hi
abbr com /**<CR><CR>/<Up>

 " lightline colorscheme
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Basic
syntax on
set encoding=utf-8
set termguicolors
set laststatus=2
set showtabline=2
set background=dark
colorscheme purify
set number relativenumber
set ignorecase
set mouse=a " Else can't scroll on mac

 " Tabs
filetype plugin indent on
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces

set nu rnu
set clipboard=unnamed
set ruler
set showcmd
set noswapfile
set noshowmode
set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F2> " enable paste mode

set wildmenu "graphical auto complete menu
set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searcher

 " Autocompletion
set wildmode=longest,list,full

 " Fix splitting
set splitbelow splitright

" clears highlights
nnoremap // :noh<return> 

 " cursorline
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b

 " Fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <silent> <C-f> :Rg!

" NerdTree stuff
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoclose

" use ctrl+hjkl to move between split/vsplit panels
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
