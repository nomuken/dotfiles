bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward

source ~/.zprezto/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:/home/nomuken/.gem/ruby/2.2.0/bin
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

if [ -e "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)" 
fi

# fix typo
alias s='ls'
alias ks='ls'
alias lks'ls'

# alias
alias vim='nvim'

# shortcuts
alias 'cd-'='cd -'

# git
alias gc='git commit -a -m'
alias gstatus='git status'
alias ga='git add .'
alias gp='git push'
alias glog='git log --graph'
alias gchk='git checkout'
alias gchkb='git checkout -b'
alias gb='git branch'
alias gref='git reflog'

alias gecld='git rm --cached'
