export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.local/bin:$HOME/.npm/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export NVM_AUTO_USE=true # Needed for zsh-nvm plugin
export NVM_LAZY_LOAD=true

# FZF
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND="rg --files --hidden"
# export FZF_DEFAULT_OPTS="-e --hidden --follow --glob \"!.git/*\""
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="lambda-pure"

# Powerlevel9k Settings
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_peace_icon dir vcs)
# POWERLEVEL9K_DISABLE_RPROMPT=true
# POWERLEVEL9K_MODE="nerdfont-complete"
# POWERLEVEL9K_DIR_BACKGROUND=182
# POWERLEVEL9K_VCS_BACKGROUND=182

# # Powerlevel9k icons
# POWERLEVEL9K_CUSTOM_PEACE_ICON="echo "
# POWERLEVEL9K_CUSTOM_PEACE_ICON_BACKGROUND=182
# POWERLEVEL9K_CUSTOM_PEACE_ICON_FOREGROUND=015

# POWERLEVEL9K_CUSTOM_ARCH_ICON="echo "
# POWERLEVEL9K_CUSTOM_ARCH_ICON_BACKGROUND=182 # Pink
# # POWERLEVEL9K_CUSTOM_ARCH_ICON_BACKGROUND=97 # Purple
# POWERLEVEL9K_CUSTOM_ARCH_ICON_FOREGROUND=015


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
source $ZSH/oh-my-zsh.sh

function zle-line-init zle-keymap-select {
  PROMPT=`$HOME/sources/purs/target/release/purs prompt -k "$KEYMAP" -r "$?" --venv "${${VIRTUAL_ENV:t}%-*}"`
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz add-zsh-hook

function _prompt_purs_precmd() {
  $HOME/sources/purs/target/release/purs precmd
}
add-zsh-hook precmd _prompt_purs_precmd

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fzf

  # NodeJS
  npm
  zsh-nvm

  zsh-autosuggestions

  # Ruby Plugins
  rake
  rbenv
  bundler

  # Unix Plugins
  tmux

  # Handy
  web-search

  # Rust
  rust
)


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
# Unix Command Overrides
alias dd='dd status=progress'
alias top='vtop'
alias ls='exa --icons'
alias la='exa -la --icons'
alias magit='vim -c MagitOnly'
alias tmux='tmux -f $HOME/.tmux.conf'
alias vi="nvim"
#
# Config Aliases
alias zshconfig="vi ~/dotfiles/.zshrc"
alias ohmyzshconfig="vi ~/.oh-my-zsh"
alias viconfig="vi ~/dotfiles/.vimrc"

alias sourcezsh="source ~/.zshrc"

# Handy
alias weather='curl wttr.in/43.6404,-79.4238'
alias yt="mpv"

# Colourscheme
alias set_colours='wal -i ~/.background.jpg -a 25 -b 2d2d2c'

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Z
. /usr/local/share/z/z.sh

# Rbenv (Ruby Version Manager)
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

export PATH=$PATH:$HOME/bin

# Burp Suite Pro
export PATH=$PATH:/opt/BurpSuitePro

# Android Studio
export PATH=$PATH:/opt/android-studio/bin

if [ -f /usr/bin/sw_vers ]; then # Mac
  source ~/.config/zsh/mac
else # Linux
  source ~/.config/zsh/linux
fi

# Start TMUX
if [ "$TMUX" -eq "" ]; then
  tmux new-session
fi 2>/dev/null

vi -c ":q"
