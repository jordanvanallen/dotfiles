" Autoload VIM Plug for new machines
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" =======
" General
" =======

let g:mapleader = ","

set encoding=utf-8
set number relativenumber

set nobackup
set noswapfile

set autoindent

" Open vimrc file
nnoremap <Space>fed :e ~/dotfiles/.config/nvim/init.vim<CR>

" Trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" Remove bell
set noeb vb t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Close quickfix window
autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
			\   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
			\   bd|
			\   q | endif

" Last tab
nnoremap <silent> <Space><Tab> :b#<CR>

" Window Splits
nnoremap <silent> <Space>w/ :vsplit<CR>
nnoremap <silent> <Space>w- :split<CR>

" Sensible buffer movement
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l


call plug#begin('~/.vim/addons')

" ===========================
" General
" ===========================

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'terryma/vim-multiple-cursors'

" TMUX Airline integration
Plug 'edkolev/tmuxline.vim'

" Tableize things!
Plug 'godlygeek/tabular'
" {
  vmap t :Tabularize<Space>/
" }

" Autocompletion
Plug 'zxqfl/tabnine-vim'

" Sensible navigation of completion buffers
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" TODO - Remove me if tabnine works out
" Plug 'lifepillar/vim-mucomplete'
" {
  " set completeopt+=menuone,noselect
  " set shortmess+=c " Shut off completion messages


  " let g:mucomplete#enable_auto_at_startup = 1
" }

" Linting
" Plug 'w0rp/ale'
" " {
"   let g:ale_linters = {
"   \ 'ruby': ['ruby', 'brakeman', 'reek', 'solargraph', 'standardrb', 'rufo'],
"   \ }
" " }

" Tagging
if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'
endif

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" {
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_theme = 'violet'

  " Display ALE errors on status line
  let g:airline#extensions#ale#enabled = 1
" }
Plug 'Yggdroot/indentLine'

" Colourscheme
Plug 'liuchengxu/space-vim-dark'

" Icons
Plug 'ryanoasis/vim-devicons'

" Autopairing
Plug 'Raimondi/delimitMate'
" {
  let delimitMate_expand_cr=1
  au FileType html let b:delimitMate_autoclose = 0
  au FileType eruby let b:delimitMate_autoclose = 0
" }

" Rename files easily
Plug 'danro/rename.vim'
" {
  nnoremap <silent> <Leader>fR :Rename<Leader>
" }

" Fast project text finding
Plug 'jremmen/vim-ripgrep'
" {
  nnoremap <Leader>s :Rg<Leader>
" }
Plug 'wsdjeg/FlyGrep.vim'
" {
  nnoremap <Leader>S :FlyGrep<CR>
" }

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

  " Use Ripgrep
  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

  nmap ; :Buffers<CR>
  nnoremap <Leader>f :Files<CR>

  set tags=./tags,tags;$home
  nnoremap <silent> <Leader>gt :!ctags -R<CR>
  nnoremap <silent> <c-p> :call fzf#vim#tags("'" . expand('<cword>'))<cr>
" }

" ===========================
" Testing
" ===========================

" Plug 'skywind3000/asyncrun.vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'janko-m/vim-test'
" {
  let test#strategy = "vtr"
  nnoremap <silent> <Leader>t :TestFile<CR>
" }

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
" Ruby on Rails
" ===========================

Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-ragtag'

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

Plug 'othree/html5.vim', { 'for': ['eruby', 'html'] }
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

Plug 'ekalinin/Dockerfile.vim'
autocmd FileType dockerfile setlocal expandtab sw=2 ts=2

" ===========================
" Misc. Files
" ===========================

Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elzr/vim-json', { 'for': 'json'}

" ===========================
" Git
" ===========================

Plug 'jreybert/vimagit'
" {
  nnoremap <silent> <Leader>g :Magit<CR>
" }

Plug 'tpope/vim-fugitive'
" {
  nnoremap <silent> <Leader>gb :Gblame<CR>
  nnoremap <silent> <Leader>gd :Gdiff<CR>
  nnoremap <silent> <Leader>fD :Gdelete<CR>
  nnoremap <silent> <Leader>gl :Glog<CR>
" }

call plug#end()

" Select colourtheme and options
set t_Co=256
set background=dark
colorscheme space-vim-dark

" set termguicolors
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

