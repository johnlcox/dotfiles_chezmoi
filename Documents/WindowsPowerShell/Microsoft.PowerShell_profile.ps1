if (Test-Path -Path "$HOME/.jenv") {
    $env:Path += ";$HOME/.jenv"
}

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward