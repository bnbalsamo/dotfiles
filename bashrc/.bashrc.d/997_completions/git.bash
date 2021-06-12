[[ ! `type -t git` ]] && return  # Stop if git isn't installed
[[ -f /usr/share/bash-completion/completions/git ]] && . /usr/share/bash-completion/completions/git && return
[[ -f /etc/bash_completion.d/git ]] && . /etc/bash_completion.d/git
