# #!/usr/bin/env bash

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#source /usr/share/fzf/completion.bash
#
export FZF_CTRL_R_OPTS="
  --preview 'echo -n {2..}' 
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

