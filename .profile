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
