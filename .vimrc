" ===========================
" General Mappings
" ===========================

let g:mapleader = ","

""
" Multi-cursor
"
nnoremap cn *``cgn
nnoremap cN #``cgN

""
" Open init.vim
"
nnoremap <Space>fed :e ~/dotfiles/.config/nvim/init.vim<CR>

""
" Remove highlighting with return key
"
nnoremap <silent> <CR> :noh<CR><CR>

""
" Yank to clipboard
"
vnoremap <leader>y "+y
nnoremap <leader>y "+y

""
" Save and quit
"
nnoremap <silent> <Space>fs :w<CR>
nnoremap <silent> <Space>q :q<CR>

""
" NO ARROW KEYS ALLOWED ON THE PLAYGROUND
"
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" ===========================
" Window Mappings
" ===========================

nnoremap <silent> <Space>w/ :vsplit<CR>
nnoremap <silent> <Space>wv :vsplit<CR>
nnoremap <silent> <Space>w- :split<CR>
nnoremap <silent> <Space>ws :split<CR>

" Easy movement between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Switch to last buffer used
nnoremap <silent> <Space><Tab> :b#<CR>

