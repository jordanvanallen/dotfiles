" ===========================
" Plugins Settings
" ===========================

""
" mhinz/vim-startify
"   @ Startup Screen Header
"
" let g:startify_custom_header = [
"       \ '   ███████╗███╗   ██╗ █████╗  ██████╗██╗  ██╗    ██████╗  █████╗ ██╗██████╗ ███████╗██████╗ ███████╗',
"       \ '   ██╔════╝████╗  ██║██╔══██╗██╔════╝██║ ██╔╝    ██╔══██╗██╔══██╗██║██╔══██╗██╔════╝██╔══██╗██╔════╝',
"       \ '   ███████╗██╔██╗ ██║███████║██║     █████╔╝     ██████╔╝███████║██║██║  ██║█████╗  ██████╔╝███████╗',
"       \ '   ╚════██║██║╚██╗██║██╔══██║██║     ██╔═██╗     ██╔══██╗██╔══██║██║██║  ██║██╔══╝  ██╔══██╗╚════██║',
"       \ '   ███████║██║ ╚████║██║  ██║╚██████╗██║  ██╗    ██║  ██║██║  ██║██║██████╔╝███████╗██║  ██║███████║',
"       \ '   ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝',
"       \ '',
"       \ '                                 [ Author: Jordan Van Allen ]'
"       \ ]

" Relina Gundam Wing
let g:startify_custom_header = [
  \ '　　　　　　　　　　　　　　　 ,,.-;;"::: : : ::::::,,.::::::::｀ヽ、',
  \ '　　　　　　　　　 　 　 　 ／:::::::::::::::::::::: ;"´:::::::: : : :::ヽ',
  \ '　　　　　　　　　　　 ,,.-;;;"´:::::::::::::::::::::::::::ﾞヽ､:: : : :::::::::ﾞ､',
  \ '　　　　　　　　 　 ／ : :::::::::::::::::::::::::::::::::::::::::::: :＼: :::::::::::ﾞi､',
  \ '　　　　　　　 　 /: : : ::::::,.:::::::/::::::::::::::::::::::::::: : ､: :ヽ:::::::::::〉ﾞi',
  \ '　　　　　　　　/:;:::::／ :/: : :/: : /: : : ,:　:　:　: ::ﾞ､:::::ﾞ､::::::>;i､.',
  \ '　　　　　　　 ,;;;;::::/:: : i;: : :i;: : :,;: : : ::i: :,: : ､::::::::::ﾞi,:::::ﾞi;:::(:/k;',
  \ '　 　 　 　 　 i;;;;;;:/;::::::l::::::::l:;;::::i:::::::::::|::::i:::::::ﾞi,::::::i::l;;::::;|;;;（:ﾉ〉,',
  \ '　　　　　　　 i,;;;;;i;;i;;::::|;:::::::|;;::::i;;::::::i::|;;:::;i,::::::i,:::i;::ﾞ､ヽ;ﾉ／/ﾞi:li,',
  \ ' 　 　 　 　 　 ヾ､i､l;;､;i,;;;;:;:;il;;;;;;iﾞ､;;::;i;ﾞi､;;:ﾞ､;:;:ﾞ､;ﾞ､;:::::_ノ,,..,;/:i:l:ﾞ､　　ヒイロー！早く私を殺しにいらっしゃい！',
  \ ' 　 　 　 　 　 　_｀iﾞ;;-.,,ゞ､,_iヽ､;ﾞ､ヽ;;;;,ゝ_,,=-一‐￣i;;/r;´Yi::l:l:::ﾞ､',
  \ '　　　　 　 　 r;´;;‐l `i´iﾞﾞ;iヽ,.　￣　```"r､‐‐､‐,.､　　｀ ) 〉,ﾉ:|::l;:ﾞ､:ﾞ､',
  \ '　 　 　 　 　 /; ヽi;:_l　ヽヽﾞ;ソ;i　　　 　 ､ヽ,.,,ソ,. 　 　 ;"/;i:::|i::l,;ﾞ､ﾞ､ﾞ､',
  \ '　 　 　 　 /　｀ﾆﾞ､､i 　 　 　 l　　　　　　｀```"　　　 r,-`i;::l:::l:!:::i,;;;;::ヽ:ﾞ､',
  \ '　　　 　 　ﾞ､　　　　l,　　　　ﾉ　　　　　 　 　 　 　 / l;;;|::i:::l:l;;::::i,;:;:;;;:ヽﾞヽ',
  \ '　　 　 　 　 ﾞ､　　　ヽ 　 　 ヽ　　　　　　　　　　 / /l;/:;::::i`l;;::::::l;;;:;:i:;:;:ヽ:ﾞ､',
  \ ' 　 　 　 　 　 ヽ　　　 ＼　 　 ｰ -‐　　　　 　 ／／ l/;:::::i`:i`::::::::iﾞヽ;;;ﾞ､;:ヽ::ﾞ､',
  \ '　　　　　 _,,,.-`"ヽ　　　　ﾞヽ、　ﾞﾞ" 　 　　 ,.-`"／ 　 !;;:::::,`:i`;l::::i:::l;;;;;;＼ﾞi,;:ﾞ､::ﾞ､',
  \ '　　 _,.-`";;;;;;;;;;;;;;;;i　　　 　 `　ヽ､ _ ,,. - `",,.-`"　　　,`;;:::://;;i`::::|:::|;;;;;;;;;;;;ﾞ``‐-.,_:ﾞi,',
  \ '　 /;;;;;;;;;;;;;;;;;;;;;;;;;i`　　　　　　 /く｀``‐‐````"　　　　　 /;;:::〃;;,`: :::i:::l;;;;;;;;;;;;;;;;;;;;;;;;;;;ﾞ``-.,,',
  \ '　,`;;;;;;;;;;;;;;;;;;;;;;;;;/ 　 　 　 　 /;;;;;〉,: : : :　　　　 　 /;;::://;;;/: : i`::i`;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ﾞヽ、',
  \ '　|;;;;;;;;;;;;;;;;;;;;;r`"´"``‐- .,　 /;;;;/i､: : :　　　　 ,,.-``/i`;:::;/;;;/:: : ,`:::,`;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ヽ,',
  \ '　|;;;;;;;;;;;;;;;;;;/-､ 　 　 　 ヽ`;;;;/l i! ヽ､__,,,.-``"／`/i;l;:;;/;;;/: : :/ :/;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ﾞi',
  \ '　|;;;;;;;;;;;;;;;/;;;;;;;;＼　　　　 〉/ .! i!　 -‐``"　／ /;;i`i;/;;;;/::::::/: /;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;|',
  \ '　〉;;;;;;;;;;;/;;;;;;;;;;;;;;;;;＼　　/;/　　i!　　　 ／　 /;;;;li`;;/;/::::::/:::/;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;i'
  \ ]

