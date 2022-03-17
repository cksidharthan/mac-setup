# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="frisk" # set by `omz`


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
alias watch="watch -n .5"
#alias history="history -f"

# Reynen court Links
alias cr="open https://certified-registry.rcplatform.io"
alias jira="open https://reynencourt.atlassian.net/jira"
alias office="open https://reynencourt.ezofficeinventory.com/users/sign_in"
alias paperdocs="open https://paper.dropbox.com"

# for terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/opt/homebrew/opt/node@12/bin:$PATH"