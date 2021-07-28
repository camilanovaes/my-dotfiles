# ZSH CONFIG FILE
#                       _ _            _       _
#    ___ __ _ _ __ ___ (_) | __ _   __| | ___ | |
#   / __/ _` | '_ ` _ \| | |/ _` | / _` |/ _ \| __|
#  | (_| (_| | | | | | | | | (_| || (_| | (_) | |_
#   \___\__,_|_| |_| |_|_|_|\__,_(_)__,_|\___/ \__|
#
# Author: Camila Novaes <novaes.csw@gmail.com>
#
# Path to oh-my-zsh installation.
export ZSH="/home/camila/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="bira"

# Plugins
plugins=(git
	 zsh-syntax-highlighting
	 zsh-autosuggestions
	 docker
	 fzf
	 z)

source $ZSH/oh-my-zsh.sh
export LC_CTYPE=en_US.UTF-8

# TMUX
export DISABLE_AUTO_TITLE='true'

# VirtualEnvWrapper configuration
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.8
source /home/camila/.local/bin/virtualenvwrapper.sh

# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias
## Editor
alias n="nvim"

## Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -v"
alias gl="git l"
alias gp="git pull"
alias gf="git fetch"

## Clip
alias ccc="xclip -sel clip"

## Dotfile repository
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

## Tmux
alias t="tmux"
alias tls="tmux ls"
alias ta="tmux attach"

## Folders
alias w="cd ~/Development/sync/ptp_analyzer"