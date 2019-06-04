# 交互式模式的初始化脚本
# 防止被加载两次
if [ -z "$_INIT_SH_LOADED" ]; then
	_INIT_SH_LOADED=1
else
	return
fi

# 如果是非交互式则退出，比如 bash test.sh 这种调用 bash 运行脚本时就不是交互式
# 只有直接敲 bash 进入的等待用户输入命令的那种模式才成为交互式，才往下初始化
case "$-" in
*i*) ;;
*) return ;;
esac


# 创建bin目录 并加入PATH
if [ ! -d "$HOME/bin" ];then
	mkdir -p "$HOME/bin"
	export PATH="$HOME/bin:$PATH"
fi


# 整理 PATH，删除重复路径
if [ -n "$PATH" ]; then
	old_PATH=$PATH:
	PATH=
	while [ -n "$old_PATH" ]; do
		x=${old_PATH%%:*}
		case $PATH: in
		*:"$x":*) ;;
		*) PATH=$PATH:$x ;;
		esac
		old_PATH=${old_PATH#*:}
	done
	PATH=${PATH#:}
	unset old_PATH x
fi

export PATH

# 如果是 bash/zsh 的话，source 一下 ~/dotfiles/function.sh
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
	# run script for interactive mode of bash/zsh
	if [[ $- == *i* ]] && [ -z "$_INIT_SH_NOFUN" ]; then
		if [ -f "$HOME/dotfiles/function.sh" ]; then
			. "$HOME/dotfiles/function.sh"
		fi
	fi
fi

# 如果是 bash/zsh 的话，source 一下 ~/dotfiles/alias.sh
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
	# run script for interactive mode of bash/zsh
	if [[ $- == *i* ]] && [ -z "$_INIT_SH_NOFUN" ]; then
		if [ -f "$HOME/dotfiles/alias.sh" ]; then
			. "$HOME/dotfiles/alias.sh"
		fi
	fi
fi

# 覆盖bashrc vimrc inputrc
mv ~/.bashrc ~/.basrc_bk
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp inputrc ~/.inputrc
source ~/.bashrc

