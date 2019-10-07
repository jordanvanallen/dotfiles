" ===========================
" Coc Mappings
" ===========================

""
" Natural buffer (autocomplete, file find, etc.) movement
"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

""
" Jump to definitions, implementations, and references
"
nnoremap <silent> <Leader>gd <Plug>(coc-definition)
nnoremap <silent> <Leader>gt <Plug>(coc-type-definition)
nnoremap <silent> <Leader>gi <Plug>(coc-implementation)
nnoremap <silent> <Leader>gf <Plug>(coc-references)

" Alternative mappings to above
" nnoremap <silent> <Leader>gd :call CocActionAsync('jumpDefinition')<CR>
" nnoremap <silent> <Leader>gt :call CocActionAsync('jumpTypeDefinition')<CR>
" nnoremap <silent> <Leader>gi :call CocActionAsync('jumpImplementation')<CR>
" nnoremap <silent> <Leader>gr :call CocActionAsync('jumpReferences')<CR>

" Diagnostics navigation
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

""
" Rename variable
"
nnoremap <Leader>lr <Plug>(coc-rename)

""
" Display documentation for word under cursor
"
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

""
" coc-smartf
"   @ Make f mapping smarter and add easyMotion functionality
"   @ press <esc> to cancel any of these commands
"
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)

""
" coc-snippets
"
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

""
" coc-yank
"   @ Bring up yank buffer
"     => `-A` gives auto preview
"     => `--normal` to open list in normal mode for easier navigation
"
nnoremap <silent> <Leader>y :<C-u>CocList -A --normal yank<CR>
