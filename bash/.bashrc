#export PS1="\u@\[\e[35m\]\h\[\e[m\] \[\e[36m\]\W\[\e[m\]\[\e[37m\] \[\e[31m\]>\[\e[m\]\[\e[33m\]>\[\e[m\]\[\e[34;40m\]>\[\e[m\] "

# color names for readibility
export PS1='\[\e[1;34m\]\u@\h \[\e[1;35m\]\W \[\e[1;37m\]\$\[\e[0m\] '
export PATH=$PATH:/home/krj/.local/bin
export HISTCONTROL=ignoredups
export EDITOR=/usr/bin/vim

alias ll='ls -al --color=always'
alias ls='ls --color=always'
alias grep='grep --color=auto'
