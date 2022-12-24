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

# Source all cfgs
BASH_CFG="~/.config/bash"
for rc in ~/.config/bash/*; do
    if [ -f "$rc" ]; then
        . "$rc"
    fi
done

eval "$(starship init bash)"

cowsay "Sup, how ya doin'?" | lolcat
