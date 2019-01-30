""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
set nocompatible
set number
set nobackup

"use hard tabs
set tabstop=4
set shiftwidth=4
set smarttab
set noexpandtab

"turn off bell
set noeb vb t_vb=

"display incomplete commands in last line
set showcmd
set showmatch


"file encodings
set fileencodings=utf-8,gbk,big5,ucs-bom,cp936
set encoding=utf8

"turn on commandline completion wildstyle overwritting status line
set wildmenu
set wildmode=longest:full,full

"set backspace more flexible
set backspace=eol,start,indent


"for indent
set autoindent
set smartindent
set cindent


"use soft tabs for python
autocmd FileType python set et sta ts=4 sw=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
set t_Co=256
colorscheme termcolor
"colorscheme desert


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Search Match
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
"case still sensitive when one or more letter is capital
set smartcase
"high light the word when searching
set hlsearch
"increamental search
set incsearch



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

filetype off

set runtimepath+=~/.vim/bundle/vundle/

call vundle#begin()

Bundle 'gmarik/vundle'

Plugin 'vim-scripts/a.vim'
Plugin 'c.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree.git'
Plugin 'coolzyz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ternjs/tern_for_vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

"Required to use the indentation setting set by plugins
filetype plugin indent on
filetype plugin on



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins  & mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tagbar 
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 1
nmap <F3> :TagbarToggle<CR>

"ctags & cscope
set tags=tags
set tags+=/usr/include/tags
"use both cscope and ctag
set cscopetag
"show msg when cscope db added
set cscopeverbose
"use tags for definition search first
set cscopetagorder=1

"NEEDTree
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>


"move among vim window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"tab navigation
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tc :tabclose<CR>

"open filename under curor in new tab
nnoremap gf <C-W>gf

"quick op
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>wa :wa<CR>

"air line
let g:airline_theme='angr'

"ctrlsf
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_ignore_dir = ["node_modules", "tags"]
nmap     <Leader>n <Plug>CtrlSFCwordPath
vmap     <Leader>f <Plug>CtrlSFVwordExec 


"ctrlp
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"a.vim
nmap <CR> :AV<CR>

