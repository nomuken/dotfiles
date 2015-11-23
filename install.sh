#! /bin/bash

DIR=`pwd`

echo "Install NeoBundle"
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

echo "link to my vimrc"
ln -s $DIR/vimrc ~/.vimrc

echo "link to my Xmodmap"
ln -s $DIR/Xmodmap ~/.Xmodmap

echo "make xmonad dir"
mkdir ~/.xmonad

echo "link to xmonad"
ln -s `pwd`/xmonad.hs ~/.xmonad/xmonad.hs
ln -s `pwd`/xmobarrc.hs ~/.xmobarrc

echo "link to qtile confs"
ln -s $DIR/config/qtile ~/.config/

echo "link to nvim confs"
ln -s $DIR/config/nvim ~/.config/

echo "link to nvim confs"
ln -s $DIR/config/termite ~/.config/

echo "link to latexmk"
ln -s $DIR/latexmkrc ~/.latexmkrc

echo "install my ssh key from github"
curl http://sandbox.spica.bz/sh/installSshKey.sh | bash -

echo "Install Prezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

rm -rf .zsh*

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "source $PWD/zshrc" >> ~/.zshrc
