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

"open .h accorrding .c/.cpp
Plugin 'vim-scripts/a.vim'
Plugin 'c.vim'
Plugin 'majutsushi/tagbar'
Plugin 'coolzyz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ternjs/tern_for_vim'
Plugin 'dyng/ctrlsf.vim'
"for lua
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'
"quick find file
Plugin 'ctrlpvim/ctrlp.vim'
"auto show function prototype 
Plugin 'mbbill/echofunc'
Plugin 'Shougo/neocomplete.vim'

call vundle#end()

"Required to use the indentation setting set by plugins
filetype plugin indent on
filetype plugin on



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins  & mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tagbar 
let g:tagbar_width=33
let g:tagbar_autofocus=1
let g:tagbar_left = 1
map <C-n> :TagbarToggle<CR>

"ctags & cscope
set tags=tags
set tags+=~/.vim/systags
"use both cscope and ctag
set cscopetag
"show msg when cscope db added
set cscopeverbose
"use tags for definition search first
set cscopetagorder=1


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


"neocomplete.vim
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

