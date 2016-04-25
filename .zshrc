export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mortalscumbag"

DEFAULT_USER="mark"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(git ruby brew node docker)

bindkey -v

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

source $ZSH/oh-my-zsh.sh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

alias vi="nvim"
alias vim="nvim"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# PROMPT='%{%f%b%k%}$(build_prompt)
# $(prompt_segment white white "")$(prompt_end) '

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
   PATH="$HOME/bin:$PATH"
fi
