#
# ~/.bashrc
#

# NOTE: .bash_profile sources this file, so everything up to
# the interactive catch runs in login shells as well.

# Global vars, path manipulation
. $HOME/.bash_decls

# If not running interactively, stop here 
[[ $- != *i* ]] && return

# Odds and ends
# History stuff
# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Disable completion when the input buffer is empty.  i.e. Hitting tab
# and waiting a long time for bash to expand all of $PATH.
shopt -s no_empty_cmd_completion

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
