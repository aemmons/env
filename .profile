export PATH="/usr/local/bin:$PATH"

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias mysql='/usr/local/mysql/bin/mysql'
alias ll='ls -al'
go(){ cd $1; pwd; }

#bind '"[A": history-search-backward'
#bind '"[B": history-search-forward'
set shot-all-if-ambiguous on
set completion-ignore-case on

# virtualenv must be installed in system PIP.
mkvenv(){ virtualenv ~/.venvs/$1; }
vactivate(){ deactivate; source ~/.venvs/$1/bin/activate; }
vimlast(){ vim -S ~/.vim/sessions/lastsesh$1\.vim; }

# Docker cleanup helpers.
dcc(){ docker ps -a | grep Exit | awk '{print $1}' | xargs docker rm; }
dci(){ docker images | grep none | awk '{print $3}' | xargs docker rmi; }
conndocker(){
    MNAME="default"
    if [ ! -z "$1" ]; then
        MNAME=$1
    fi
    eval "$(docker-machine env $MNAME)"
}

# The various escape codes that we can use to color our prompt.
RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[1;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

function we(){
    if [[ -z $VIRTUAL_ENV ]]; then
        echo "None"
    else
        echo `basename $VIRTUAL_ENV`
    fi
}

