" Autoload VIM Plug for new machines
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===========================
" General Settings
" ===========================

let g:mapleader = "\<Space>"

set number relativenumber
set nobackup
set noswapfile
set autoindent

" Remove toolbar/scrollbars for gvim
set guioptions=m

" Trim whitespace on save
au BufWritePre * :%s/\s\+$//e
set encoding=utf-8

" Remove bell
set noeb vb t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Close quickfix window
autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
			\   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
			\   bd|
			\   q | endif

" Kitty blackbars drawing fix
" let &t_ut=''

" Last tab
nnoremap <silent> <Space><Tab> :b#<CR>

" Splits
nnoremap <silent> <Space>w/ :vsplit<CR>
nnoremap <silent> <Space>w- :split<CR>

" Remap window selection to <Space>0-9
let i = 1
while i <= 9
    execute 'nnoremap <Space>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" Better buffer movement
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Remove search highlight on enter
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Open vimrc file
nnoremap <Space>fed :e ~/dotfiles/vimrc<CR>

" ===========================
" Terminal
" ===========================

tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <Space>' :vs <BAR> terminal<CR>
set splitright

" Open VTOP
nnoremap <Space>v :!vtop<CR>

call plug#begin('~/.vim/addons')

" ===========================
" Ruby on Rails
" ===========================

Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby'] }
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-ragtag'

autocmd FileType ruby setlocal expandtab sw=2 ts=2
autocmd FileType eruby setlocal expandtab sw=2 ts=2
autocmd FileType html setlocal expandtab sw=4 ts=4
autocmd FileType yaml setlocal expandtab sw=2 ts=2

nnoremap <silent> <Space>rr :Einitializer<CR>
nnoremap <silent> <Space>ra :Eenvironment<CR>
nnoremap <silent> <Space>rt :Eintegrationtest<CR>
nnoremap <silent> <Space>rc :Econtroller<CR>
nnoremap <silent> <Space>rm :Emodel<CR>
nnoremap <silent> <Space>rv :Eview<CR>
nnoremap <silent> <Space>a :A<CR>
nnoremap <silent> <Space>A :vsplit<CR><C-W>l :A<CR>

" ===========================
" HTML / CSS
" ===========================

Plug 'othree/html5.vim', { 'for': ['eruby', 'html'] }
Plug 'alvan/vim-closetag', { 'for': ['eruby', 'html'] }
" {
  let g:closetag_filenames = '*.html,*.html.erb'
" }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }


" ===========================
" Rust
" ===========================

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
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

Plug 'vim-scripts/c.vim', { 'for': 'c' }
autocmd FileType c setlocal expandtab sw=4 ts=4

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

nnoremap <buffer> <Space>p :w<CR>:!clear;python3 %<CR>

" ===========================
" Misc. Files
" ===========================

Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elzr/vim-json', { 'for': 'json'}

" ===========================
" Notes
" ===========================

Plug 'gu-fan/riv.vim'
Plug 'fisadev/FixedTaskList.vim'

" ===========================
" Linting
" ===========================

Plug 'w0rp/ale'
" {
  let g:ale_linters = {
  \ 'ruby': ['ruby', 'brakeman', 'reek'],
  \ }
" }

" ===========================
" Testing
" ===========================

Plug 'janko-m/vim-test'
" {
  let test#strategy = "asyncrun"

  nnoremap <silent> <Space>T :TestFile<CR>
  nnoremap <silent> <Space>tn :TestNearest<CR>
  nnoremap <silent> <Space>tT :TestSuite<CR>
  nnoremap <silent> <Space>ta :TestSuite<CR>
  nnoremap <silent> <Space>tl :TestLast<CR>
  nnoremap <silent> <Space>tv :TestVisit<CR>
" }

" ===========================
" Files (Management/Searching)
" ===========================

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {
  let g:fzf_buffers_jump = 1
  let g:fzf_tags_command = 'ctags -R'

  let g:fzf_action = {
    \ 'ctrl-s': 'split',
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

  " Use Ripgrep
  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

  nmap ; :Buffers<CR>
  nnoremap <C-F> :Files<CR>

  set tags=./tags,tags;$home
  nnoremap <silent> <Space>gt :!ctags -R<CR>
  nnoremap <silent> <c-p> :call fzf#vim#tags("'" . expand('<cword>'))<cr>
" }
Plug 'wsdjeg/FlyGrep.vim'
" {
  nnoremap <Space>s/ :FlyGrep<CR>
" }
Plug 'jremmen/vim-ripgrep'
" {
  nnoremap <Space>/ :Rg<Space>
" }
Plug 'danro/rename.vim'
" {
  nnoremap <silent> <Space>fR :Rename<Space>
" }

" ===========================
" Editing
" ===========================

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
" {
  vmap t :Tabularize<Space>/
" }
Plug 'easymotion/vim-easymotion'
" {
  map <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)
" }

" ===========================
" Autocompletion
" ===========================

Plug 'Shougo/deoplete.nvim'
" {
  let g:deoplete#enable_at_startup = 1
" }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" ===========================
" Autopairing
" ===========================

Plug 'Raimondi/delimitMate'
" {
  let delimitMate_expand_cr=1
  au FileType html let b:delimitMate_autoclose = 0
  au FileType eruby let b:delimitMate_autoclose = 0
" }

" ===========================
" Git
" ===========================

Plug 'tpope/vim-fugitive'
" {
  nnoremap <silent> <Space>gs :Gwrite<CR>
  nnoremap <silent> <Space>gd :Gdiff<CR>
  nnoremap <silent> <Space>gp :diffput<CR>
  nnoremap <silent> <Space>gb :Gblame<CR>
  nnoremap <silent> <Space>gc :Gcommit<CR>
  nnoremap <silent> <Space>fD :Gdelete<CR>
  nnoremap <silent> <Space>gm :Gmove<CR>
  nnoremap <silent> <Space>fR :Gmove<CR>
  nnoremap <silent> <Space>gl :Glog<CR>
  nnoremap <silent> <Space>gr :Gread<CR>
  nnoremap <silent> <Space>G :Git<Space>
" }

" ===========================
" Pretty stuff
" ===========================

Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'

" Colorschemes
Plug 'lifepillar/vim-solarized8'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'Badacadabra/vim-archery'
Plug 'szorfein/darkest-space'

" Initialize plugins
call plug#end()

" Select colortheme and options
set t_Co=256
set background=dark
colorscheme solarized8_flat
