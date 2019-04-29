# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -hlrt --color=auto'
alias la='ls -A'
alias l='ls -lhF'
alias c='clear'
alias h='history'
alias cp='cp -v -i'
alias mv='mv -v -i'
alias mc='make -f ~/bin/Makefile ctags && make -f ~/bin/Makefile systags'
alias grep='grep -i --color=auto'
alias p='ps -u$(whoami)'
alias less='less -r'

alias ra='ranger '

# PS
alias psa="ps aux"
alias psg="ps aux | grep "


#list file/folder size  
alias big="du -h --max-depth=1 ."
alias big2='ncdu'

# git
alias gs='git status'
