" Autoload VIM Plug for new machines
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
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

" Quickfix window
augroup vimrc
  " Don't allow quickfix window to take focus after test run
  autocmd QuickFixCmdPre * let g:mybufname=bufname('%')
  autocmd QuickFixCmdPost * botright copen 8 | exec bufwinnr(g:mybufname) . 'wincmd w'
augroup END
" Close quickfix window with q
autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
			\   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
			\   bd|
			\   q | endif

nnoremap <silent> <Leader>q :ccl<CR>

" Kitty Terminal Settings
" let &t_ut=''
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"

" Last tab
nnoremap <silent> <Leader><Tab> :b#<CR>

" Splits
nnoremap <silent> <Leader>w/ :vsplit<CR>
nnoremap <silent> <Leader>w- :split<CR>

" Remap window selection to <Leader>0-9
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
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
nnoremap <Leader>fed :e ~/dotfiles/.config/nvim/init.vim<CR>

call plug#begin('~/.config/nvim/plugged')

" ===========================
" Terminal
" ===========================

Plug 'kassio/neoterm'
Plug 'Lenovsky/nuake'
" {
  " Keybinds
  nnoremap <silent> <F4> :Nuake<CR>
  inoremap <silent> <F4> <C-\><C-n>:Nuake<CR>
  tnoremap <silent> <F4> <C-\><C-n>:Nuake<CR>

  " Settings
  let g:nuake_position = 1 " 1 = Vertical, 0 = Horizontal
" }

Plug 'edkolev/tmuxline.vim'

tnoremap <C-w> <C-\><C-n><C-w>
set splitright

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

nnoremap <silent> <Leader>rr :Einitializer<CR>
nnoremap <silent> <Leader>ra :Eenvironment<CR>
nnoremap <silent> <Leader>rt :Eintegrationtest<CR>
nnoremap <silent> <Leader>rc :Econtroller<CR>
nnoremap <silent> <Leader>rm :Emodel<CR>
nnoremap <silent> <Leader>rv :Eview<CR>
nnoremap <silent> <Leader>a :A<CR>
nnoremap <silent> <Leader>A :vsplit<CR><C-W>l :A<CR>

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

nnoremap <buffer> <Leader>p :w<CR>:!clear;python3 %<CR>

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

Plug 'skywind3000/asyncrun.vim'
Plug 'janko-m/vim-test'
" {
  let test#strategy = "asyncrun"

  nnoremap <silent> <Leader>T :TestFile<CR>
  nnoremap <silent> <Leader>tn :TestNearest<CR>
  nnoremap <silent> <Leader>tT :TestSuite<CR>
  nnoremap <silent> <Leader>ta :TestSuite<CR>
  nnoremap <silent> <Leader>tl :TestLast<CR>
  nnoremap <silent> <Leader>tv :TestVisit<CR>
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
  nnoremap <silent> <Leader>gt :!ctags -R<CR>
  nnoremap <silent> <c-p> :call fzf#vim#tags("'" . expand('<cword>'))<cr>
" }
Plug 'wsdjeg/FlyGrep.vim'
" {
  nnoremap <Leader>s/ :FlyGrep<CR>
" }
Plug 'jremmen/vim-ripgrep'
" {
  nnoremap <Leader>/ :Rg<Leader>
" }
Plug 'danro/rename.vim'
" {
  nnoremap <silent> <Leader>fR :Rename<Leader>
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
  vmap t :Tabularize<Leader>/
" }
Plug 'easymotion/vim-easymotion'
" {
  map <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)
" }

" ===========================
" Autocompletion
" ===========================

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" {
  let g:deoplete#enable_at_startup = 1
" }

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
  nnoremap <silent> <Leader>gs :Gwrite<CR>
  nnoremap <silent> <Leader>gd :Gdiff<CR>
  nnoremap <silent> <Leader>gp :diffput<CR>
  nnoremap <silent> <Leader>gb :Gblame<CR>
  nnoremap <silent> <Leader>gc :Gcommit<CR>
  nnoremap <silent> <Leader>fD :Gdelete<CR>
  nnoremap <silent> <Leader>gm :Gmove<CR>
  nnoremap <silent> <Leader>fR :Gmove<CR>
  nnoremap <silent> <Leader>gl :Glog<CR>
  nnoremap <silent> <Leader>gr :Gread<CR>
" }

Plug 'jreybert/vimagit'
" {
  nnoremap <silent> <Leader>G :Magit<CR>
" }

" ===========================
" Pretty stuff
" ===========================

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" {
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_theme = 'violet'
" }
Plug 'Yggdroot/indentLine'

" Icons
Plug 'ryanoasis/vim-devicons'

" Colorschemes
Plug 'lifepillar/vim-solarized8'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'Badacadabra/vim-archery'
Plug 'szorfein/darkest-space'

" Initialize plugins
call plug#end()

" Select colortheme and options
set t_Co=256
set background=dark
colorscheme space-vim-dark
set termguicolors
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

