" Autoload VIM Plug for new machines
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/addons')

" #######
" PLUGINS
" #######

" Languages
"
" Ruby / Ruby on Rails
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rvm', { 'for': ['ruby', 'eruby'] }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'dansnow/block.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'timonv/vim-cargo', { 'for': 'rust' }

" Kotlin
Plug 'udalov/kotlin.vim', { 'for': 'kotlin' }

" C
Plug 'vim-scripts/c.vim', { 'for': 'c' }

" Python
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }


" HTML / CSS
Plug 'othree/html5.vim', { 'for': ['eruby', 'html'] }
Plug 'alvan/vim-closetag', { 'for': ['eruby', 'html'] }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }

" Markdown
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }

" CSV
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" JSON
Plug 'elzr/vim-json', { 'for': 'json'}

" Notes
Plug 'gu-fan/riv.vim'
Plug 'fisadev/FixedTaskList.vim'

" Linting
Plug 'w0rp/ale'

" Testing
Plug 'janko-m/vim-test'

" Files (Management/Searching)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'danro/rename.vim'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'

" Autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Autopairing
Plug 'Raimondi/delimitMate'

" Git
Plug 'tpope/vim-fugitive'

" Pretty stuff
"
" Powerline
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'

" Colorschemes
Plug 'lifepillar/vim-solarized8'
Plug 'dracula/vim'
Plug 'sonph/onehalf'
Plug 'colepeters/spacemacs-theme.vim'

" Line indenting
Plug 'Yggdroot/indentLine'

" Initialize the plugin system
call plug#end()

" #########################
" SETTINGS / CONFIGURATIONS
" #########################
"
" Lanauge Settings
"
" Rust
set hidden
let g:racer_cmd = "~/.cargo/bin"
let g:racer_experimental_completer = 1
" let g:ycm_rust_src_path =
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

" Python
"python with virtualenv support
let python_highlight_all=1
let g:SimpylFold_docstring_preview = 1

" Syntax Linter
let g:ale_linters = {
\    'ruby': ['ruby', 'brakeman', 'reek'],
\}

" General vim settings
set nobackup
set noswapfile
set autoindent
set guioptions=m " Remove toolbar for gvim

" Pretty stuff
"
" Colorscheme
colorscheme spacemacs-theme

" Plugin Custom Settings
"
" raimondi/delimitMate
au FileType html let b:delimitMate_autoclose = 0
au FileType eruby let b:delimitMate_autoclose = 0

" Shougo/deoplete (autocompletion)
let g:deoplete#enable_at_startup = 1

" mileszs/ack.vim
" Fallback if ag isn't on the system
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" raimondi/delimitmate
let delimitMate_expand_cr=1

" alvan/vim-closetag (HTML)
let g:closetag_filenames = '*.html,*.html.erb'

" fzf
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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


" vim-test
let test#strategy = "vimterminal"

" Settings
"
" Trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" Encoding
set encoding=utf-8

" Tab length
"
" Ruby
autocmd FileType ruby setlocal expandtab sw=2 ts=2
autocmd FileType eruby setlocal expandtab sw=2 ts=2
autocmd FileType html setlocal expandtab sw=4 ts=4
" C
autocmd FileType c setlocal expandtab sw=4 ts=4
" Python
autocmd FileType *.py
    \ setlocal tabstop=4
    \ setlocal softtabstop=4
    \ setlocal shiftwidth=4
    \ setlocal textwidth=79
    \ setlocal expandtab
    \ setlocal autoindent
    \ setlocal fileformat=unix

" Unfold all code blocks by default
set foldlevel=99

" Line numbers
" - Hybrid
set number relativenumber

" Keybinds
"
" Rails
nnoremap <silent> <Space>rr :Einitializer<CR>
nnoremap <silent> <Space>ra :Eenvironment<CR>
nnoremap <silent> <Space>rt :Eintegrationtest<CR>
nnoremap <silent> <Space>rc :Econtroller<CR>
nnoremap <silent> <Space>rm :Emodel<CR>
nnoremap <silent> <Space>rv :Eview<CR>

" Python
nnoremap <buffer> <Space>q :w<CR>:!clear;python3 %<CR>

" Last tab
nnoremap <silent> <Space><Tab> :b#<CR>

" Saving
nnoremap <silent> <Space>s :w<CR>

" Window mappings
nnoremap <silent> <Space>w/ :vsplit<CR>
nnoremap <silent> <Space>w- :split<CR>
nnoremap <silent> <Space>wq :q<CR>
" Remap window selection to <Space>0-9
let i = 1
while i <= 9
    execute 'nnoremap <Space>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" Project Search
nnoremap <Space>/ :Ack<Space>

" Buffers
nmap ; :Buffers<CR>
nnoremap <C-F> :Files<CR>
nmap <Space>r :Tags<CR>

" Open Vimrc
nnoremap <Space>fed :e ~/dotfiles/vimrc<CR>

" Autocompletion
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Buffer movement
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Buffer Resizing
" Setup windows when you open vim with this
nnoremap <silent> <Space>W :vsplit<CR>:split<CR>20<C-W>>

" Testing
nnoremap <silent> <Space>a :A<CR>
nnoremap <silent> <Space>A :vsplit<CR><C-W>l :A<CR>
nnoremap <silent> <Space>T :TestFile<CR>
nnoremap <silent> <Space>tn :TestNearest<CR>
nnoremap <silent> <Space>tT :TestSuite<CR>
nnoremap <silent> <Space>ta :TestSuite<CR>
nnoremap <silent> <Space>tl :TestLast<CR>
nnoremap <silent> <Space>tv :TestVisit<CR>

" Editing

" Tags
set tags=./tags,tags;$HOME
nnoremap <silent> <C-P> :call fzf#vim#tags("'" . expand('<cword>'))<CR>

" Git
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

" Terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <Space>' :vs <BAR> terminal<CR>
set splitright

" Files
nnoremap <silent> <Space>fR :Rename<Space>

" Tags (Rebuild)
nnoremap <silent> <Space>gt :!ctags -R<CR>

" Remove search highlight on enter
nnoremap <silent> <CR> :nohlsearch<CR><CR>
