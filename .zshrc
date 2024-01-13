export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mortalit"

DEFAULT_USER="mark"
EMAIL="mark.sims@bluepie.co.uk"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(git ruby brew node docker emoji golang npm nvm macos aws docker-compose zsh-autosuggestions zsh-syntax-highlighting web-search)

bindkey -v

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin":$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/dev/mm/mmgaws:$PATH

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

alias vi="nvim"
alias vim="nvim"
# alias vi="vim"

fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
export EDITOR=vi


# PROMPT='%{%f%b%k%}$(build_prompt)
# $(prompt_segment white white "")$(prompt_end) '

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
   PATH="$HOME/bin:$PATH"
fi

# export TERM="xterm-256color"
alias trim="ex +'bufdo!%s/\s\+$//e' -scxa"
alias retab="ex +'set ts=2' +'bufdo retab' -scxa"

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

export GPG_TTY=$(tty)
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias python=/usr/local/bin/python3
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 
export PATH="/opt/homebrew/sbin:$PATH"
