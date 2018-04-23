bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward

source ~/.zprezto/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:/home/nomuken/.gem/ruby/2.3.0/bin
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# fix typo
alias s='ls'
alias ks='ls'
alias lks'ls'

# alias
alias vim='nvim'
alias disas="objdump -M intel -S"

# shortcuts
alias 'cd-'='cd -'

# git
alias gc='git commit -a -m'
alias gstatus='git status'
alias ga='git add .'
alias gp='git push'
alias glog='git log --graph'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gb='git branch'
alias gref='git reflog'

alias gecld='git rm --cached'

# go confs
export GOPATH=~/Develop/go
export PATH="$PATH:$GOPATH/bin"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
