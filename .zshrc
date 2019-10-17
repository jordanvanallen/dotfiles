export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.local/bin:$HOME/.npm/bin:$HOME/.cargo/bin:$HOME/.go/bin:$PATH

# Oh my ZSH
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=7

# ZSH Settings
COMPLETION_WAITING_DOTS="true"

# FZF
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND="rg --files --hidden"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go
export GOPATH="$HOME/.go"

# NVM
export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# Rbenv (Ruby Version Manager)
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_PUB_KEY_PATH="~/.ssh/rsa_id.pub"

source $ZSH/oh-my-zsh.sh

# Purs ZSH Prompt
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

# Make Ctrl-z also resume background process
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle flush-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

plugins=(
  fzf
  # https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
  zsh-autosuggestions
  tmux
  rbenv
  rust
)

# Z
. /usr/local/share/z/z.sh

# User configuration

export EDITOR='nvim'

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

# Config Aliases
alias zshconfig="vi ~/dotfiles/.zshrc"
alias ohmyzshconfig="vi ~/.oh-my-zsh"
alias viconfig="vi ~/dotfiles/.vimrc"

# Sourcing
alias sourcezsh="source ~/.zshrc"

# Handy
alias weather='curl wttr.in/43.6404,-79.4238'
alias yt="mpv"

# Colourscheme
alias set_colours='wal -i ~/.background.jpg -a 25 -b 2d2d2c'

if [ -f /usr/bin/sw_vers ]; then
  source ~/.config/zsh/mac
else
  source ~/.config/zsh/linux
fi

# Start TMUX
if [ "$TMUX" -eq "" ]; then
  tmux new-session
fi 2>/dev/null

# Auto-enable TMUX statusline from nvim
vi -c ":q"
