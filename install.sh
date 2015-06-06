#! /bin/bash

echo "Install NeoBundle"
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

echo "link to my vimrc"
ln -s `pwd`/vimrc ~/.vimrc

echo "link to my Xmodmap"
ln -s `pwd`/Xmodmap ~/.Xmodmap

echo "make xmonad dir"
mkdir ~/.xmonad

echo "link to xmonad"
ln -s `pwd`/xmonad.hs ~/.xmonad/xmonad.hs
ln -s `pwd`/xmobarrc.hs ~/.xmobarrc

echo "link to latexmk"
ln -s `pwd`/latexmkrc ~/.latexmkrc

echo "Install Prezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
