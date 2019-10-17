" Autoload NVIM Plug for new machines
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

" Make VIM sensible
Plug 'tpope/vim-repeat'

" Ruby end for blocks
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'eruby'] }

" Helps with indenting by FileType
Plug 'tpope/vim-sleuth'

" Prettier formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Allow for S to group in visual mode and then surround text object with brackets, etc.
Plug 'tpope/vim-surround'

" Allow gcc keybind for easy commenting
Plug 'tpope/vim-commentary'

" Bring in sensible settings such as allowing 'u' keybind for undo
Plug 'tpope/vim-sensible'

" Provide Git blame
Plug 'tpope/vim-fugitive'

" Git editing for commits and diffs
Plug 'jreybert/vimagit', { 'on': ['<Plug>Magit', '<Plug>MagitOnly', 'MagitOnly', 'Magit'] }

" Debugging
Plug 'sebdah/vim-delve', { 'for': 'go' }

" Auto pairing
Plug 'Raimondi/delimitMate'

" Provide visual line to show indentation for easier reading and refactoring
Plug 'Yggdroot/indentLine'

" Improve cursor positioning for using ciX based commands
Plug 'wellle/targets.vim'

" VIM language packs
Plug 'prurigro/vim-polyglot-darkcloud'

" Distration free writing when needed
Plug 'junegunn/goyo.vim', { 'on': ['<Plug>Goyo', 'Goyo'] }

" Visual Studio like completion framework
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }

" NERD Tree will be lazy loaded on first call to NERDTreeToggle
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Tags
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim', { 'on': ['Vista', 'Vista!!'] }

" Fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'honza/vim-snippets'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons for the status bar
Plug 'ryanoasis/vim-devicons'

" Integrate status bar from nvim with TMUX
Plug 'edkolev/tmuxline.vim'

" Tableize things!
Plug 'godlygeek/tabular', { 'on': ['<Plug>Tabularize', 'Tabularize'] }

" Testing and send tests to TMUX
Plug 'christoomey/vim-tmux-runner'
Plug 'janko-m/vim-test'

" Provide cargo commands
Plug 'timonv/vim-cargo', { 'for': 'rust' }

" Startup screen
Plug 'mhinz/vim-startify'

" Colourschemes
Plug 'liuchengxu/space-vim-theme'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'taigacute/gruvbox9'

call plug#end()
" END OF PLUGINS

if plug_install
    PlugInstall --sync
endif
unlet plug_install
