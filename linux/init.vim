call plug#begin('~/local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
" Git
Plug 'tpope/vim-fugitive'
" git diff
Plug 'mhinz/vim-signify'
" non-git diff
Plug 'jmcantrell/vim-diffchanges'
call plug#end()

call glaive#Install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /home/manlin/.config/formatters/google-java-format-1.9-all-deps.jar"

"###############################
"# GENERAL
"###############################
"set guicursor="True" "No cursor in INSERT MODE
"--| indentation
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set number relativenumber
set nu rnu

set hidden
set nowrap "wrapping the text if no more screen space

set clipboard+=unnamedplus
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set noshowmode "redundent due to lightline 
set incsearch
set scrolloff=8
set signcolumn=yes "for error messages or e.g. git
set colorcolumn=100
set cmdheight=2 "more space for displaying messages

"--| appearance
syntax on 
highlight Normal guibg=none
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE "transparent
"###############################
"# Lightline
"###############################
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

"###############################
"# REMAPS
"###############################
:imap jk <ESC>
nnoremap // :noh<return>

let mapleader = " "
nnoremap <leader>fg :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fmt :FormatCode<CR>
nnoremap <leader>ip :CocCommand java.action.organizeImports 
nnoremap <leader>df :DiffChangesDiffToggle<CR>

source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/signify.vim
