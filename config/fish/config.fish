# pyenv
# initialize
. (pyenv init - | psub)
. (pyenv virtualenv-init - | psub)

# typo
alias s ls
alias ks ls
alias lks ls
alias "cd-" "cd -"

# shortcuts
alias vim nyaovim
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
