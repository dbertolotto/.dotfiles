# Setup fzf
# ---------
if [[ ! "$PATH" == *~/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}~/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source ~/.fzf/shell/completion.bash 2> /dev/null

# Key bindings
# ------------
acfile="~/.fzf/shell/key-bindings.bas"
[[ -F $acfile ]] source $acfile
