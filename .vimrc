" Autoload VIM Plug for new machines
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===========================
" General
" ===========================

" Fix slowdowns with Powerline/Airline when switching to and from insert mode
" https://github.com/vim-airline/vim-airline/issues/421
" https://medium.com/usevim/powerline-escape-fix-e849fd07aad0
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

set lazyredraw
set regexpengine=1

syntax enable

set backspace=indent,eol,start

let g:mapleader = ","

set encoding=utf-8
set number relativenumber

set nobackup
set noswapfile

filetype plugin indent on
set autoindent

" Open vimrc file
nnoremap <Space>fed :e ~/dotfiles/.vimrc<CR>

" Trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" Remove bell
set noeb vb t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Windows
nnoremap <silent> <Space>w/ :vsplit<CR>
nnoremap <silent> <Space>w- :split<CR>
nnoremap <silent> <Space><Tab> :b#<CR>

" Sensible buffer movement
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

call plug#begin('~/.vim/addons')

" ===========================
" General
" ===========================

" Make VIM sensible
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'wellle/targets.vim'

" VIM language pack
Plug 'sheerun/vim-polyglot'

" Distration free writing when needed
Plug 'junegunn/goyo.vim'
" {
  nnoremap <Leader>G :Goyo<CR>
" }

" Autocompletion
Plug 'lifepillar/vim-mucomplete'
" {
  set completeopt+=menuone,noselect
  set shortmess+=c " Shut off completion messages

  " Sensible navigation of completion buffers
  inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

  let g:mucomplete#enable_auto_at_startup = 1
" }

" Autopairing
Plug 'vim-scripts/auto-pairs-gentle'

" Fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {
  let g:fzf_buffers_jump = 1
  let g:fzf_tags_command = 'ctags -R'

  let g:fzf_action = {
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  let g:fzf_colors =
    \ { 'fg':    ['fg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  nmap ; :Buffers<CR>
  nnoremap <Leader>f :Files<CR><Space>
  nnoremap <Leader>s :Rg<CR>
  nnoremap <Leader>h :History<CR>
  nnoremap <Leader>H :History:<CR>

  set tags=./tags,tags;$home
  nnoremap <silent> <Leader>gt :!ctags -R<CR>
  nnoremap <silent> <c-p> :call fzf#vim#tags("'" . expand('<cword>'))<cr>
" }

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'edkolev/tmuxline.vim'
" {
  let g:airline_powerline_fonts = 1
  let g:airline_skip_empty_sections = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_theme = 'bubblegum'

  " Display ALE errors on status line
  let g:airline#extensions#ale#enabled = 1
" }

Plug 'wsdjeg/FlyGrep.vim'
" {
  nnoremap <Leader>S :FlyGrep<CR>
" }

" Colourscheme
Plug 'liuchengxu/space-vim-theme'
Plug 'liuchengxu/space-vim-dark'
Plug 'chriskempson/base16-vim'
Plug 'drewtempelmeyer/palenight.vim'
nnoremap <Leader>C :colorscheme base16-

" Tableize things!
Plug 'godlygeek/tabular'
" {
  vmap t :Tabularize<Space>/
" }

" Rename files easily
Plug 'danro/rename.vim'
" {
  nnoremap <silent> <Space>fR :Rename<Space>
" }

" Deal with REPL easier
Plug 'jpalardy/vim-slime'
" {
  let g:slime_target = "tmux"
" }

" ===========================
" Testing
" ===========================

Plug 'christoomey/vim-tmux-runner'
" {
  nnoremap <silent> <Leader>A :VtrAttachToPane<CR>
  nnoremap <silent> <Leader>c :VtrClearRunner<CR>
" }
Plug 'janko-m/vim-test'
" {
  let test#strategy = "vtr"
  nnoremap <silent> <Leader>t :TestFile<CR>
" }

" ===========================
" Rust
" ===========================

Plug 'racer-rust/vim-racer', { 'for': 'rust' }
" {
  let g:racer_cmd = "~/.cargo/bin"
  let g:racer_experimental_completer = 1
" }
Plug 'dansnow/block.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'timonv/vim-cargo', { 'for': 'rust' }

set hidden
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

" ===========================
" C
" ===========================

autocmd FileType c setlocal expandtab sw=4 ts=4

" ===========================
" Ruby on Rails
" ===========================

Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-ragtag'

" ===========================
" Typescript
" ===========================
Plug 'Quramy/tsuquyomi', { 'for': ['typescript'] }

" Markdown for README.md
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }

" Set ruby standard for spacing
autocmd FileType ruby setlocal expandtab sw=2 ts=2
autocmd FileType eruby setlocal expandtab sw=2 ts=2
autocmd FileType html setlocal expandtab sw=4 ts=4
autocmd FileType yaml setlocal expandtab sw=2 ts=2

" Swap between test file and implementation
nnoremap <silent> <Leader>a :A<CR>

" ===========================
" Python
" ===========================

Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }

let python_highlight_all=1
let g:SimpylFold_docstring_preview = 1

autocmd FileType *.py
    \ setlocal tabstop=4
    \ setlocal softtabstop=4
    \ setlocal shiftwidth=4
    \ setlocal textwidth=79
    \ setlocal expandtab
    \ setlocal autoindent
    \ setlocal fileformat=unix

" ===========================
" HTML / CSS
" ===========================

Plug 'alvan/vim-closetag', { 'for': ['eruby', 'html'] }
" {
  let g:closetag_filenames = '*.html,*.html.erb'
" }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }

" ===========================
" Shell (sh/bash)
" ===========================

autocmd FileType sh setlocal expandtab sw=4 ts=4

" ===========================
" Docker
" ===========================

autocmd FileType dockerfile setlocal expandtab sw=2 ts=2

" ===========================
" Misc. Files
" ===========================

Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" ===========================
" Git
" ===========================

Plug 'jreybert/vimagit'
" {
  nnoremap <silent> <Leader>g :Magit<CR>
" }

call plug#end()

" Select colourtheme and options
if (has("termguicolors"))
  set termguicolors
endif

set t_Co=256
set background=dark
colorscheme space_vim_theme

" set termguicolors
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
