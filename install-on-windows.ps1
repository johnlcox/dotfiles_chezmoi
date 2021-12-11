# Install in ./bin
(iwr -UseBasicParsing https://git.io/chezmoi.ps1).Content | powershell -c -

~/bin/chezmoi.exe init https://github.com/johnlcox/dotfiles_chezmoi.git
~/bin/chezmoi.exe apply

# TODO: Might be able to automate if this whole script is run with admin privs
# Enable running powershell scripts (manual step):
# Set-ExecutionPolicy AllSigned
# Set-ExecutionPolicy RemoteSigned -scope CurrentUser
