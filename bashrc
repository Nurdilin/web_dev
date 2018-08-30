# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#store passwords in safe location
source ~/.inedit_secrets

BACK="\033[42m"
WHITE="\033[1;37m"
GREY="\033[1;30m"               
RED="\033[1;31m"    
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
LIGHTBLUE="\033[1;36m"
ORANGE="\033[1;39"
BOLD="\033[1m"
RESET="\033[0m"

# don't put duplicate lines in the history.
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# stop ls commands being added to bash history
export HISTIGNORE="&:ls:[bf]g:exit"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

#git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
#Add to the ~/.bashrc:
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

alias ll='ls -l'
alias grep='grep --color=auto'
alias cd='cd -P'
alias dc='cd'

PS1='\u@\h:\w$ \[\033]0;\h \w\007\]'
PS1="$BACK $GREEN $RESET $WHITE inEdit $RESET[\u@\h \W]$"
PS1='\[\033[42m\]\[\033[1;33m\]inEdit\[\033[49m\]\[\033[0;39m\] [\u@\h \W]$ \[\033[0;39m\]'

export PS1

alias db='mysql --host=localhost --database=$DB_db --user=$DB_USER --password=$DB_PASS'
