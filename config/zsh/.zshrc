# ZSH CONFIG FILE
# Author: Camila Novaes <novaes.csw@gmail.com>

export DOTFILES=$HOME/dotfiles/

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="bira"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh
export LC_CTYPE=en_US.UTF-8

# TMUX
export DISABLE_AUTO_TITLE='true'

# VirtualEnvWrapper configuration
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/bin/virtualenvwrapper.sh
source $HOME/.local/bin/virtualenvwrapper_lazy.sh
source $HOME/.cargo/env


# go stuff
export GOENV_ROOT=$HOME/.goenv

# Add local bin to path
path+=("$HOME/.local/bin")
path+=('/usr/local/go/bin')
path+=("$HOME/go/bin")
path+=("$HOME/.npm-global/bin")
path+=("$HOME/.cargo")
path+=("$HOME/.goenv/bin")
path+=("$HOME/.krew/bin")  # k8s plugins
export PATH

# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias
## Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -v"
alias gl="git l"
alias gp="git pull"
alias gf="git fetch -a"
alias mibdump.py="mibdump"
alias docker-gui="docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix"
alias k="kubectl"

# Keybinds
bindkey -s "^f" "tmux-session\n"
bindkey -s "^g" "tmux-switcher\n"
bindkey -s "^b" "git-branch-switcher\n"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# load goenv
eval "$(goenv init -)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
