#!/bin/sh

ln -sf ~/dotfiles/.vimrc ~/.vimrc

#install neobundle
mkdir ~/.vim
mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git

#ln -sf ~/dotfiles/colors ~/.vim
#ln -sf ~/dotfiles/ftdetect ~/.vim
#ln -sf ~/dotfiles/indent ~/.vim
#ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
#ln -sf ~/dotfiles/.wgetrc ~/.wgetrc
#ln -sf ~/dotfiles/Brewfile ~/Brewfile
