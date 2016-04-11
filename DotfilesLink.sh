#!/bin/sh


##### vim #####
# あとでvim起動後に↓　で各プラグインをインストール
# :NeobundleInstall

ln -sf ~/dotfiles/.vimrc ~/.vimrc

#install neobundle
mkdir ~/.vim
mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git

ln -sf ~/dotfiles/.vim/ftplugin ~/.vim
ln -sf ~/dotfiles/.vim/template ~/.vim
#ln -sf ~/dotfiles/indent ~/.vim
#ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
#ln -sf ~/dotfiles/.wgetrc ~/.wgetrc
#ln -sf ~/dotfiles/Brewfile ~/Brewfile
