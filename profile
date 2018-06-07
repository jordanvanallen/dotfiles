# Use VI keybinds
set -o vi

# PS1
export PS1=" \[\e[00;34m\]λ \W \[\e[0m\]"

# PATH Exports
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

# Rust Exports
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Ruby Exports
export PATH="$PATH:$HOME/.rvm/bin"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Aliases
alias ls="ls -GF"
alias vi=vim

# Shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
