# Make things colorful
# ls
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls="ls --color=auto"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls="ls -G"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    alias ls="ls --color=auto"
elif [[ "$OSTYPE" == "msys" ]]; then
    alias ls="ls --color=auto"
elif [[ "$OSTYPE" == "win32" ]]; then
    alias ls="ls"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    alias ls="ls -G"
else
    alias ls="ls"
fi
# grep
alias grep='grep --color=auto'


# Clobber certain common commands if repalcements exist
# Sometimes bat installs weirdly due to a name conflict
[[ `type -t batcat` ]] && alias bat=batcat
# If bat is installed use it instead of cat
[[ `type -t bat` ]] && alias cat="bat -p"


# Funsies
alias coffeebreak='while [ true ]; do head -n 100 /dev/urandom; sleep 1; done | hexdump | grep "ca fe"'
