# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Source drop-ins
# See ~/.profile.d/*
if [ -d $HOME/.profile.d ]; then
    for i in $HOME/.profile.d/**/*.bash; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi


# Include a .profile.priv if one exists
[[ -f ~/.profile.priv ]] && . ~/.profile.priv
