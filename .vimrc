set nocompatible
"##################################################
" Mac installation
"##################################################
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Runtimepath 
set rtp +=~/.vim
set rtp+=/usr/local/opt/fzf

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'           " Starting screen
Plug 'itchyny/lightline.vim'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'preservim/nerdtree'           " File explorer
Plug 'sheerun/vim-polyglot'         " Syntax highlighting
Plug 'Raimondi/delimitMate'         " Pair closing brackets
Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'

Plug 'google/vim-maktaba'           " Format code according to Google's coding style
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /Users/nam/.config/formatters/google-java-format-1.9-all-deps.jar"

"##################################################
"# Code format                                    #
"##################################################

noremap <C-X> :FormatCode<CR>

"##################################################
"# General                                        #
"##################################################

 " Remap <esc> key
:imap jk <Esc>

 " Abbreviations
abbr psvm public static void main(String[] args){<CR>}<esc>O
abbr com /**<CR><CR>/<Up>

 " lightline colorscheme
let g:lightline = {
      \ 'colorscheme': 'purify',
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
set ignorecase
set mouse=a " Else can't scroll on mac

 " Indentation (tabs)
filetype plugin indent on
set tabstop=2 " show existing tab with 2 spaces width
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set expandtab " On pressing tab, insert 2 spaces
set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation

" Hybrid line numbers
set number relativenumber
set nu rnu

set clipboard=unnamed " Point to the system clipboard
set ruler " Shows line and column position at bottom right corner
set showcmd
set noswapfile " Disable temp files
set noshowmode " Disable duplicate mode display at bottom
"set omnifunc=syntaxcomplete#Complete " Activate via C-X,C-O

set pastetoggle=<F2> " enable paste mode
set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searcher

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
nnoremap <silent> <C-i> :Files<CR>
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

" Completion
"" set dictionary+=/usr/share/dict/words " Dictionary, slow on laptop
"set complete+=k
"set completeopt=menuone,noinsert
set shortmess+=c                         " Removes unnecessary information
nnoremap __ :setlocal spell!<return>     " Toggle highlight misspelled words

" Sourcing
source $HOME/.config/nvim/plug-config/coc.vim

