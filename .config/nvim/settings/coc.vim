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
"   @ coc-eslint
"     => ESLint support
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
"   @ coc-python
"     => Python LSP
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
"   @ coc-tag
"     => Tags support
"
"   @ coc-tslint-plugin
"     => Typescript/Javascript Linting Aid
"
"   @ coc-tsserver
"     => Typescript/Javascript LSP
"
"   @ coc-yaml
"     => YAML LSP
"
"   @ coc-yank
"     => Yank list
"
let g:coc_global_extensions = [
  \ 'coc-diagnostic',
  \ 'coc-eslint',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-rls',
  \ 'coc-smartf',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-tag',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-yaml',
  \ 'coc-yank',
  \ ]

""
" coc-snippets
"
let g:coc_snippet_next = '<a-j>'
let g:coc_snippet_prev = '<a-k>'

""
" coc-smartf
"
augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end
