# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PS1='\n[\u@\h \[\e[34m\]\w\[\e[m\]]\n$ '
export PATH=$PATH:/home/kjohnston/.local/bin:/home/kjohnston/bin
export HISTCONTROL=ignoredups
export EDITOR=/usr/bin/vim

alias ll='ls -al --color=always'
alias ls='ls --color=always'
alias grep='grep --color=auto'
alias e='emacsclient'
