" ===========================
" Plugins Settings
" ===========================
" TODO sort me nicely!

""
" Shougo/denite.nvim
"
" call denite#custom#option('default', 'prompt', 'λ')
" call denite#custom#var('file/rec', 'command', ['fd', '-H', '--full-path'])
" call denite#custom#var('grep', 'command', ['rg'])
" call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--smart-case'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])


" autocmd FileType denite call s:denite_settings()
" autocmd FileType denite-filter call s:denite_filter_actions()

" function! s:denite_filter_actions() abort
" endfunction

" function! s:denite_settings() abort
"   " Automatically go into buffer filter when denite opens
"   call denite#call_map('open_filter_buffer')
"   call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
"   call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
"   nnoremap <silent><buffer><expr> <CR>
"         \ denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> <C-v>
"         \ denite#do_map('do_action', 'vsplit')
"   nnoremap <silent><buffer><expr> d
"         \ denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p
"         \ denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> <Esc>
"         \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> q
"         \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> i
"         \ denite#do_map('open_filter_buffer')
" endfunction

" autocmd FileType denite-filter call s:denite_filter_settings()

" function! s:denite_filter_settings() abort
"   nmap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
" endfunction

" hi link deniteMatchedChar Special

""
" junegunn/fzf.vim
"   @ FZF fuzzy finding ft. Ripgrep
"
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

" Allow Ripgrep to search only on file content and not also on filename
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case".shellescape(<q-args>), 1, {'options': '-e --delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --hidden --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '-e --delimiter : --nth 4..'}, <bang>0)


set tags=./tags,tags;$home

""
" christoomey/vim-tmux-runner
"   @ Creates a socket between VIM and TMUX for easy test running
"   @ Paired with janko-m/vim-test due to test strategy being `vtr`
"
let test#strategy = "vtr"

""
" tpope/vim-surround
"   @ Improve ERB Tags
"
autocmd FileType eruby let g:surround_45 = "<% \r %>"
autocmd FileType eruby let g:surround_61 = "<%= \r %>"
autocmd FileType eruby let g:surround_33 = "```\r```"

""
" junegunn/goyo.vim
"   @ Enables relativenumber in Goyo
"
function! s:goyo_enter()
  set relativenumber
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()

""
" ludovicchabant/vim-gutentags
"   @ Tag settings for Universal CTAGS
"
set tags=~/.cache/tags/.tags;,.tags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_modules = ['ctags']

let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
let g:gutentags_ctags_extra_args += ['--exclude=node_modules']
let g:tagbar_ctags_bin = '/usr/bin/ctags'

""
" prettier/vim-prettier
"   @ Prettier code formatting
"
let g:prettier#autoformat = 0          " Disable auto formatting in favour of autocmd
let g:prettier#exec_cmd_async = 1      " Prettify in async
let g:prettier#quickfix_auto_focus = 0 " Don't autofocus quickfix window

" TODO make this less instrusive! and match ESLint
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

""
" Raimondi/delimitMate
"   @ Allow expansion on auto pairing
"
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_cr = 1

""
" scrooloose/nerdtree
"   @ File explorer
"
let NERDTreeShowHidden = 1   " Show hidden files in explorer
let g:NERDTreeQuitOnOpen = 1 " Close NERDTree after opening a file

