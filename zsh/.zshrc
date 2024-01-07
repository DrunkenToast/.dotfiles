#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return
#
# PS1='[\u@\h \W]\$ '

export PATH="$VOLTA_HOME/bin:$PATH"

export DOTNET_ROOT=/usr/local/share/dotnet/x64
export PATH=$DOTNET_ROOT:$PATH
export DOTNET_WATCH_SUPPRESS_LAUNCH_BROWSER=true
export ASPNETCORE_ENVIRONMENT=Development
export PATH="$PATH:/Users/peter/.dotnet/tools"

export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

export EDITOR='nvim'
export VISUAL='nvim'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Rust
source "$HOME/.cargo/env"

# Source all cfgs
for rc in ~/.config/zsh/*; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

eval "$(starship init zsh)"
