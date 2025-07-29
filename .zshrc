# =============================================================================
# ENVIRONMENT VARIABLES
# =============================================================================

# Core paths and tools
export EDITOR='nvim'
export ASDF_DATA_DIR="$HOME/.asdf"
export GOPATH="$HOME/.go"

# CUDA setup
export CUDA_HOME=/usr/local/cuda-11.7
export LIBOPENCL=/opt/cuda/lib64
export LD_LIBRARY_PATH=/usr/local/lib/:$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# Compiler setup
export CC=/usr/bin/gcc-11
export CXX=/usr/bin/g++-11

# SSL certificates
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# SSH keys
export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_PUB_KEY_PATH="~/.ssh/rsa_id.pub"

# FZF configuration
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore .git"

# Bun
export BUN_INSTALL="$HOME/.bun"

# =============================================================================
# PATH CONSTRUCTION
# =============================================================================

# Build PATH systematically to avoid duplicates
typeset -U path  # This ensures unique entries in PATH
path=(
  $HOME/bin
  $HOME/.local/bin
  $HOME/.npm/bin
  $HOME/.cargo/bin
  $HOME/.go/bin
  $HOME/.nimble/bin
  $HOME/.emacs.d/bin
  $HOME/.spicetify
  $HOME/sources/jetbrains-toolbox
  $HOME/sources/LightGBM
  $BUN_INSTALL/bin
  $ASDF_DATA_DIR/shims
  $CUDA_HOME/bin
  /usr/local/bin
  /sbin
  /usr/sbin
  # /opt/anaconda/bin  # Removed - uncomment if you need conda
  $path
)

# =============================================================================
# ZINIT PLUGIN MANAGER (Modern alternative to oh-my-zsh)
# =============================================================================

# Install zinit if not present
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$ZINIT_HOME" && command chmod g-rwX "$ZINIT_HOME"
  command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$ZINIT_HOME/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# =============================================================================
# PLUGINS (Fast and modern alternatives)
# =============================================================================

# Load critical plugins first (fast loading)
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Load zsh-defer for deferred loading
zinit light "romkatv/zsh-defer"

# Defer non-critical plugins for faster startup
zinit ice wait"0" lucid
zinit light zsh-users/zsh-completions

zinit ice wait"0" lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice wait"0" lucid  
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

zinit ice wait"0" lucid
zinit light "Aloxaf/fzf-tab"

zinit ice wait"0" lucid
zinit light "agkozak/zsh-z"

# Defer development tools
zinit ice wait"1" lucid
zinit snippet OMZ::plugins/asdf/asdf.plugin.zsh

# Rust completions - generate them properly (deferred)
zinit ice wait"1" lucid atload'
if command -v rustup >/dev/null 2>&1; then
  mkdir -p ~/.local/share/zsh/completions
  
  if [[ ! -f ~/.local/share/zsh/completions/_rustup ]]; then
    rustup completions zsh > ~/.local/share/zsh/completions/_rustup
  fi
  
  if [[ ! -f ~/.local/share/zsh/completions/_cargo ]]; then
    rustup completions zsh cargo > ~/.local/share/zsh/completions/_cargo
  fi
  
  fpath=(~/.local/share/zsh/completions $fpath)
fi
'
zinit load zdharma-continuum/null

# Fast completion loading
autoload -Uz compinit
# Only rebuild completion cache once per day
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# =============================================================================
# ZSH CONFIGURATION
# =============================================================================

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# Completion behavior
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
setopt MENU_COMPLETE

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Misc
setopt INTERACTIVE_COMMENTS
setopt MULTIOS
setopt NOTIFY

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# =============================================================================
# EXTERNAL TOOL INTEGRATIONS (Optimized for speed)
# =============================================================================

# Load private environment variables
[[ -f ~/.env ]] && source ~/.env

# Platform-specific configurations (defer if possible)
if [[ -f /usr/bin/sw_vers ]]; then
  # macOS
  [[ -f ~/.config/zsh/mac ]] && source ~/.config/zsh/mac
else
  # Linux  
  [[ -f ~/.config/zsh/linux ]] && source ~/.config/zsh/linux
fi

# Load aliases
[[ -f ~/.config/zsh/aliases ]] && source ~/.config/zsh/aliases

# Defer heavy integrations
defer_rust() {
  [[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env
}

defer_opam() {
  [[ -f ~/.opam/opam-init/init.zsh ]] && source ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null
}

defer_bun() {
  [[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"
}

defer_direnv() {
  command -v direnv >/dev/null && eval "$(direnv hook zsh)"
}

# Load immediately for interactive use
defer_rust

# Defer others after shell loads - these are the slowest
zsh-defer defer_opam
zsh-defer defer_bun  
zsh-defer defer_direnv

# FZF - defer loading since it's slow
defer_fzf() {
  [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
}

# Only load FZF if interactive and defer it
if [[ -o interactive ]]; then
  zsh-defer defer_fzf
fi

# =============================================================================
# PROMPT
# =============================================================================

# Initialize Starship prompt
eval "$(starship init zsh)"

# =============================================================================
# TMUX AUTO-START (Fixed)
# =============================================================================

# Auto-start tmux for interactive shells (but not if already in tmux/screen)
if [[ -z "$TMUX" ]] && [[ -z "$SCREEN" ]] && [[ "$TERM" != "screen"* ]] && [[ -n "$SSH_TTY" || -n "$DISPLAY" ]]; then
  # Only auto-start if tmux is available and this is an interactive session
  if command -v tmux >/dev/null 2>&1 && [[ $- == *i* ]]; then
    exec tmux new-session -A -s main
  fi
fi


[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
