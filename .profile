export PATH="/usr/local/bin:$PATH"

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vimlast='vim -S ~/.vim/lastsesh.vim'
alias ll='ls -al'
go(){ cd $1; pwd; }

#bind '"[A": history-search-backward'
#bind '"[B": history-search-forward'
set shot-all-if-ambiguous on
set completion-ignore-case on

# virtualenv must be installed in system PIP.
mkvenv(){ virtualenv ~/.venvs/$1; }
vactivate(){ deactivate; source ~/.venvs/$1/bin/activate; }
