" ===========================
" Plugin Mappings
" ===========================

""
" tpope/fugitive
"   @ Gives a Git Blame window
"
nnoremap <silent> <Leader>gb :Gblame<CR>

""
" jreybert/vimagit
"   @ Brings up Git Magit window
"
nnoremap <silent> <Leader>gm :MagitOnly<CR>

""
" godlygeek/tabular
"   @ Aligns characters of the same time easily
"   @ Add your own handy mapping here
"
vmap tt :Tabularize<Space>/
vmap t= :Tabularize<Space>/=<CR>
vmap t- :Tabularize<Space>/-<CR>
vmap t: :Tabularize<Space>/:<CR>
vmap t" :Tabularize<Space>/"<CR>
vmap t' :Tabularize<Space>/'<CR>
vmap t@ :Tabularize<Space>/@<CR>
vmap t> :Tabularize<Space>/=><CR>

""
" christoomey/vim-tmux-runner
"   @ Creates a socket between VIM and TMUX for easy test running
"   @ Paired with janko-m/vim-test with `let test#strategy = "vtr"`
"
nnoremap <silent> <Leader>A :VtrAttachToPane<CR>
nnoremap <silent> <Leader>c :VtrClearRunner<CR>

""
" janko-m/vim-test
"   @ Mappings to run any test(s) sent straight to TMUX through
"   christoomey/vim-tmux-runner
"
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>tv :TestVisit<CR>

""
" junegunn/fzf.vim
"   @ FZF Fuzzing finding ft. Ripgrep
"
nmap ; :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>F :GFiles?<CR>
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>S :Rg <C-r><C-W><CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>H :History:<CR>
nnoremap <Leader>C :Colors<CR>

nnoremap <silent> <c-p> :call fzf#vim#tags("'" . expand('<cword>'))<cr>

""
" majutsushi/tags
"   @ Display tags on the fly
"
map <silent> <C-t> :TagbarToggle<CR>

""
" liuchengxu/vista.vim
"   @ Tag explorer with LSP integration
"
nnoremap <silent> <Leader>vv :Vista!!<CR>
nnoremap <silent> <Leader>vf :Vista finder<CR>

""
" scrooloose/nerdtree
"   @ File explorer
"
map <silent> <C-n> :NERDTreeToggle<CR>