" Gundam Unicorn
" let g:startify_custom_header = [
"   \'　 　 ＼　　 ＼丶　＼',
"   \'　　　　 ＼　　 ＼＼　li　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　_.斗',
"   \'　　　　　　＼　　 ＼　lﾄ､　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　x ≦',
"   \'　　　　　　　 ＼丶　＼　＼/＼　　　　　　　　　　　　　　　　　　　　　　 　 　 　 　 　 ／　,. ≦| /',
"   \'　　　　 　 　 　 ∨i　//＼ 《 　 ＼　　　　　　　　　　　　.． ―-　．.　　　　　 　 　 ／　／／,.. } } }',
"   \'　　　　　　　　　 L}//　　 ＼､　　i!　　　　　　　 ..　z≦　　¨¨¨¨　 　 ＞x　　　 ／　　 { 〔／ _///',
"   \'　　　　　　　　　　/〔　　　 / 丶　i{　　 r―‐＜＜　　　　　　　　　／　　　｀＞ x.　rヘ ∨r‐ / ＞',
"   \'　　　　　　　　　　＼＼ ／　　 》　＼rヘ ､　　 ＞ ミ x　　´ ￣￣￣￣ミ　 .　　　` ＜》 V／　 r r',
"   \'　 　 　 　 　 　 　 　 `ヘ ＼　 /＼　 ＼ ＼ ､　___ ／　 .　　 ７ 二　　　　　　＞　.　　 ` ＜＼ ＼',
"   \'　　　　　　　　　　　　　　＼} /　　 ＼《 ＼r≦＜ ｀　＜ ／ /下≧=r===== x　　　≧x　r 1 xヘ',
"   \'　　　　　　　　　　　　　　　 》　　　 　 ∧　,`77ヽ＼　　. l＼||｜／　＞ ===　≧zz――く._ト　　 }',
"   \'　　　　　　　　　　　,x――/　　 ＞ミ∧ ∨//　 _〕ﾉ ／^|{　|l／　／　　　　　　　　　 　 　 {_ ＞┘',
"   \'　　　　　　　　　　/ j| ｢￣《 　／　　 ＼ r‐ヘv`　　 人）_|j／　／　　　　　　　　　　　　　 /|_ 斗≦',
"   \'　　　　　　　　 　 |　i| |　　 >`　　　　　 斗《＞′　　　 ／, ＜《　　　　　　　　　 　 　 __ ∧l| ＼',
"   \'　　　　　　　　 　 |　ｲ,|　／　　　　≦　／　 　 _..斗孑／　ﾍﾍ∨　　　　　　　　　 ／ ‐〈　/ / /',
"   \'　　　　　　　　 　 V/| | 《　＼／　 　 /_ 　 ,.匕 ィ升 {〈　　　 V.∧　　　　　　　　/　＿　　∨ /',
"   \'　　　　　 　 　 　 /　ト廴＼　》　＿__′≪了´　　}i}　Ⅵi　　　トV廴　 ＿＿__ ノ　　　 》　　V、＿',
"   \'　　　　　 　 　 　 |_ノ>　―‐＞―t―‐t_ヅﾉ￣　 ﾉ′　Ⅵ、／イ′----　r‐ ´　　 ／　　∨/〉￣',
"   \'　　　　　　　　　　` ―――┬ ｧ ┬r圦-ﾍ.　　　　　　　〉＞／　　 　 ┬i　 ,斗 ≦　　 　 ///',
"   \'　　　　　　　　　　　　　　　　|　l./ | K { ＼　　 　 　 / /_／{ 　 　 　 　　} /　　 　 　 　 / }/--/',
"   \'　　　　　　　　　　　　　　　　|　.＼| | ﾄ＼ハ　 　 _ノ　〔《 　 ＼　　　　//〈_,　 ―――く　/　 /　 /',
"   \'　　　　　　　　　　　　　　　　|　l＼| |_|_〕入∧ /i彡′/rﾍ　　/ ￣￣　,.≦zzzzzzzx　 /７　 /　 /',
"   \'　　　　　　　　　　　　　　　　|　|___|___/≧/ /r ﾍ.　　 | Li_〉,z==―ｫ≦ｧ==ト￣￣￣￣￣￣￣￣',
"   \'　　　　　　　　　　　　　　　 /i7′r‐ｸ,r‐〈 ヘ|　 |i　　 ＞rfﾁ′　／／ ∨ |∧',
"   \'　　　　　　　　　　　　　　　 |/　 f_｢//`　 ＼.|　 }Lz≦ﾆ}} ′ ／／　　　Ⅵ/∧',
"   \'　　　　　　　　　　　　　　 r/.斗/ //　＿＿ ＞壬云斗ﾉ`　／／　　 　 　 ∨//〉 z―――――／',
"   \'　　　　　　　　　　　　 ＿/　|∨i//　/7¨ ／　/　　 /ニxく.／　　　　　　 斗‐＝　 ¨¨¨ ￣￣／',
"   \'　　　　　　　　　　 　 |￣ ＿j/ /｜//r／　ｧ7＿_／／ ／＼　　　＞ ¨　　　　　　　　　　／',
"   \'　　　　　　　　　　 　 |／｢ 丁　　 / ／　／＿_／／ ／　　　＞ ¨　　　　　　　　　＿＿∧＿＿＿',
"   \'　　　　　　　　　　 　 |　 |　i|　 　 }/＼ /¨´ ／／　　　　　／　　　　斗=＝≦¨¨￣￣　∨＿＿＿',
"   \ ]


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

