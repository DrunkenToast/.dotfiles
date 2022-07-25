#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source /usr/share/nvm/init-nvm.sh

# doas
complete -cf doas
alias sudo='doas'

. "$HOME/.cargo/env"

complete -cf prime-run

# FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# General aliases
alias vim='nvim'
alias cat='bat -p'
alias storage='doas du -h | sort -h; df -h'
alias add="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"

# Util aliases
alias exa='exa --color=auto --color-scale --group-directories-first'    #'ls --color=auto --group-directories-first'    # Add --icons once it is supported
alias ls='exa'
alias l='ls -Fl'    #'ls -lFh'                    #size,show type,human readable
alias la='ls -Fla'    #'ls -lAFh'                #long list,show almost all,show type,human readable
alias lr='ls -RFrs modified'    #'ls -tRFh'        #sorted by date,recursive,show type,human readable
alias lt='ls -lrFs modified'    #'ls -ltFhi'    #long list,sorted by date,show type,human readable
alias ll='ls -lg'    #'ls -l'                    #long list
alias lsdot='ls -d .*'    #'ls -d .*'
alias ldot='ls -ld .*'    #'ls -ld .*'
alias lS='ls -1FrSs size'    #'ls -1FSsh'
alias lart='ls -1aFt modified -s modified'    #'ls -1Fcaert'
alias lrt='ls -1Ft modified -s modified'    #'ls -1Fcrt'

alias gcd='cd "$(git rev-parse --show-toplevel)"'
PROJECTS=~/projects
alias pp='cd $PROJECTS/$(
    ls -D $PROJECTS -t modified --sort newest |
    fzf --preview "
        onefetch $PROJECTS/{} 2>/dev/null;
        exa -al $PROJECTS/{};
        bat --color always $PROJECTS/{}/README.md 2>/dev/null
    "
)
'  

# Session aliases
pd() {
    echo $TMUX
    local SESSION_NAME=$(ls -D $PROJECTS -t modified --sort newest | fzf --preview "
        onefetch $PROJECTS/{} 2>/dev/null;
        exa -al $PROJECTS/{};
        bat --color always $PROJECTS/{}/README.md 2>/dev/null"
    )

    cd $PROJECTS/$SESSION_NAME
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


eval "$(starship init bash)"

