# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="frisk" # set by `omz`
BAT_THEME="Dracula"

# Golang Env
export PATH="$PATH:$GOPATH/bin"
export GOPATH="$HOME/go"

plugins=(
  git
  kubectl
  history
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
  alias-finder
)
source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

alias k="kubectl"
alias watch="watch -n .5"
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gpuf="git push -f"
alias gpu="git pull"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gri="git rebase -i"
alias mk="minikube"
alias python="python3"
alias cd="z"

# tmux alpases
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tl="tmux ls"
alias td="tmux detach"
alias tk="tmux kill-session -t"
alias tka="tmux kill-session -a"
alias tks="tmux kill-session -a"

# IP
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# for terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/opt/homebrew/opt/node@12/bin:$PATH"
export GIT_TERMINAL_PROMPT=1
export GOSUMDB=off
export GOPRIVATE="dev.azure.com/INGCDaaS/*,dev.azure.com/IngEurCDaaS01/*,github.com/weportfolio/*"
export K9S_CONFIG_DIR="~/.config/k9s"

# go Project commands
alias golint="go vet ./..."
alias gotest="go test --count=1 -coverprofile=coverage.out ./pkg/..."

export HELM_EXPERIMENTAL_OCI=1

alias keyRepeatOn="defaults write -g ApplePressAndHoldEnabled -bool false"
alias keyRepeatOff="defaults write -g ApplePressAndHoldEnabled -bool true"
alias startupSoundOff="sudo nvram StartupMute=%01"
alias startupSoundOn="sudo nvram StartupMute=%00"
alias :wq="exit"
alias :q="exit"
alias :qa="exit"

# Kubernetes Autocompletions
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

# Go
alias makedeps="go mod download && go mod tidy && go mod verify && go mod vendor"
alias findbyport="sudo lsof -i -P | grep LISTEN | grep :$PORT"

# Startship Config
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Alias to checkout master branch and pull latest changes
alias gup='git rev-parse --is-inside-work-tree > /dev/null 2>&1 && git checkout master && git pull origin master || echo "Error: Not in a git repository or failed to checkout/pull"'

# FZF
alias nopen="nvim $(fzf -m --preview="bat --color=always {}")"
alias view='fzf -m --preview="bat --color=always {}"'
