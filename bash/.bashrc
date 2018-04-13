export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PATH=$PATH:/home/krj/.local/bin
export HISTCONTROL=ignoredups
export EDITOR=/usr/bin/vim

eval `dircolors ~/.dircolors.ansi-universal`

alias ll='ls -al --color=always'
alias ls='ls --color=always'
alias grep='grep --color=auto'
