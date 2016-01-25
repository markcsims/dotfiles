export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

DEFAULT_USER="mark"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(git ruby brew node)

bindkey -v

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

source $ZSH/oh-my-zsh.sh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias vi="nvim"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fpath=(/usr/local/share/zsh-completions $fpath)
