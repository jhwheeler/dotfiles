# Use tmux if available
if [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Path to your oh-my-zsh installation.
export ZSH=/Users/alacritas/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(
  git
  node
  cp
  tar
  python
  npm
  man
  fast-syntax-highlighting
  z
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH=$PATH:~/.vimpkg/bin
export PATH=$PATH:/Applications/Genymotion.app/Contents/MacOS/tools/
export ANDROID_SDK=/Users/alacritas/Library/Android/sdk
export PATH=$PATH:/Users/alacritas/platform-tools
export PATH=$PATH:/Users/alacritas/Applications/terraform
export PATH=$PATH:/opt/anaconda3/bin

# Deno
export DENO_INSTALL="/Users/alacritas/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# This removes repeated commands in terminal history
export HISTCONTROL=ignoreboth:erasedups

# Ensure CLI programs run in English
export LANG=en_US
export LC_ALL=en_US.UTF-8

# Used for code review (see ~/.gitconfig for how this is used)
export REVIEW_BASE=master

# bat syntax highlighting
export BAT_THEME="Dracula"

# Playpilot Fletch env vars
export PLAYPILOT_PORT=8000
export FLETCH_PORT=8001
# export PLAYPILOT_HOST=$(ifconfig docker0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
# TEMPORARY:
export PLAYPILOT_HOST=127.0.0.1

# Set tab title to current working directory
# Use % instead of %1 to get full path
# Instead of just the last segment
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%1~\a"}
    ;;
esac

## Aliases

# Copying/pasting to/from clipboard
alias pbcopy='xclip -sel clip'
alias pbpaste='xclip -sel clip -o'

# Common typos
alias exti='exit'
alias eit='exit'
alias eitx='exit'
alias eixt='exit'
alias eitx='exit'
alias xit='exit'
alias wxit='exit'
alias wit='exit'
alias :x='exit'
alias :q='exit'

# Miscellaneous Shortcuts
alias vim='nvim'
alias zshrc='nvim ~/.zshrc'
alias vimrc='nvim ~/.vimrc'
alias sourcez='source ~/.zshrc'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias rn='create-react-native-app'
alias terraform='/Applications/terraform'
alias ping8='ping 8.8.8.8'
# Why can't I use directory names in variables?
# For some reason, `$DOTFILES=''~/Projects/dotfiles'` returns the error 'No such file or directory', so I have to repeat the path every time below.
alias dotfiles='cp ~/.zshrc ~/Projects/dotfiles/.zshrc; cp ~/.vimrc ~/Projects/dotfiles/.vimrc; cp ~/.config/alacritty/alacritty.yml ~/Projects/dotfiles/alacritty.yml; cp ~/.tmux.conf ~/Projects/dotfiles/.tmux.conf; cd ~/Projects/dotfiles; git status'
alias pyds='cd ~/Projects/Tutorials/Python_DataScience/Resources'
alias HAI='cd ~/Projects/Harmony/HAI'

### Playpilot

# General

alias n='npm run'
alias pp='cd ~/projects/playpilot'
alias ppweb='cd ~/projects/playpilot/web'
alias ppapp='cd ~/projects/playpilot/app'
alias houston='cd ~/projects/playpilot/houston'
alias gravity='cd ~/projects/playpilot/gravity'

# Playpilot Web App Commands
alias yd='yarn dev'
alias nd='npm run dev'
alias ndprod='npm run dev --prod'

# Playpilot Mobile App Commands
alias ys='yarn start'
alias ysi='yarn start --ios'
alias ysa='yarn start --android'
alias ysp='yarn start --useProdAPI'
alias yspi='yarn start --useProdAPI --ios'
alias yspa='yarn start --useProdAPI --android'
alias yt='yarn test'
alias ytw='yarn test --watch'

# Watson Time Tracker
alias track='watson start playpilot'

# How Do I?
alias h='function hdi(){ howdoi $* -c -n 5; }; hdi'

# Less profane version of "The Fuck"
eval $(thefuck --alias)
alias opa='fuck'

function expand-alias() {
  zle _expand_alias
  zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source ~/.iterm2_shell_integration.zsh


# tabtab source for serverless package
# tabtab source for serverless package
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/serverless.zsh
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/serverless.zsh
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/sls.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/alacritas/Projects/Playpilot/api-playground/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/alacritas/Projects/Playpilot/microservices/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/alacritas/Projects/Playpilot/microservices/node_modules/tabtab/.completions/slss.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/opt/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="/opt/anaconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

PROMPT='%D{%L:%M:%S}] '$PROMPT

# FZF Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden  --no-ignore-vcs -g "!{.git/*,__sapper__/*,functions/__sapper__/*,node_modules/*,*/node_modules/*,.vscode/*,.firebase/*,*/bundle/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--height 96%
--reverse
--preview "cat {}"
--bind ctrl-a:select-all
--color=fg:#b647cf,bg:#000000,hl:#2ef29d
--color=fg+:#bec3cc,bg+:#211e1e,hl+:#36ebc4
'

## Vim mode in ZSH
# Activate vim mode
bindkey -v

# Remove mode-switching delay
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
      echo -ne '\e[1 q'

    elif [[ ${KEYMAP} == main ]] ||
      [[ ${KEYMAP} == viins ]] ||
      [[ ${KEYMAP} = '' ]] ||
      [[ $1 = 'beam' ]]; then
          echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

_fix_cursor() {
  echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# For grv git client
unalias grv
