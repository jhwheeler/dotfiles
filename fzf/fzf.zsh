# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/alacritas/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/alacritas/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/alacritas/.fzf/shell/completion.zsh" 2> /dev/null
