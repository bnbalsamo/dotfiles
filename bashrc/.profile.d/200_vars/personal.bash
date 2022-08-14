# Global bash variable declarations, which will exist in all shells.

# Prepend ~/.local/bin to the path, if its not already there somewhere
if [[ -d ${HOME}/.local/bin && "${PATH}" != *"${HOME}/.local/bin"* ]] ; then
        export PATH=${HOME}/.local/bin:"${PATH}:"
fi

# Prepend ~/bin to the path, if its not already there somewhere
if [[ -d ${HOME}/bin && "${PATH}" != *"${HOME}/bin"* ]] ; then
        export PATH=${HOME}/bin:"${PATH}:"
fi

# Use a python startup file if one exists
if [[ -e $HOME/.pythonrc ]]; then export PYTHONSTARTUP=$HOME/.pythonrc; fi

# Some handy global vars for opening things
export EDITOR=$( ( [[ `type -t vim` ]] && which vim ) || \
                 ( [[ `type -t vi` ]] && which vi ) || \
                 ( [[ `type -t nano` ]] && which nano) )
export BROWSER=$( ( [[ `type -t firefox` ]] && which firefox ) || \
                  ( [[ `type -t google-chrome-stable` ]] && which google-chrome-stable) )

