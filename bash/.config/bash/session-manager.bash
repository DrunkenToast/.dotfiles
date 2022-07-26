#!/usr/bin/env bash

PROJECTS=~/projects

# Session aliases
pp() {
    local FOLDERS=$(find "$PROJECTS" -mindepth 1 -maxdepth 1 -type d,l -printf "%T+\t%p\n" | sort -r | awk '{print $2}')
    local FOLDER=$(
        echo $FOLDERS | tr ' ' '\n' | fzf --preview "
        onefetch {} 2>/dev/null;
        exa -l {};
        bat --color always {}/README.md 2>/dev/null"
    )
    cd $FOLDER
}

pps() {
    pp
    local SESSION_NAME=$(pwd | awk -F'/' '{print $NF}')

    ts $SESSION_NAME
}

ts() {
    if [ -z $1 ]; then
        tmux switch-client -l
    else
        if [ -z "$TMUX" ]; then
            tmux new -As $1
            # tmux switch -t $1
        else
            if ! tmux has-session -t $1 2>/dev/null; then
                TMUX=tmux new-session -ds $1
            fi
            tmux switch-client -t $1
        fi
    fi
    

    if ! tmux has-session -t $1 2>/dev/null; then
        TMUX= tmux new-session -ds $1
      fi
      tmux switch-client -t $1
}

# tmux session tab complete function
_tmux_complete_session() {
  local IFS=$'\n'
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( ${COMPREPLY[@]:-} $(compgen -W "$(tmux -q list-sessions | cut -f 1 -d ':')" -- "${cur}") )
}
complete -F _tmux_complete_session tm
