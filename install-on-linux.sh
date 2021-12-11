#!/usr/bin/env sh

sudo apt -qq install -y git \
  && sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply git@github.com:johnlcox/dotfiles_chezmoi.git
