# dotfiles_chezmoi

## Installing on Linux

1. Run `sudo apt install -y zsh`
1. Run `chsh -s $(which zsh)`
1. Close and restart the terminal
1. Copy or Configure SSH keys for Github (repo is private)
1. Run `sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply git@github.com:johnlcox/dotfiles_chezmoi.git`