# aliases
source ~/.dotfiles/.sh_alias

# functions
source ~/.dotfiles/.sh_func

# environment
source ~/.dotfiles/.sh_env

# activate bash completion
# termux
acfile="/data/data/com.termux/files/usr/share/bash-completion/bash_completion"
[ -f $acfile ] && . $acfile
# debian
acfile="/etc/bash_completion"
[ -f $acfile ] && . $acfile

# color for the prompt
c1='\[\e[37;40m\]' # light gray on black
c2='\[\e[32;40m\]' # green on black
c3='\[\e[31;40m\]' # red on black
c4='\[\e[33;40m\]' # yellow on black
c5='\[\e[36;40m\]' # cyan on black
c6='\[\e[35;40m\]' # magenta on black

# prompt
export PS1="${c2}\u${c1}@${c4}\h${c1}:${c3}\w${c5}\$(parse_git_branch)${c1}\\$ "
