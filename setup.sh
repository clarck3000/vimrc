#!/bin/sh

VIMRC=$HOME/.vimrc
VIMDIR=$HOME/.vim
VIM_AUTO_LOAD=$HOME/.vim/autoload

wget -O vim-plug.zip https://codeload.github.com/junegunn/vim-plug/zip/master
unzip vim-plug.zip

mkdir  -p $VIMDIR/undodir

mkdir  -p $VIM_AUTO_LOAD
cp vim-plug-master/plug.vim  $VIM_AUTO_LOAD
cp vimrc  $VIMRC

vim -c 'PlugInstall' $VIMRC

