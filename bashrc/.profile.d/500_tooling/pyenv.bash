[ -d $HOME/.pyenv ] && export PYENV_ROOT="$HOME/.pyenv" && \
[ -d "$PYENV_ROOT" ] && export PATH="$PYENV_ROOT/bin:$PATH" && \
[[ `type -t pyenv` ]] && eval "$(pyenv init --path)"
