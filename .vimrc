""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set mapleader
let mapleader=','
"no compatible with vi, required for vundle
set nocompatible

"line number
set number

"use hard tabs
set tabstop=8
set noexpandtab
set shiftwidth=8

"show title as console title bar
set title

"display incomplete commands in last line
set showcmd

"show matching braces
set showmatch

set nobackup

"file encodings
set fileencodings=utf-8,gbk,big5,ucs-bom,cp936
set encoding=utf8

"turn on commandline completion wildstyle overwritting status line
set wildmenu
set wildmode=longest:full,full

"set backspace more flexible
set backspace=eol,start,indent

"mouse 
set mouse=a
"share windows clipboard
"set clipboard+=unnamed
"set clipboard+="

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"new line has the same indent with previous line
set autoindent

"use C programing language to detece whether indent
set smartindent

"configure indent / clever indent for {,if,swith,etc.
set cindent

"enable filetypes
filetype plugin indent on

"use soft tabs for python
autocmd FileType python set et sta ts=4 sw=4


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Code Fold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enable fold
set foldenable
set foldnestmax=1
set foldmethod=syntax
"use space to toggle fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert
"colorscheme murphy

"enable syntax highlight
syntax on

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
"Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"always have a status line
set laststatus=2

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]

"allow displaying incomplete line
set display=lastline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"taglist setup
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close=1
let Tlist_WinWidth=32
nnoremap <silent> <F2> :TlistOpen<CR>

"the-nerd-tree:file explorer toggle
nnoremap <silent> <F9> :NERDTreeToggle<CR>

"use context to decide completion type
"let SuperTabDefaultCompletionType = "context"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Key Binding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"move among vim window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"close vim window
nnoremap <C-q> <C-w>q

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Template
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.c 0r $HOME/.vim/templates/c.tpl

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Session : restore cursor postion when leave / enter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set viewdir=$HOME/.vim/views/
"autocmd BufWinLeave * mkview!
"autocmd BufWinEnter * silent loadview

autocmd VimEnter * call LoadSession()
autocmd VimLeave * call SaveSession()
function! SaveSession()
	execute 'mksession! $HOME/.vim/sessions/session.vim'
endfunction
function! LoadSession()
	if argc() == 0
		execute 'source $HOME/.vim/sessions/session.vim'
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

filetype off

set runtimepath+=~/.vim/bundle/vundle/

call vundle#rc()
"let Vundle manage Vundle
Bundle 'gmarik/vundle'


Bundle 'ctags.vim'
Bundle 'taglist.vim'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'SuperTab-continued.'

"Required to use the indentation setting set by plugins
filetype plugin indent on
