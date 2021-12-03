# dotfiles_chezmoi

## Installing on Linux

1. Run `sudo apt install -y zsh`
1. Run `chsh -s $(which zsh)`
1. Close and restart the terminal
1. Copy or Configure SSH keys for Github (repo is private)
1. Run `cd $HOME && sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply git@github.com:johnlcox/dotfiles_chezmoi.git`

## Installing on Windows (PowerShell)

1. Install PowerShell (Core) from Windows Store
1. ??? (Initialize chezmoi with the remote repo)
1. Run `.\bin\chezmoi.exe init`
1. Close and restart the terminal
1. Change the font in Windows Terminal for the PowerShell profiles to JetBrainsMono NF (TODO: How to automate this?)