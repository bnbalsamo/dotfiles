# Global bash variable declarations, which will exist in all shells.

# Prepend ~/.local/bin to the path, if its not already there somewhere
if [[ -d ${HOME}/.local/bin && ${PATH} != *${HOME}/.local/bin* ]] ; then
        export PATH=${HOME}/.local/bin:"${PATH}:"
fi

# Some handy global vars for opening things
export EDITOR=$( ( [[ `type -t vim` ]] && which vim ) || \
                 ( [[ `type -t vi` ]] && which vi ) || \
                 ( [[ `type -t nano` ]] && which nano) )
export BROWSER=$( ( [[ `type -t firefox` ]] && which firefox ) || \
                  ( [[ `type -t google-chrome-stable` ]] && which google-chrome-stable) )
