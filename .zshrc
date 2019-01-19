export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mortalit"

DEFAULT_USER="mark"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(git ruby brew node docker emoji go npm nvm bash zsh-syntax-highlighting osx)

bindkey -v

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export PATH=~/.local/bin:$PATH

source $ZSH/oh-my-zsh.sh

export NPM_USERNAME=mark.sims@acuris.com
export NPM_PASSWORD=AKCp5ZkxLtfhQhfGFQat7RsnoZ521GqNuu8gUjfPc7L65wpVAK814KUpBD8D1R9RztWimT89T
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

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

export TERM="xterm-256color"
alias trim="ex +'bufdo!%s/\s\+$//e' -scxa"
alias retab="ex +'set ts=2' +'bufdo retab' -scxa"

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
