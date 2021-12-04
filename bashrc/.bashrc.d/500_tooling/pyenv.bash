# pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
[ -d $HOME/.pyenv ] && export PYENV_ROOT="$HOME/.pyenv" && \
[ -s "$PYENV_ROOT" ] && export PATH="$PYENV_ROOT/bin:$PATH" && \
[[ `type -t pyenv` ]] && eval "$(pyenv init -)"
