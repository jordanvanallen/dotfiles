# Set monitor
export MONITOR="DP1"

export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# FZF
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"
# ZSH_THEME="norm"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fzf

  # Ruby Plugins
  rake
  rbenv
  bundler

  # Unix Plugins
  sudo
  tmux

  # Handy
  web-search
  zsh-syntax-highlighting

  # Rust
  rust
)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_PUB_KEY_PATH="~/.ssh/rsa_id.pub"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
#
# Configs
alias zshconfig="vi ~/dotfiles/.zshrc"
alias ohmyzshconfig="vi ~/.oh-my-zsh"
alias viconfig="vi ~/dotfiles/.vimrc"

alias sourcezsh="source ~/.zshrc"

# Unix Command Overrides
alias dd='dd status=progress'
alias top='vtop'
alias ls='exa'
alias la='exa -la'
alias vi='vim'

# Handy
alias weather='curl wttr.in/43.6404,-79.4238'
alias yt="mpsyt"

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Kitty Terminal
# autoload -Uz compinit
# compinit
# kitty + complete setup zsh | source /dev/stdin

# Z
. /usr/local/share/z/z.sh

# Control to escape when tapped
xcape -e "Control_L=Escape"
