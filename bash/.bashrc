# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
function _branch {
    hg status > /dev/null 2>&1
    if [ $? -eq 0 ]; then
       printf " \e[90mhg:\e[m\e[92m$(hg branch)\e[m"
    fi
    git branch > /dev/null 2>&1
    if [ $? -eq 0 ]; then
	printf " \e[90mgit:\e[m\e[92m$(git branch | grep \* | cut -d ' ' -f2)\e[m"
    fi
}

export PS1='[\u@\h \[\e[94m\]\w\[\e[m\]$(_branch)]\n$ '
export PATH=$PATH:/home/kjohnston/.local/bin:/home/kjohnston/bin
export HISTCONTROL=ignoredups
export EDITOR=/usr/bin/vim

alias ll='ls -al --color=always'
alias ls='ls --color=always'
alias grep='grep --color=auto'
alias e='emacsclient'
