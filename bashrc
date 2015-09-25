# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions




#aliasssss
alias c='clear'
alias h='history'
alias ll='ls -hl'
alias la='ls -a'
alias l='ls -lh'
alias cp='cp -v -i'
alias mv='mv -v -i'
alias mc='make -f ~/bin/Makefile ctags'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
#ls output color
export LS_COLORS='di=00;36'




#cmd line prompt
export PS1='\e[32m[\u@\w]$ '


export GTK_IM_MODULE=fcitx  
export QT_IM_MODULE=fcitx  
export XMODIFIERS="@im=fcitx"

#path
export PATH="~/bin/:$PATH"

#hexo blog
# export NVM_DIR="/home/bdictator/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# nvm use 0.12


#default editor
export EDITOR=/usr/bin/vim

#config for golang
export GOROOT="$HOME/Softs/Go"
export PATH="$PATH:$GOROOT/bin/"
export GOPATH="$HOME/Dev/Go"

