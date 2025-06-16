#!/usr/bin/env bash

# Installing ripgrep and fd
mkdir ${HOME}/temp
pushd ${HOME}/temp
RIPGREP_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
wget -qO ripgrep.deb "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_${RIPGREP_VERSION}-1_amd64.deb"
sudo apt install -y ./ripgrep.deb
rg --version

FD_URL=$(curl -s "https://api.github.com/repos/sharkdp/fd/releases/latest" | grep -Po '"browser_download_url"\s*:\s*"\K[^"]*/fd_\d+\.\d+\.\d+_amd64\.deb')
wget -qO fd.deb "${FD_URL}"
sudo apt install -y ./fd.deb
fd --version

popd
rm -rf ${HOME}/temp

# Install NeoVim
git clone https://github.com/ThomasL81/my-nvim-config.git ~/.config/nvim

# Allow git from dev container
git config --global --add safe.directory /workspaces/events

source ${NVM_DIR}/nvm.sh
nvm install --lts

export SHELL=/bin/bash
pnpm setup
source ${HOME}/.bashrc

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH=$PNPM_HOME:$PATH
export LANG=en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8

npm i -g pnpm
pnpm -g add tree-sitter-cli ts-node typescript-language-server vscode-langservers-extracted --allow-build=tree-sitter-cli --allow-build=core-js