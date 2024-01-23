#!/usr/bin/env zsh

# Tap the Homebrew casts from https://github.com/Homebrew/homebrew-cask
brew tap homebrew/cask-versions

# Create an associative array of the common jdk version keys to brew package names
declare -A temurin_versions
temurin_versions[jdk11]=temurin11
temurin_versions[jdk17]=temurin17

versions_to_install=()
for jdk_version in "$@"
do
    versions_to_install+=${temurin_versions[$jdk_version]}
done

brew install --cask ${versions_to_install[@]}

# add to jenv if present
if [ -d "$HOME/.jenv/bin" ]; then
  eval "$(jenv init -)"

  for temurin_version in "${versions_to_install[@]}"; do
    # Use pattern matching on the temurin_version to get just the number
    # https://stackoverflow.com/a/16623897
    jdk_path="/Library/Java/JavaVirtualMachines/temurin-${temurin_version#'temurin'}.jdk/Contents/Home"
    jenv add $jdk_path
  done
fi