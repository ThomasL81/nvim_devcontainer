#!/usr/bin/env bash
export SHELL=/bin/bash
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH=$PNPM_HOME:$PATH
git clone https://github.com/ThomasL81/my-nvim-config.git ~/.config/nvim
pnpm setup
pnpm -g add ts-node eslint typescript-language-server vscode-langservers-extracted