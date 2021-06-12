#
# ~/.bashrc
#

# NOTE: .bash_profile sources this file, so everything up to
# the interactive catch runs in login shells as well.

# If not running interactively, stop here 
[[ $- != *i* ]] && return

# Source drop-ins
# See ~/.bashrc.d/*
if [ -d $HOME/.bashrc.d ]; then
    for i in $HOME/.bashrc.d/**/*.bash; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi


# Include a .bashrc.priv if one exists
[[ -f ~/.bashrc.priv ]] && . ~/.bashrc.priv
