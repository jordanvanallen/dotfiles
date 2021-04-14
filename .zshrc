export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.local/bin:$HOME/.npm/bin:$HOME/.cargo/bin:$HOME/.go/bin:$HOME/.nimble/bin:$HOME/.emacs.d/bin:$HOME/.asdf/shims:$PATH

export EDITOR='nvim'

# Oh my ZSH
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""
export UPDATE_ZSH_DAYS=7
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false

if [ -f ~/.env ]; then
  source ~/.env
fi

# ZSH Settings
COMPLETION_WAITING_DOTS="true"

# Disable Wayland window borders
# export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# export XDG_SESSION_TYPE=wayland
# export GDK_BACKEND=wayland

# FZF
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND="rg --files --hidden"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go
export GOPATH="$HOME/.go"

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_PUB_KEY_PATH="~/.ssh/rsa_id.pub"

# Z
. $HOME/sources/z/z.sh

if [ -f /usr/bin/sw_vers ]; then
  source ~/.config/zsh/mac
else
  source ~/.config/zsh/linux
fi

plugins=(
  fzf                       # OhMyZsh
  zsh-autosuggestions       # Git
  zsh-syntax-highlighting   # Git
  tmux                      # OhMyZsh
  fancy-ctrl-z              # OhMyZsh
)

# Load Starship prompt
eval "$(starship init zsh)"

# Run OhMyZSH and plugins
autoload -Uz compinit
compinit
source $ZSH/oh-my-zsh.sh

source ~/.config/zsh/aliases

if [ -f /sbin/kitty ]; then
  kitty + complete setup zsh | source /dev/stdin
fi

# Starting asdf needs to happen last
. $HOME/.asdf/asdf.sh
