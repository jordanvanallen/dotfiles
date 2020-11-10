" ===========================
" Status Bar Settings
" ===========================

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [
      \             [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ]
      \           ],
      \   'right': [
      \             [ 'percent' ],
      \             [ 'lineinfo' ],
      \             [ 'filetype', 'fileformat', 'fileencoding' ],
      \             [ 'gutentags'],
      \            ],
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'gutentags': 'gutentags#statusline',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
augroup END

" " Fix slowdowns with Powerline/Airline when switching to and from insert mode
" " https://github.com/vim-airline/vim-airline/issues/421
" " https://medium.com/usevim/powerline-escape-fix-e849fd07aad0
" if ! has('gui_running')
"   set ttimeoutlen=10
"   augroup FastEscape
"     autocmd!
"     au InsertEnter * set timeoutlen=0
"     au InsertLeave * set timeoutlen=1000
"   augroup END
" endif

