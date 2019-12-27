" ===========================
" Status Bar Settings
" ===========================

""
" vim-airline/vim-airline
"   @ Themes come from vim-airline/vim-airline-themes
"   @ Setup to look like powerline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_theme = 'gruvbox'
set statusline+=%{gutentags#statusline()}

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

