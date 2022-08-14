# Colors
RESET_COLORS=`echo -ne "\e[0;0;0m"`
BLACK_FG=`echo -ne "\e[0;0;30m"`
RED_FG=`echo -ne "\e[0;0;31m"`
GREEN_FG=`echo -ne "\e[0;1;32m"`
YELLOW_FG=`echo -ne "\e[0;1;33m"`
BLUE_FG=`echo -ne "\e[0;1;34m"`
PURPLE_FG=`echo -ne "\e[0;0;35m"`
CYAN_FG=`echo -ne "\e[0;0;36m"`
WHITE_FG=`echo -ne "\e[0;0;37m"`

# PS1 configuration
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
    printf -- "${format}" "${DOCKER_MACHINE_NAME}${status} "
fi
}

__git_branch_ps1 () {
    local branch_name
    local branch_color
    branch_name=`git branch 2> /dev/null | grep -e ^* | cut -c 3-`
    if [ -z $branch_name ]; then
        return
    fi
    branch_color=`if [ -z "$(git status --short)" ]; then echo -ne "${GREEN_FG}"; else echo -ne "${YELLOW_FG}"; fi`
    if [ ! -z ${branch_name} ]; then
        echo -ne "${BLUE_FG}branch${RESET_COLORS}: ${branch_color}${branch_name}${RESET_COLORS}"
    fi
}

__direnv_ps1 () {
    if [ ! -z ${DIRENV_DIR} ]; then
        local direnv_dir_base
        local direnv_color
        direnv_dir_base=`basename $(echo -n "${DIRENV_DIR}" | cut -c 2-)`
        direnv_color=`if [ ! -z "$(direnv status | grep "Found RC allowed true")" ]; then echo -ne "${GREEN_FG}"; else echo -ne "${YELLOW_FG}"; fi`
        echo -ne "${BLUE_FG}direnv${RESET_COLORS}: ${direnv_color}${direnv_dir_base}${RESET_COLORS}"
    fi
}

__virtualenv_ps1 () {
    local venv_name
    if [ ! -z ${VIRTUAL_ENV} ]; then
        # Env managed by poetry
        if [ ! -z ${POETRY_ACTIVE} ]; then
            venv_name="(poetry)"
        # Env managed by pyenv-virtualenv
        elif [ ! -z ${PYENV_VIRTUAL_ENV} ]; then
            venv_name="(pyenv)"
        # Something else
        else
            venv_name=`basename ${VIRTUAL_ENV}`
        fi
        echo -ne "${BLUE_FG}venv${RESET_COLORS}: ${GREEN_FG}${venv_name}${RESET_COLORS}"
    fi
}

PS1='┌[\
`join_by " | " \
"${GREEN_FG}\u${BLUE_FG}@${GREEN_FG}\h${RESET_COLORS}" \
"${BLUE_FG}cwd: ${GREEN_FG}\W${RESET_COLORS}" \
"$(__docker_machine_ps1)" \
"$(__git_branch_ps1)" \
"$(__direnv_ps1)" \
"$(__virtualenv_ps1)" \
`\
]\
\n└$ '

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
