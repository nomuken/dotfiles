# hello brew
set PATH /opt/homebrew/bin $PATH

# for macOS
set PATH $HOME/bin $PATH

set fish_greeting

# google cloud sdk
if test -f /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
  source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end

if type direnv > /dev/null 2>&1
  direnv hook fish | source
end

# typo
alias s lsd
alias ks lsd
alias lks lsd
alias ls lsd
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

