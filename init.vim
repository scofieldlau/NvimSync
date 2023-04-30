" ===================================
" === Editor setup ===
" ===================================

" syntax on
" set nocompatible
" filetype on
" filetype indent on
" filetype plugin on
" filetype plugin indent on
"
let mapleader=" " 
let g:mapleader=" "

lua require('plugins')
lua require('plugin-config')
lua require('lsp/setup')

let g:python3_host_prog = '/usr/local/bin/python3'
set pastetoggle=<F2>
set clipboard=unnamed
set encoding=utf-8
let &t_ut=''
set autochdir

set exrc
set secure
set number
set relativenumber
set cursorline
set hidden

set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set wrap
set tw=0  " Disable long line auto broken
set ttimeoutlen=0
set notimeout
"set list
"set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set viewoptions=cursor,folds,slash,unix
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set colorcolumn=100
set updatetime=100
set virtualedit=block
set hlsearch
set incsearch
set backspace=indent,eol,start

silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif


" ==========================
" === Terminal Behaviors ===
" ==========================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>


"-------------------------------------------Tricks
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" json format
" com! FormatJSON %!python3 -m json.tool

"-------------- Show different cursor in different mode
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"-------------------------------------------- Map keys

inoremap jj <ESC>`^

"inoremap <leader>w <Esc>:w<cr>
"noremap <leader>w :w<cr>

" Edit
" noremap W :w<CR>
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap R :source $MYVIMRC<CR>
noremap <leader>rc :e $MYVIMRC<CR>

" Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>

noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sv <C-w>t<C-w>H
" Place the two screens side by side
noremap sp <C-w>t<C-w>K

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" ------------------------------------------------Plugins
call plug#begin(stdpath('data') . '/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.

Plug 'mhinz/vim-startify'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
"Plug 'connorholyday/vim-snazzy'
Plug 'theniceboy/nvim-deus'
call plug#end()

" color deus

"let g:SnazzyTransparent = 1
"color snazzy

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

exec "nohlsearch"
