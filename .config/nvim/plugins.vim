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

" Dates made easy
Plug 'tpope/vim-speeddating'

" Easy rails directory navigations
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'eruby', 'crystal'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rbenv', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby'] }
Plug 'ngmy/vim-rubocop', { 'for': ['ruby', 'eruby'] }

" Helps with indenting by FileType
Plug 'tpope/vim-sleuth'

" Prettier formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript'] }

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
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }

" Distration free writing when needed
Plug 'junegunn/goyo.vim', { 'on': ['<Plug>Goyo', 'Goyo'] }

" Async Linting
Plug 'dense-analysis/ale'

" Visual Studio like completion framework
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }

" NERD Tree will be lazy loaded on first call to NERDTreeToggle
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim' ", { 'on': ['Vista', 'Vista!!'] }

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

" Calendar
Plug 'mattn/calendar-vim'

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
Plug 'icymind/NeoSolarized'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/space-vim-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'taigacute/gruvbox9'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'cocopon/iceberg.vim'

call plug#end()
" END OF PLUGINS

if plug_install
    PlugInstall --sync
endif
unlet plug_install
