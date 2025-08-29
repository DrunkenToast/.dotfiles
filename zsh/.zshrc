#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return
#
# PS1='[\u@\h \W]\$ '

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Default on MacOS is 256, not enough!
ulimit -n 10240

export PATH="$VOLTA_HOME/bin:$PATH"
# export DOTNET_ROOT=/usr/local/share/dotnet
# export PATH=$DOTNET_ROOT:$PATH
# export DOTNET_WATCH_SUPPRESS_LAUNCH_BROWSER=true
export ASPNETCORE_ENVIRONMENT=Development
export PATH="$PATH:/Users/peter/.dotnet/tools"
export PATH="$PATH:/Users/peter/fvm/default/bin"

export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

export EDITOR='nvim'
export VISUAL='nvim'

# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
export NDK_HOME="/Users/peter/Library/Android/sdk/ndk/27.0.12077973"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Rust
source "$HOME/.cargo/env"

# Source all cfgs
for rc in ~/.config/zsh/*; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

eval "$(starship init zsh)"


# Load Angular CLI autocompletion.
# source <(ng completion script)


#direnv
export DIRENV_LOG_FORMAT=
eval "$(direnv hook zsh)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
# [[ -f /Users/peter/.dart-cli-completion/zsh-config.zsh ]] && . /Users/peter/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


eval "$(rbenv init - --no-rehash zsh)"

# Created by `pipx` on 2025-08-11 09:30:02
export PATH="$PATH:/Users/peter/.local/bin"
