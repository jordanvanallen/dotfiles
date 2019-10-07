" ===========================
" Plugins Settings
" ===========================

""
" mhinz/vim-startify
"   @ Startup Screen Header
"
let g:startify_custom_header = [
      \ '   ███████╗███╗   ██╗ █████╗  ██████╗██╗  ██╗    ██████╗  █████╗ ██╗██████╗ ███████╗██████╗ ███████╗',
      \ '   ██╔════╝████╗  ██║██╔══██╗██╔════╝██║ ██╔╝    ██╔══██╗██╔══██╗██║██╔══██╗██╔════╝██╔══██╗██╔════╝',
      \ '   ███████╗██╔██╗ ██║███████║██║     █████╔╝     ██████╔╝███████║██║██║  ██║█████╗  ██████╔╝███████╗',
      \ '   ╚════██║██║╚██╗██║██╔══██║██║     ██╔═██╗     ██╔══██╗██╔══██║██║██║  ██║██╔══╝  ██╔══██╗╚════██║',
      \ '   ███████║██║ ╚████║██║  ██║╚██████╗██║  ██╗    ██║  ██║██║  ██║██║██████╔╝███████╗██║  ██║███████║',
      \ '   ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝'
      \ ]

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

