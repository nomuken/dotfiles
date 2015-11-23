bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:/home/nomuken/.gem/ruby/2.2.0/bin
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

alias vim='nvim'
alias s='ls'
alias ks='ls'

# git
alias gc='git commit -a -m'
alias ga='git add .'
alias gp='git push'
alias glog='git log --graph'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
