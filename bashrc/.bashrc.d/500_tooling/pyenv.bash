# pyenv
[ -d $HOME/.pyenv ] && export PYENV_ROOT="$HOME/.pyenv" && \
[ -s "$PYENV_ROOT" ] && export PATH="$PYENV_ROOT/bin:$PATH" && \
[[ `type -t pyenv` ]] && eval "$(pyenv init -)"
