call plug#begin('~/local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'gruvbox-community/gruvbox'
call plug#end()

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

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

"set noshowmode "add when lightline is added 
set incsearch
set scrolloff=8
set signcolumn=yes "for error messages or e.g. git
set colorcolumn=80
set cmdheight=2 "more space for displaying messages

"--| appearance
syntax on 
highlight Normal guibg=none
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE "transparent

"###############################
"# REMAPS
"###############################
:imap jk <ESC>
nnoremap // :noh<return>

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').git_files()<CR>

