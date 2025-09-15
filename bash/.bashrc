# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"
export PROMPT_COMMAND="$PROMPT_COMMAND;starship_precmd"

source /usr/share/nvm/init-nvm.sh

export PATH=$PATH:$HOME/.cargo/bin/
. "$HOME/.cargo/env"

export EDITOR='nvim'
export VISUAL='nvim'

# Source all cfgs
BASH_CFG="~/.config/bash"
for rc in ~/.config/bash/*; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

