# remove bell
unsetopt BEEP

# case insensitive globbing
#setopt NO_CASE_GLOB
# bash-style globbing
setopt GLOB_COMPLETE

# auto cd to directories
#setopt AUTO_CD

# enable history file
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# history sizes
SAVEHIST=5000
HISTSIZE=2000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# suggest corrections on typos
setopt CORRECT
setopt CORRECT_ALL

# enable completion
autoload -Uz compinit && compinit

# aliases
source ~/.dotfiles/.sh_alias

# functions
source ~/.dotfiles/.sh_func

# activate fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# vi-style editing of the command line
bindkey -v

# emacs-style editing of the command line
#bindkey -e

# Updates editor information when the keymap changes.
function zle-line-init zle-keymap-select {
  zle reset-prompt
  zle -R
}
zle -N zle-line-init
zle -N zle-keymap-select

# fix initial prompt display
KEYMAP='viins'

# prompt
function vi_mode_prompt_info {
  echo "${${KEYMAP/vicmd/(c) }/(main|viins)/(i) }"
}
setopt PROMPT_SUBST
export PS1='%F{magenta}$(vi_mode_prompt_info)%F{green}%n%F{white}@%F{yellow}%M%F{white}:%F{red}%~%F{cyan}$(parse_git_branch)%F{white}\$ '
