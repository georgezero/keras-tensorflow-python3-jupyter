#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget -O ~/.vimrc https://gist.githubusercontent.com/giovo/611b082eb62333a8213ee3f0a1e7d713/raw/1c5d620a577d12f833b1032ddd37a3df46250586/.vimrc
#wget -O ~/.vimrc https://gist.githubusercontent.com/giovo/611b082eb62333a8213ee3f0a1e7d713/raw/f09ecf3e1321a9ec33af9f121baf868e9fc70f30/.vimrc
#wget -O ~/.vimrc https://gist.githubusercontent.com/giovo/611b082eb62333a8213ee3f0a1e7d713/raw/a4e18f97777e009c7b7b3c29cc818fbb46aa140c/.vimrc
#wget -O ~/.vimrc https://gist.githubusercontent.com/millermedeiros/1262085/raw/a5b83f59654f427a2b104421f7c31e0e0c776439/.vimrc

vim +PluginInstall +qall

# OR: Launch vim and run :PluginInstall
