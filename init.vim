let s:local_vimrc = expand('$LOCALAPPDATA\nvim\init.local.vim')
if filereadable(fnameescape(s:local_vimrc))
  execute 'source ' . fnameescape(s:local_vimrc)
endif
unlet! s:local_vimr

call plug#begin('~/AppData/Local/nvim/plugged')

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

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

 " Nerdtree autoclose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

 " Startify
let s:header = [
 \ '                       .,,uod8B8bou,,.                              ',
 \ '              ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.                     ',
 \ '         ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||                    ',
 \ '         !...:!TVBBBRPFT||||||||||!!^^""`   ||||                    ',
 \ '         !.......:!?|||||!!^^""`            ||||                    ',
 \ '         !.........||||                     ||||                    ',
 \ '         !.........||||  ##                 ||||                    ',
 \ '         !.........||||                     ||||                    ',
 \ '         !.........||||                     ||||                    ',
 \ '         !.........||||                     ||||                    ',
 \ '         !.........||||                     ||||                    ',
 \ '         `.........||||                    ,||||                    ',
 \ '          .;.......||||               _.-!!|||||                    ',
 \ '   .,uodWBBBBb.....||||       _.-!!|||||||||!:´                     ',
 \ '!YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb....                ',
 \ '!..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.              ',
 \ '!....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.            ',
 \ '!......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^"`;:::       `.          ',
 \ '!........YBBBBBBBBBBRPFT?!::::::::::^''...::::::;         iBBbo.    ',
 \ '`..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo.  ',
 \ '  `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^` ',
 \ '    `........::::::::::::::::;iof688888888888888888888b.     `      ',
 \ '      `......:::::::::;iof688888888888888888888888888888b.          ',
 \ '        `....:::;iof688888888888888888888888888888888899fT!         ',
 \ '          `..::!8888888888888888888888888888888899fT|!^"´           ',
 \ '            `~ !!988888888888888888888888899fT|!^"´                 ',
 \ '                `!!8888888888888888899fT|!^"´                       ',
 \ '                  `!988888888899fT|!^"´                             ',
 \ '                    `!9899fT|!^"´                                   ',
 \ '                      `!^"´                                         ',
 \ '',
 \]
" Center the header
function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 10) - (longest_line / 10)) . v:val') 
  "change 10 -> 2 for smaller ascii art
  return centered_lines
endfunction

let g:startify_custom_header = s:center(s:header)

 " Commands
" Opens config file for Alacritty
:command Alcrit e C:\Users\alexp\AppData\Roaming\alacritty\alacritty.yml 

 " Remap <esc> key
:imap jk <Esc>

 " Tabs
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

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
colorscheme onedark
set ignorecase

" Hybrid line numbers
set number relativenumber
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

set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searcher

 " Autocompletion
set wildmenu "graphical auto complete menu
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
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>
"nnoremap <silent> <C-f> :Rg!

" NerdTree stuff
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"let g:python3_host_prog = 'C:\Users\alexp\AppData\Local\Microsoft\WindowsApps'
" Python 3 provider {{{2
let s:python3_host_prog = expand('C:\Users\alexp\AppData\Local\Programs\Python\Python39\python.exe')
if filereadable(fnameescape(s:python3_host_prog))
  let g:python3_host_prog = fnameescape(s:python3_host_prog)
else
  unlet! g:python3_host_prog
endif

