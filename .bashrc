# aliases
alias ls='ls -h --color'
alias la='ls -a'
alias ll='la -l'

# color for the prompt
c1='\[\e[37;40m\]' # white on black
c2='\[\e[32;40m\]' # green on black
c3='\[\e[31;40m\]' # red on black
c4='\[\e[33;40m\]' # yellow on black
c5='\[\e[36;40m\]' # turquoise on black

# function to show git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# prompt
export PS1="${c2}\u${c1}@${c4}\h${c1}:${c3}\w${c5}\$(parse_git_branch)${c1}\$ "
