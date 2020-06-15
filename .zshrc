# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/Users/alacritas/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	node
	cp
	tar
	python
	npm
	man
	zsh-autosuggestions
	zsh-syntax-hilighting
	z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:~/.vimpkg/bin

export PATH=$PATH:/Applications/Genymotion.app/Contents/MacOS/tools/
export ANDROID_SDK=/Users/alacritas/Library/Android/sdk
export PATH=$PATH:/Users/alacritas/platform-tools
export PATH=$PATH:/Users/alacritas/Applications/terraform
export PATH=$PATH:/opt/anaconda3/bin

# Deno
export DENO_INSTALL="/Users/alacritas/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# added by travis gem
[ -f /home/alacritas/.travis/travis.sh ] && source /home/alacritas/.travis/travis.sh

# This removes repeated commands in terminal history
export HISTCONTROL=ignoreboth:erasedups

# Ensure CLI programs run in English
export LANG=en_US
export LC_ALL=en_US.UTF-8

# Fletch env vars
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
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias rn='create-react-native-app'
alias terraform='/Applications/terraform'
alias ping8='ping 8.8.8.8'
alias pyds='cd ~/Projects/Tutorials/Python_DataScience/Resources'

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
export FZF_DEFAULT_COMMAND='rg --files --hidden  --no-ignore-vcs -g "!{.git/*,__sapper__/*,functions/__sapper__/*,node_modules/*,*/node_modules/*,.vscode/*,.firebase/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'

