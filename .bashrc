# Use tmux if available
if [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi


# Use Vim
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


## Vim mode in Bash

# Activate vim mode
set -o vi

# Remove mode-switching delay
KEYTIMEOUT=1


## Custom Prompt

# colours
txtcyn='\[\e[0;96m\]' # Cyan
txtpur='\[\e[0;35m\]' # Purple
txtwht='\[\e[0;37m\]' # White
txtrst='\[\e[0m\]' # Text Reset

# assign colours to prompt segments
pathC="${txtcyn}"
gitC="${txtpur}"
pointerC="${txtwht}"
normalC="${txtrst}"

# get name of branch and wrap in parens
gitBranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# build the prompt
export PS1="${pathC}\w ${gitC}\$(gitBranch) ${pointerC}\$${normalC} "


# FZF Config
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden  --no-ignore-vcs -g "!{.git/*,__sapper__/*,functions/__sapper__/*,node_modules/*,*/node_modules/*,.vscode/*,.firebase/*,*/bundle/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--height 96%
--reverse
--preview "cat {}"
--bind ctrl-a:select-all
'


## Custom PATH

export PATH=$PATH:~/.vimpkg/bin
export PATH=$PATH:/Applications/Genymotion.app/Contents/MacOS/tools/
export ANDROID_SDK=/Users/alacritas/Library/Android/sdk
export PATH=$PATH:/Users/alacritas/platform-tools
export PATH=$PATH:/Users/alacritas/Applications/terraform
export PATH=$PATH:/opt/anaconda3/bin

# Utils
export PATH=$PATH:~/utils

# Lynx web browser
export LYNX_LSS=$HOME/.config/lynx/lynx.lss
export LYNX_CFG=$HOME/.config/lynx/lynx.cfg

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

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


## Aliases

# Copying/pasting to/from clipboard
alias pbcopy='xclip -sel clip'
alias pbpaste='xclip -sel clip -o'

# Always copy recursively & explain what was done
alias cp='cp -rv'
# List contents with colors for file types, (A)lmost all hidden files (without . and ..), in (C)olumns, with class indicators (F)
alias ls='ls -ACFG'
# List contents with colors for file types, (a)ll hidden entries (including . and ..), use (l)ong listing format, with class indicators (F)
alias ll='ls -alFG'
# Explain (v) what was done when moving a file
alias mv='mv -v'
# Create any non-existent (p)arent directories and explain (v) what was done
alias mkdir='mkdir -pv'
# Always try to (c)ontinue getting a partially-downloaded file
alias wget='wget -c'

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
alias vimrc='nvim ~/.vimrc'
alias bashrc='nvim ~/.bashrc'
alias bashpr='nvim ~/.bash_profile'
alias zshrc='nvim ~/.zshrc'
alias srcz='source ~/.zshrc'
alias srcb='source ~/.bashrc'
alias c="clear"
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias rn='create-react-native-app'
alias terraform='/Applications/terraform'
alias ping8='ping 8.8.8.8'
# Why can't I use directory names in variables?
# For some reason, `$DOTFILES=''~/Projects/dotfiles'` returns the error 'No such file or directory', so I have to repeat the path every time below.
alias dotfiles='cp ~/.zshrc ~/Projects/dotfiles/.zshrc; cp ~/.vimrc ~/Projects/dotfiles/.vimrc; cp ~/.config/alacritty/alacritty.yml ~/Projects/dotfiles/alacritty.yml; cp ~/.tmux.conf ~/Projects/dotfiles/.tmux.conf; cd ~/Projects/dotfiles; cp ~/.vifm/vifmrc ~/Projects/dotfiles/vifmrc; git status'
alias pyds='cd ~/Projects/Tutorials/Python_DataScience/Resources'
alias HAI='cd ~/Projects/Harmony/HAI'
alias config='nvim ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.config/alacritty/alacritty.yml ~/.config/vifm/vifmrc'
alias inv='t report -G --from "2020-07-16" --to "2020-07-31" | ./invox -i MC81 -d "1 August 2020"'
alias cdl="cd $1 && ls"

# Suppress message telling you to use zsh instead of bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# Watson Time Tracker
alias t='watson'
alias tp='watson start playpilot'

# Quick search w/ Lynx
alias s='lynx_search'

# How Do I?
alias h='function hdi(){ howdoi $* -c -n 5; }; hdi'

# Less profane version of "The Fuck"
eval $(thefuck --alias)
alias opa='fuck'

# bat is cat with syntax highlighting
alias cat='bat'

# vifm
alias v='vifm'

# buku
alias b='buku --suggest'


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


## Custom functions

function take() {
  mkdir $1 && cd $1
}
