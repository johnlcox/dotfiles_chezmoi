if (Test-Path -Path $"$HOME\bin") {
    $env:Path += ";$HOME\bin"
}

if (Test-Path -Path "$HOME\.jenv") {
    $env:Path += ";$HOME\.jenv"
}

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

if (Test-Path -Path "~\AppData\Local\Programs\oh-my-posh\themes") {
    oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\hotstick.minimal.omp.json | Invoke-Expression
}