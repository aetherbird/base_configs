#!/bin/bash

# update apt cache, install git vim and rsync
apt-get update
apt-get install -y git rsync vim

# remove any neovim from package manager
apt-get remove neovim

# pull and install neovim to /opt/nvim
echo startdir=$(pwd)
startdir=$(pwd)
echo mkdir ~/.tmp_neovim
mkdir ~/.tmp_neovim
echo cd ~/.tmp_neovim/
cd ~/.tmp_neovim/
echo wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
echo rm -rf /opt/nvim 
rm -rf /opt/nvim
echo tar xfvz nvim-linux64.tar.gz
tar xfvz nvim-linux64.tar.gz
echo mkdir -p /opt/nvim/
mkdir -p /opt/nvim/
echo mv ./nvim-linux64/* /opt/nvim/*
mv ./nvim-linux64/* /opt/nvim/*
echo cd ~
cd ~
echo rm -r ~/.tmp_neovim/
rm -r ~/.tmp_neovim/
echo cd $startdir
cd $startdir
