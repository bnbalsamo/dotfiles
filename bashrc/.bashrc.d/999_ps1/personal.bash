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
    printf -- "${format}" "${DOCKER_MACHINE_NAME}${status}"
fi
}

PS1='$(__docker_machine_ps1 "[%s]")[\u@\h \W]`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)/`$ '
