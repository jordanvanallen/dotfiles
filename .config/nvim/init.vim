" Autoload NVIM Plug for new machines
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
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

" Show the current line you are working on
set cursorline

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

" Open init.vim
nnoremap <Space>fed :e ~/dotfiles/.config/nvim/init.vim<CR>

" Trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" Remove bell
set noeb vb t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Remove highlighting with return key
nnoremap <CR> :noh<CR><CR>

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
" Allow for auto adjusting of spacing to match project styling
Plug 'tpope/vim-sleuth'
" Allow for S to group in visual mode and then surround text object with
" brackets, etc.
Plug 'tpope/vim-surround'
" Allow gcc keybind for easy commenting
Plug 'tpope/vim-commentary'
" Bring in sensible settings such as allowing 'u' keybind for undo
Plug 'tpope/vim-sensible'
" Allow control+n in visual mode for aiding in refactoring
Plug 'terryma/vim-multiple-cursors'
" Provide visual line to show indentation for easier reading and refactoring
Plug 'Yggdroot/indentLine'
" Improve cursor positioning for using ciX based commands
Plug 'wellle/targets.vim'

" VIM language packs
" Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'jsx' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Plug 'HerringtonDarkholme/yats.vim'

" Distration free writing when needed
Plug 'junegunn/goyo.vim'
" {
  nnoremap <Leader>G :Goyo<CR>

  " Enable relative line numbers in Goyo
  function! s:goyo_enter()
    set relativenumber
  endfunction

  autocmd! User GoyoEnter call <SID>goyo_enter()
" }

" Visual Studio like completion framework
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
" :CocInstall coc-tsserver coc-tslint-plugin coc-jest coc-rls coc-solargraph
" coc-eslint coc-html coc-json
"
" COC-JEST
nnoremap <Leader>tp :call CocAction('runCommand', 'jest.projectTest')<CR>
nnoremap <Leader>tf :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>
nnoremap <leader>tc :call CocAction('runCommand', 'jest.singleTest')<CR>
" " Run jest for current project
" command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
" command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
" nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
" command! JestInit :call CocAction('runCommand', 'jest.init')

" Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }
" Plug 'neoclide/coc-tslint-plugin', { 'do': 'yarn install --frozen-lockfile' }
" Plug 'neoclide/coc-rls', { 'for': ['rust'] }

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" DEBUGGING
" TODO
" Plug 'sidorares/node-vim-debugger'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'idanarye/vim-vebugger', { 'do': 'npm install -g node-inspect' }

" Plug 'vim-vdebug/vdebug'

" Make a console.log on a new line
" then go back to normal mode
" then jump to beginning of line
" then change inside of quotes
" so we are inside the quotes
" while being in insert mode
nnoremap <Leader>d oconsole.log("");<ESC>0ci"
nnoremap <Leader>D Oconsole.log("");<ESC>0ci"

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
  nnoremap <Leader>f :Files<CR>
  nnoremap <Leader>s :Rg<CR>
  nnoremap <Leader>h :History<CR>
  nnoremap <Leader>H :History:<CR>

  set tags=./tags,tags;$home
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
  let g:airline_theme = 'violet'
" }

" Colourscheme
Plug 'liuchengxu/space-vim-theme'
Plug 'liuchengxu/space-vim-dark'
Plug 'chriskempson/base16-vim'
Plug 'drewtempelmeyer/palenight.vim'

" Tableize things!
Plug 'godlygeek/tabular'
" {
  vmap t :Tabularize<Space>/
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
  nnoremap <silent> <Leader>T :TestFile<CR>

  let g:test#runner_commands = ['Jest']
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
" Typescript/Javascript
" ===========================
" # TODO maybe keep, like rails.vim keybinds for jumping around models etc
Plug 'moll/vim-node', { 'for': ['javascript'] }

" ===========================

" ===========================
" Git
" ===========================

Plug 'jreybert/vimagit'
" {
  nnoremap <silent> <Leader>g :MagitOnly<CR>
" }
Plug 'tpope/vim-fugitive'

call plug#end()
" END OF PLUGINS

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
