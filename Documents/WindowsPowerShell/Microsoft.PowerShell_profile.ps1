if (Test-Path -Path "$HOME/.jenv") {
    $env:Path += ";$HOME/.jenv"
}
