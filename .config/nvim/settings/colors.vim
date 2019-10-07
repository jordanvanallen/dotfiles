" ===========================
" Colors
" ===========================

" True Colors
if (has("+termguicolors"))
  set termguicolors
endif

set t_Co=256
set background=dark

hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_italic = 0
let g:gruvbox_contrast_dark='hard'

" This should always happen last!
colorscheme gruvbox9
