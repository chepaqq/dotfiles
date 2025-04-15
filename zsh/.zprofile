# PATH
PATH=$PATH:$HOME/.local/bin/:$HOME/.local/share/go/bin
export PATH

export EDITOR="nvim"
export LESSHISTFILE="-"
export LESSHISTSIZE=0
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Program settings
export BAT_THEME="gruvbox-dark"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GOBIN="$GOPATH/bin"
export GREP_COLORS='mt=1;92;40'

# FZF options
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --exclude proc"
export FZF_DEFAULT_OPTS="--cycle --layout=reverse --height 50% --border --color fg:#ebdbb2,hl:#d79921,fg+:#83a598,bg+:#3c3836,hl+:#fabd2f,info:#d3869b,prompt:#add8e6,spinner:#8ec07c,pointer:#83a598,marker:#98971a,header:#a89984"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--bind 'ctrl-r:reload(eval "$FZF_CTRL_T_COMMAND")' --header 'Press CTRL-R to reload' --select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git"
export FZF_ALT_C_OPTS="--bind 'ctrl-r:reload(eval "$FZF_ALT_C_COMMAND")' --header 'Press CTRL-R to reload' --exact --select-1 --exit-0 --preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind 'F1:toggle-preview'"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Triplink
export GOOGLE_APPLICATION_CREDENTIALS="/Users/chepaqq/Development/Go/Projects/Triplink/credentials/triplink-staging-master-service-credentials.json"
export ENV_CREDENTIALS_PATH="/Users/chepaqq/Development/Go/Projects/Triplink/credentials/development-staging.env"


# Added by Toolbox App
export PATH="$PATH:/Users/chepaqq/Library/Application Support/JetBrains/Toolbox/scripts"

