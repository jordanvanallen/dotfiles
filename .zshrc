export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.local/bin:$HOME/.npm/bin:$HOME/.cargo/bin:$HOME/.go/bin:$HOME/.emacs.d/bin:$PATH

export EDITOR='nvim'

# Oh my ZSH
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=7
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false

# ZSH Settings
COMPLETION_WAITING_DOTS="true"

# Disable Wayland window borders
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# FZF
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND="rg --files --hidden"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go
export GOPATH="$HOME/.go"

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_PUB_KEY_PATH="~/.ssh/rsa_id.pub"

# `cargo install starship`
eval "$(starship init zsh)"

# Z
. $HOME/sources/z/z.sh

if [ -f /usr/bin/sw_vers ]; then
  source ~/.config/zsh/mac
else
  source ~/.config/zsh/linux
fi

plugins=(
  fzf
  # https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
  tmux
  asdf
  fancy-ctrl-z
  ripgrep
  fd
)

# start asdf
. $HOME/.asdf/asdf.sh

# Run OhMyZSH and plugins
autoload -Uz compinit
compinit
source $ZSH/oh-my-zsh.sh

source ~/.config/zsh/aliases

# This needs to happen last
if [ -f /sbin/kitty ]; then
  kitty + complete setup zsh | source /dev/stdin
fi
