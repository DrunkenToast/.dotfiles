#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return
#
# PS1='[\u@\h \W]\$ '

export PATH="$VOLTA_HOME/bin:$PATH"

# Source all cfgs
for rc in ~/.config/zsh/*; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

eval "$(starship init zsh)"
