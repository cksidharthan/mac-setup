# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="frisk" # set by `omz`
BAT_THEME="Dracula"
# Golang Env
export PATH="$PATH:$GOPATH/bin"
export GOPATH="$HOME/go"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
export GITHUB_ACCESS_TOKEN="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"
alias genssh="ssh-keygen -t rsa && pbcopy < ~/.ssh/id_rsa.pub"
alias k="kubectl"
alias kn="kubectl -n rc-system"
alias wkn="watch kubectl -n rc-system"
alias kpn"kubectl get pods -n rc-system"
alias kdpn"kubectl describe pod -n rc-system"
alias watch="watch -n .5"
#alias history="history -f"
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gpuf="git push -f"
alias gpu="git pull"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gri="git rebase -i"
alias dev="cd ~/dev/git/reynencourt"
alias mk="minikube"
alias python="python3"
alias pcalc="python /Users/cksidharthan/dev/git/other/scripts/percentage_calculator.py"


# IP
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Reynen court Links
alias cr="open https://certified-registry.rcplatform.io"
alias cr="open https://staging-registry.rcacc.link/"
alias awso="https://reynencourt.awsapps.com/start#/"
alias jira="open https://reynencourt.atlassian.net/jira/software/projects/PRODEV/boards/8"
alias office="open https://reynencourt.ezofficeinventory.com/users/sign_in"
alias paperdocs="open https://paper.dropbox.com"

# for terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/opt/homebrew/opt/node@12/bin:$PATH"
export GIT_TERMINAL_PROMPT=1
export GOSUMDB=off


# To Display the time taken for previous command to run

ifunction preexec() {
    timer=${timer:-$SECONDS}
}

function precmd() {
    if [ $timer ]; then
        timer_show=$(($SECONDS - $timer))
        timer_show=$(printf '%.*f\n' 3 $timer_show)
        export RPROMPT="${timer_show}s"
        unset timer
    fi
}

# go Project commands
alias golint="go vet ./..."
alias gotest="go test --count=1 -coverprofile=coverage.out ./pkg/..."

# others
alias weather="curl \"wttr.in/Amsterdam?format=3\""

# Cloud
alias bastion="ssh -i ~/.ssh/keys/kraken-new.pem ubuntu@18.184.139.13"


# FZF Color Schemes
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
