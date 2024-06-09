# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jackson/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/jackson/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jackson/.fzf/shell/completion.bash" 2> /dev/null
