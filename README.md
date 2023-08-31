# dotfiles_chezmoi

## Installing on Linux

1. Run `sudo apt install -y zsh`
1. Run `chsh -s $(which zsh)`
1. Close and restart the terminal
1. Copy or Configure SSH keys for Github (repo is private)
1. Run `cd $HOME && sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply git@github.com:johnlcox/dotfiles_chezmoi.git`

## Installing on Linux (Option 2)

```
sudo apt update -y \
  && sudo apt upgrade -y \
  && sudo apt install -y curl \
  && sh -c "$(curl -fsLs https://raw.githubusercontent.com/johnlcox/dotfiles_chezmoi/main/install-on-linux.sh)"

# Run zsh or restart the terminal
```

## Installing on Windows (PowerShell)

1. Install PowerShell (Core) from Windows Store
1. ??? (Initialize chezmoi with the remote repo)
1. Run `.\bin\chezmoi.exe init`
1. Close and restart the terminal
1. Change the font in Windows Terminal for the PowerShell profiles to JetBrainsMono Nerd Font (TODO: How to automate this?)

## Development / Updating

1. Load `.local/share/chezmoi`
1. Make edits / udates
1. Maybe test locally with `~/bin/chezmoi apply`
1. Commit changes
1. Push changes