" Auto install Plug for new machines
let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o' . autoload_plug_path .
      \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin('~/.config/nvim/plugged')

" --- General ---
Plug 'tpope/vim-sensible'   " -- Bring in sensible settings such as allowing 'u' keybind for undo
Plug 'tpope/vim-repeat'     " -- Repeat commands
Plug 'tpope/vim-sleuth'     " -- Helps with indenting by FileType
Plug 'Raimondi/delimitMate' " -- Auto pairing
Plug 'Yggdroot/indentLine'  " -- Provide visuals for identation

" --- TMUX ---
Plug 'edkolev/tmuxline.vim'           " -- TMUX Bar uses lightline bar
Plug 'christoomey/vim-tmux-navigator' " -- Seamlessly move between nvim and tmux buffers
Plug 'christoomey/vim-tmux-runner'    " -- Run nvim commands (ie: tests) in tmux buffers

" --- Autocompletion and Linting ---
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " -- Visual Studio like completion framework
Plug 'dense-analysis/ale'                         " -- Async linting

" --- Snippets ---
Plug 'honza/vim-snippets' " -- Snippets to feed CocSnippets

" --- Fuzzy Finding ---
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" --- File Manipulation ---
Plug 'tpope/vim-eunuch' " -- Unix commands

" --- Text Manipulation ---
Plug 'wellle/targets.vim'     " -- Improve cursor positioning for using ciX based commands
Plug 'tpope/vim-commentary'   " -- Allow gcc keybind for easy commenting
Plug 'tpope/vim-speeddating'  " -- Make dates easy
Plug 'tpope/vim-surround'     " -- Allow for S to group and surround text objects in visual mode with brackets, etc
Plug 'mg979/vim-visual-multi' " -- Multi-cursor for Visual mode
Plug 'godlygeek/tabular', { 'on': ['<Plug>Tabularize', 'Tabularize'] } " -- Tableize things!

" --- Git ---
Plug 'tpope/vim-fugitive' " -- Provide Git blame
Plug 'jreybert/vimagit', { 'on': ['<Plug>Magit', '<Plug>MagitOnly', 'MagitOnly', 'Magit'] } " -- Git editing for commits and diffs

" --- Tags ---
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim' ", { 'on': ['Vista', 'Vista!!'] }

" --- Language/Syntax Specific ---
"
" -- i3
Plug 'mboughaba/i3config.vim', { 'for': 'i3config' }
"
" -- Crystal
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
"
" -- Go
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoUpdateBinaries' } " -- Go project navigation, etc.
"
" -- GraphQL
Plug 'jparise/vim-graphql', { 'for': ['graphql'] }
"
" -- Lua
Plug 'tbastos/vim-lua', { 'for': ['lua'] }
"
" -- Ruby (+Rails)
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }                     " -- Ruby support
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }              " -- Rails project navigations
Plug 'tpope/gem-ctags', { 'for': ['ruby', 'eruby'] }              " -- Ctags automation for gems
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'eruby', 'crystal'] } " -- Automatically add 'end' statements for ruby
Plug 'keith/rspec.vim', { 'for': ['ruby'] }                       " -- Better rspec syntax highlighting
"
" -- Rust
Plug 'timonv/vim-cargo', { 'for': 'rust' } " -- Provides cargo commands
"
" -- Wiki
Plug 'vimwiki/vimwiki'

" --- Unit Testing ---
Plug 'janko-m/vim-test'

" --- Pretty Visuals (Colourschemes, Icons, etc) ---
"
" -- Colourschemes
Plug 'taigacute/gruvbox9'   " -- For 256 colour scheme
Plug 'shinchu/lightline-gruvbox.vim'
"
" -- Icons
Plug 'ryanoasis/vim-devicons'
"
" -- Startup
Plug 'mhinz/vim-startify'

" --- Status Bar --
Plug 'itchyny/lightline.vim'

call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install
