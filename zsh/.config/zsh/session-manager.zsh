# #!/usr/bin/env zsh
local PROJECTS=/Users/peter/projects
local COLLECTIONS="/work/haystack\n/work/biontech"

pp() {
    local FOLDERS=$(
        fd -H --max-depth 5 --type d --glob '.git' --exec dirname {} \; "$PROJECTS" | sort -r | sed "s|^$PROJECTS||"
    )

    local FOLDER=$(
        echo "${FOLDERS}\n${COLLECTIONS}" | fzf --preview "
            onefetch '${PROJECTS}{}' 2>/dev/null;
            eza -l '${PROJECTS}{}';
            bat --color always '${PROJECTS}{}/README.md' 2>/dev/null
        "
    )

    if [ $? -eq 0 ]; then
        cd "${PROJECTS}/${FOLDER}"
    fi
}

pps() {
    pp
    local SESSION_NAME=$(basename $PWD)

    ts $SESSION_NAME
}

ts() {
    if [ -z $1 ]; then
        tmux switch-client -l
    else
        if [ -z "$TMUX" ]; then
            tmux new -As $1
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
    COMPREPLY=( ${COMPREPLY[@]:-} $(compgen -W "$(tmux ls -F "#{session_name}")" -- "${cur}") )
}
complete -F _tmux_complete_session ts

