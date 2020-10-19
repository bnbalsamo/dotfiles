#
# ~/.bashrc
#

# NOTE: .bash_profile sources this file, so everything up to
# the interactive catch runs in login shells as well.

# If not running interactively, stop here 
[[ $- != *i* ]] && return

# Source drop-ins
# See ~/.bashrc.d/*
for f in $(find $HOME/.bashrc.d/ -type f -name *.bash | sort); do . $f; done

# Include a .bashrc.priv if one exists
[[ -f ~/.bashrc.priv ]] && . ~/.bashrc.priv
