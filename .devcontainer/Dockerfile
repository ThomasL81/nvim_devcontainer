FROM mcr.microsoft.com/devcontainers/base:alpine 

RUN \
  apk update && apk add --update nodejs npm neovim && \
  npm i -g yarn typescript ts-node mbt @sap/cds-dk

USER vscode

RUN \
  mkdir -p ~/.config && \
  cd ~/.config && \
  git clone https://github.com/ThomasL81/my-nvim-config nvim && \
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
