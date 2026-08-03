export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mortalit"

DEFAULT_USER="mark"
EMAIL="mark.sims@bluepie.co.uk"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(git ruby brew node docker emoji golang npm nvm macos aws docker-compose web-search zsh-autosuggestions zsh-syntax-highlighting)

bindkey -v

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/.local/bin:$HOME/dev/mm/mmgaws:$HOME/.goenv/shims:$HOME/.rvm/bin:$HOME/dev/go/bin:$PATH"

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
export EDITOR=nvim
export VISUAL=nvim


# PROMPT='%{%f%b%k%}$(build_prompt)
# $(prompt_segment white white "")$(prompt_end) '

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
   PATH="$HOME/bin:$PATH"
fi

export TERM="xterm-256color"
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt share_history
umask 027
alias gs='git status'
alias gco='git checkout'
alias gc='git commit'
alias gl='git pull'
alias gp='git push'
alias trim="ex +'bufdo!%s/\s\+$//e' -scxa"
alias retab="ex +'set ts=2' +'bufdo retab' -scxa"

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

export GPG_TTY=$(tty)
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias python=/usr/local/bin/python3
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use
# export NODE_EXTRA_CA_CERTS=~/dev/trendy/netskope-CA.pem
