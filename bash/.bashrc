#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

source /usr/share/nvm/init-nvm.sh

export PATH=$PATH:$HOME/.cargo/bin/

# ionic dev
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export CAPACITOR_ANDROID_STUDIO_PATH=/usr/bin/android-studio


# tauri
export JAVA_HOME="/opt/android-studio/jre" # if you are using Android Studio, the location is different, see the section above about JDK
export ANDROID_HOME="$HOME/Android/Sdk" # if you are using Android Studio, the sdk location will be at `~/Android/Sdk`
export NDK_HOME="$ANDROID_HOME/ndk/25.1.8937393"

# Source all cfgs
BASH_CFG="~/.config/bash"
for rc in ~/.config/bash/*; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

eval "$(starship init bash)"

# Add dotnet tools to path
export PATH="$HOME/.dotnet/tools:$PATH"

# bash parameter completion for the dotnet CLI

function _dotnet_bash_complete()
{
  local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n'
  local candidates

  read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)

  read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}

complete -f -F _dotnet_bash_complete dotnet


# Load Angular CLI autocompletion.
source <(ng completion script)

cowsay "Sup, how ya doin'?" | lolcat
