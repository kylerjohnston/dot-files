# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PATH=$PATH:/home/krj/.local/bin
export HISTCONTROL=ignoredups
export EDITOR=/usr/bin/vim

alias ll='ls -al --color=always'
alias ls='ls --color=always'
alias grep='grep --color=auto'