" Don't use line numbers in FZF menu
au FileType fzf set nonu nornu

" Make FZF a floating window
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - (&lines / 2)
  let width = float2nr(&columns - (&columns * 2 / 7))
  let col = float2nr((&columns - width) / 2)
  let row = height/2

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

""
" christoomey/vim-tmux-runner
"   @ Creates a socket between VIM and TMUX for easy test running
"   @ Paired with janko-m/vim-test due to test strategy being `vtr`
"
let test#strategy = "vtr"
let test#ruby#rspec#options = '--format documentation'

""
" tpope/vim-surround
"   @ Improve ERB Tags
"
autocmd FileType eruby let g:surround_45 = "<% \r %>"
autocmd FileType eruby let g:surround_61 = "<%= \r %>"
autocmd FileType eruby let g:surround_33 = "```\r```"

""
" ludovicchabant/vim-gutentags
"   @ Tag settings for Universal CTAGS
"
set tags+=tags;
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', 'Gemfile', 'package.json']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags')

let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

let g:gutentags_ctags_extra_args = [
  \ '--tag-relative=yes',
  \ '--fields=+ailmnS',
  \ ]

let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.svn', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" let g:gutentags_ctags_tagfile = 'tags'

" let g:gutentags_modules = ['ctags']

" let g:gutentags_ctags_executable_ruby = 'rtags -R --extra=q'
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" let g:gutentags_ctags_extra_args += ['--exclude=node_modules']
" let g:tagbar_ctags_bin = '/sbin/ctags'

" TODO make this less instrusive! and match ESLint
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

""
" fatih/vim-go
"   @ Go navigation and tools for VIM
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]/CoC
let g:go_def_mapping_enabled = 0

""
" mboughaba/i3config.vim
"   @ i3 configuration file highlighting
"
" Specify i3 config file
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/dotfiles/.config/i3/config set filetype=i3config
aug end

""
" Raimondi/delimitMate
"   @ Allow expansion on auto pairing
"
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_cr = 1

""
" liuchengxu/vista.vim
"   @ Tag explorer with LSP integration
"
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:65%']
let g:vista#renderer#enable_icon = 1

""
" mattn/calendar-vim
"   @ Calendar and diary helper
"
let g:calendar_filetype = 'markdown'
let g:calendar_diary_extension = '.md'
