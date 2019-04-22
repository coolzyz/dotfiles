function cd() {
	builtin cd "$@" && ls
}


cdl() {
	cd "$@" && pwd
	ls -al
}
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

#mkdir, cd into it
mkcd() {
	mkdir -p "$*"
	cd "$*"
}

ld() {
	pushd .
	cd ~
	source .bashrc
	popd
}

#===============  fzf    ====================================
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#========   fasd   ==========================================
#https://github.com/clvv/fasd
if test -n "$(type -t fasd)"; then
	eval "$(fasd --init auto)"
	alias z='fasd_cd -di'
	alias v='f -e vim' # quick opening files with vim
	_fasd_bash_hook_cmd_complete z v
fi

#============== fzf +fasd ==============
unalias z
z() {
	local dir
	dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

unalias v
v() {
	local file
	file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
}


# frequently used command lines
function mm() {
	cat ~/dotfiles/mm.txt
}


transfer() {
	if [ $# -eq 0 ]; then
		echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
		return 1
	fi
	tmpfile=$(mktemp -t transferXXX)
	if tty -s; then
		basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
		curl --progress-bar --upload-file "$1" "http://11.111.111.11:9719/$basefile" >>$tmpfile
	else
		curl --progress-bar --upload-file "-" "http://11.111.111.11:9719/$1" >>$tmpfile
	fi
	cat $tmpfile
	rm -f $tmpfile
	echo ""
}


