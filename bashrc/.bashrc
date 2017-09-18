#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prepend ~/.local/bin to the path, if its not already there somewhere
if [[ -d ${HOME}/.local/bin && ${PATH} != *${HOME}/.local/bin* ]] ; then
        export PATH=${HOME}/.local/bin:"${PATH}:"
fi

__docker_machine_ps1 () {
local format=${1:-[%s]}
if test ${DOCKER_MACHINE_NAME}; then
    local status
    if test ${DOCKER_MACHINE_PS1_SHOWSTATUS:-false} = true; then
        status=$(docker-machine status ${DOCKER_MACHINE_NAME})
        case ${status} in
            Running)
                status=' R'
                ;;
            Stopping)
                status=' R->S'
                ;;
            Starting)
                status=' S->R'
                ;;
            Error|Timeout)
                status=' E'
                ;;
            *)
                # Just consider everything else as 'stopped'
                status=' S'
                ;;
        esac
    fi
    printf -- "${format}" "${DOCKER_MACHINE_NAME}${status}"
fi
}

PS1='$(__docker_machine_ps1 "[%s]")[\u@\h \W]`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)/`$ '

#Declarations
export EDITOR=$( ( [[ `type -t vim` ]] && which vim ) || \
                 ( [[ `type -t vi` ]] && which vi ) || \
                 ( [[ `type -t nano` ]] && which nano) )
export IMAGEVIEWER=$([[ `type -t viewnior` ]] && which viewnior)
export AUDIOPLAYER=$( ( [[ `type -t vlc` ]] && which vlc ) || \
                      (  [[ `type -t mpg123` ]] && which mpg123 ) ) 
export BROWSER=$( ( [[ `type -t firefox` ]] && which firefox ) || \
                  ( [[ `type -t google-chrome-stable` ]] && which google-chrome-stable) ) 

#Aliases
# Make things colorful
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
alias grep='grep --color=auto'
alias coffeebreak='while [ true ]; do head -n 100 /dev/urandom; sleep 1; done | hexdump | grep "ca fe"'

# Functions

extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# http://tldp.org/LDP/abs/html/sample-bashrc.html

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

function repeat()       # Repeat n times command.
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

function colors {
FGNAMES=(' black ' '  red  ' ' green ' ' yellow' '  blue ' 'magenta' '  cyan ' ' white ')
BGNAMES=('DFT' 'BLK' 'RED' 'GRN' 'YEL' 'BLU' 'MAG' 'CYN' 'WHT')

echo "     ┌──────────────────────────────────────────────────────────────────────────┐"
for b in {0..8}; do
  ((b>0)) && bg=$((b+39))

  echo -en "\033[0m ${BGNAMES[b]} │ "
  
  for f in {0..7}; do
    echo -en "\033[${bg}m\033[$((f+30))m ${FGNAMES[f]} "
  done
  
  echo -en "\033[0m │"
  echo -en "\033[0m\n\033[0m     │ "
  
  for f in {0..7}; do
    echo -en "\033[${bg}m\033[1;$((f+30))m ${FGNAMES[f]} "
  done

  echo -en "\033[0m │"
  echo -e "\033[0m"

  ((b<8)) &&
  echo "     ├──────────────────────────────────────────────────────────────────────────┤"
done
echo "     └──────────────────────────────────────────────────────────────────────────┘"
}

# Include a .bashrc.priv if one exists
[[ -f ~/.bashrc.priv ]] && . ~/.bashrc.priv
