#
# ~/.bashrc
#

# NOTE: .bash_profile sources this file, so everything up to
# the interactive catch runs in login shells as well.

# Global vars, path manipulation
. $HOME/.bash_decls

# If not running interactively, stop here 
[[ $- != *i* ]] && return

# PS1 stuff
. $HOME/.bash_ps1

# Aliases
. $HOME/.bash_aliases

# Functions
. $HOME/.bash_funcs

# Tooling
. $HOME/.bash_tooling

# Include a .bashrc.priv if one exists
[[ -f ~/.bashrc.priv ]] && . ~/.bashrc.priv
