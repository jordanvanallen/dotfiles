" ===========================
" Colors
" ===========================

" True Colors
if (has("+termguicolors"))
  set termguicolors
endif

set t_Co=256
set background=dark



hi clear Normal
hi clear LineNr
hi clear SignColumn

let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_italic = 0
let g:gruvbox_contrast_dark='dark'

" This should always happen last!
colorscheme gruvbox9
