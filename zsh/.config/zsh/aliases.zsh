#!/usr/bin/env zsh

# General aliases
alias vim='nvim'
alias v='nvim'
alias cat='bat -p'
alias storage='sudo du -h | sort -h; df -h'
alias add="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"

# Util aliases
alias eza='eza --color=auto --color-scale --group-directories-first'    #'ls --color=auto --group-directories-first'    # Add --icons once it is supported
alias ls='eza'
alias l='ls -Fl --icons'    #'ls -lFh'                    #size,show type,human readable
alias la='ls -Fla --icons'    #'ls -lAFh'                #long list,show almost all,show type,human readable
alias lr='ls -RFrs modified'    #'ls -tRFh'        #sorted by date,recursive,show type,human readable
alias lt='ls -lrFs modified'    #'ls -ltFhi'    #long list,sorted by date,show type,human readable
alias ll='ls -lg --icons'    #'ls -l'                    #long list
alias lsdot='ls -d .*'    #'ls -d .*'
alias ldot='ls -ld .*'    #'ls -ld .*'
alias lS='ls -1FrSs size'    #'ls -1FSsh'
alias lart='ls -1aFt modified -s modified'    #'ls -1Fcaert'
alias lrt='ls -1Ft modified -s modified'    #'ls -1Fcrt'

alias gcd='cd "$(git rev-parse --show-toplevel)"'

fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

search-kill() {
    local pid
    pid=$(lsof -i -P | egrep 'TCP.*LISTEN|UDP' | awk '{print $2 " " $1 " "  $8 " " $9 " " $NF}' | sort -n | fzf -m | awk '{print $1}')
    echo "Killing $pid"
    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}
