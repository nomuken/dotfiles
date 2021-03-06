# pyenv
# initialize
status --is-interactive; and source (anyenv init -|psub)
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# typo
alias s exa
alias ks exa
alias lks exa
alias ls exa
alias "cd-" "cd -"

# shortcuts
alias vim nvim
alias gvim nvim-qt
alias disas "objdump -M intel -S"

# git
alias gc "git commit -a -m"
alias gst "git status"
alias ga "git add ."
alias gp "git push"
alias gpo "git push -u origin"
alias glg "git log --graph"
alias gch "git checkout"
alias gchb "git checkout -b"
alias gb "git branch"
alias gref "git reflog"
alias grm "git rm --cached"

# go
set -gx GOPATH $HOME/Develop/go
set -gx PATH  $PATH $GOPATH/bin
set -gx GO111MODULE on

set -gx PATH  $PATH (yarn global bin)

