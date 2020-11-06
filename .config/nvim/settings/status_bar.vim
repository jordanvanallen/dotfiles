" ===========================
" Status Bar Settings
" ===========================

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [
      \             [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \           ],
      \   'right': [
      \             [ 'percent' ],
      \             [ 'lineinfo' ],
      \             [ 'filetype', 'fileformat', 'fileencoding' ],
      \             [ 'gutentags'],
      \            ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'gutentags': 'gutentags#statusline',
      \ },
      \ }

augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
augroup END

let g:tmuxline_powerline_separators = 1

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

