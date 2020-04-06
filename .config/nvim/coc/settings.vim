" ===========================
" Coc Settings
" ===========================

""
" Coc Extensions List
"   @ These are automatically installed on startup
"   @ Please keep this list (comments and extension array) alphabetical
"
"   @ coc-diagnostic
"     => Floating diagnostic window
"
"   @ coc-git
"     => Git integration
"
"   @ coc-go
"     => Golang Support
"
"   @ coc-html
"     => HTML LSP
"
"   @ coc-json
"     => JSON LSP
"
"   @ coc-rls
"     => Rust LSP
"
"   @ coc-smartf
"     => Make f mapping smarter and more like easyMotion
"
"   @ coc-snippets
"     => Snippets support
"
"   @ coc-solargraph
"     => Ruby LSP
"
"   @ coc-syntax
"     => Syntax list
"
"   @ coc-tag
"     => Tags support
"
"   @ coc-yaml
"     => YAML LSP
"
"   @ coc-yank
"     => Yank list
"
let g:coc_global_extensions = [
  \ 'coc-diagnostic',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-rls',
  \ 'coc-smartf',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-syntax',
  \ 'coc-tag',
  \ 'coc-yaml',
  \ 'coc-yank',
  \ ]
""
" General COC Settings
"
set nocompatible
set runtimepath^=~/.config/nvim/plugged/coc.nvim
syntax on
set updatetime=300

""
" coc-smartf
"
augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

""
" coc-json
"
autocmd FileType json syntax match Comment +\/\/.\+$+
