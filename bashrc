# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# case insensetive
bind "set completion-ignore-case on"

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

# always use color, even when piping (to awk,grep,etc)
#if gls --color >/dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi
export CLICOLOR_FORCE=1
#ls output color
export LS_COLORS='di=00;36'
