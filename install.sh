#! /bin/bash

echo "Install NeoBundle"
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

echo "link to my vimrc"
ln -s `pwd`/dotfiles/vimrc ~/.vimrc

echo "link to my Xmodmap"
ln -s `pwd`/dotfiles/Xmodmap ~/.Xmodmap

echo "make xmonad dir"
mkdir ~/.xmonad

echo "link to xmonad"
ln -s `pwd`/dotfiles/xmonad.hs ~/.xmonad/xmonad.hs
ln -s `pwd`/dotfiles/xmobarrc.hs ~/.xmobarrc

echo "link to latexmk"
ln -s `pwd`/dotfiles/latexmkrc ~/.latexmkrc

echo "Install Prezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

for f in ~/.zprezto/runcoms/^README.md(.N); do
  ln -s "$f" "~/.${f:t}"
done


