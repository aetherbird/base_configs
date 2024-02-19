#!/bin/bash

# initialize git and setup remote repo
apt-get install -y git


# update cache, install rsync and vim
apt-get update
apt-get install -y rsync vim

# remove any neovim from package manager
apt-get remove neovim

startdir=$(pwd)
mkdir ~/.tmp_neovim
cd ~/.tmp_neovim/
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar xfvz nvim-linux64.tar.gz 
mkdir -p /opt/nvim/
mv ./nvim-linux64/* /opt/nvim/*
cd ~
rm -r ~/.tmp_neovim/
cd $startdir
echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.bashrc /root/.bashrc
