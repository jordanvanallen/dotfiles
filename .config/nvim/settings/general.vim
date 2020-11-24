" ===========================
" General
" ===========================

" Show the current line you are working on
set cursorline

set lazyredraw
set regexpengine=1

syntax enable

set backspace=indent,eol,start

" Yank to clipboard
set clipboard+=unnamedplus

set encoding=utf-8
set number relativenumber

set nobackup
set nowritebackup
set noswapfile

set hidden

set updatetime=300

" Coc - Don't pass messages to |ins-completion-menu|
set shortmess+=c

set autoindent
filetype plugin indent on

" Trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" Remove Satan's bell
set noeb vb t_vb=
autocmd GUIEnter * set visualbell t_vb=

