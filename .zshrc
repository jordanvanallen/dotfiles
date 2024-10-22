# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export JAVA_HOME=$(/usr/libexec/java_home)
export CUDA_HOME=/usr/local/cuda-11.7
export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.local/bin:$HOME/.npm/bin:$HOME/.cargo/bin:$HOME/.go/bin:$HOME/.nimble/bin:$HOME/.emacs.d/bin:$HOME/.asdf/shims:$HOME/sources/jetbrains-toolbox:/opt/anaconda/bin:$HOME/sources/LightGBM:$CUDA_HOME/bin:$PATH

export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# For XGBoost
# export LD_LIBRARY_PATH=/usr/local/lib/:$CUDA_HOME/lib64:/opt/anaconda/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib/:$CUDA_HOME/lib64:$LD_LIBRARY_PATH

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

export EDITOR='nvim'

# Cuda for LLM
export LIBOPENCL=/opt/cuda/lib64
export CC=/usr/bin/gcc-11
export CXX=/usr/bin/g++-11

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
export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore .git"
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
else
  source ~/.config/zsh/linux
fi

# Load Starship prompt
# eval "$(starship init zsh)"

source ~/.config/zsh/aliases

# if [ -f /sbin/kitty ]; then
#   kitty + complete setup zsh | source /dev/stdin
# fi

plugins=(
  git
  asdf
  zsh-autosuggestions
  sudo
  magic-enter
  tmux
)

source $ZSH/oh-my-zsh.sh

# Starting asdf needs to happen last
if [ -f $HOME/.asdf/asdf.sh ]; then
  # Linux
  . $HOME/.asdf/asdf.sh
elif [ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]; then
  # Mac
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

# Source Rustup
source $HOME/.cargo/env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Initialize TMUX
if [ -n "$WINDOWID" ] && [[ ! $TERM =~ screen ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# opam configuration
[[ ! -r /home/san/.opam/opam-init/init.zsh ]] || source /home/san/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# bun completions
[ -s "/home/san/.bun/_bun" ] && source "/home/san/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
