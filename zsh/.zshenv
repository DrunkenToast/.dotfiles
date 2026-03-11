. "$HOME/.cargo/env"

# Load direnv for non-interactive shells
if command -v direnv &>/dev/null; then
  eval "$(direnv export zsh 2>/dev/null)"
fi
