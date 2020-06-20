# Make things colorful
# ls
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    LS_COLOR=" --color=auto"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    LS_COLOR=" -G"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    LS_COLOR=" --color=auto"
elif [[ "$OSTYPE" == "msys" ]]; then
    LS_COLOR==" --color=auto"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    LS_COLOR=" -G"
else
    LS_COLOR=""
fi
# grep
alias grep='grep --color=auto'

# Make LS output nicer and more informative
alias ls="ls -lhF --group-directories-first${LS_COLOR}"

# Clobber certain common commands if repalcements exist
# Clobber cat with bat, if it exists
# https://github.com/sharkdp/bat
# Sometimes bat installs weirdly due to a name conflict
[[ `type -t batcat` ]] && alias bat=batcat
# If bat is installed use it instead of cat
[[ `type -t bat` ]] && alias cat="bat -p"
[[ `type -t bat` ]] && alias less="bat -p --paging=always"

# Clobber ls with exa, if it exists
# https://the.exa.website/
[[ `type -t exa` ]] && alias ls="exa -lhF --tree -L1 --group-directories-first"


# Funsies
alias coffeebreak='while [ true ]; do head -n 100 /dev/urandom; sleep 1; done | hexdump | grep "ca fe"'
