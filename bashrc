# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# case insensetive
bind "set completion-ignore-case on"


#aliasssss
alias c='clear'
alias h='history'
alias ls='ls --color=auto'
alias ll='ls -hlrt --color=auto'
alias la='ls -aF'
alias l='ls -lhF'
alias cp='cp -v -i'
alias mv='mv -v -i'
alias mc='make -f ~/bin/Makefile ctags && make -f ~/bin/Makefile systags'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias p='ps -u$(whoami)'

#alias for git
alias gs='git status'
alias gl='git log --pretty'
alias ga='git add'
alias gci='git commit'
alias gco='git checkout'

#ls output color
export LS_COLORS='di=00;36'


#cmd line prompt
export PS1='\e[32m[\u@\w]$ '


#path
export PATH="~/bin/:$PATH"


#default editor
export EDITOR=/usr/bin/vim

function cd()
{
    command cd ${1} && ls
}
