#!/usr/bin/env zsh

# Tap the zulu casks from https://github.com/mdogan/homebrew-zulu
brew tap mdogan/zulu

# Create an associative array of the common jdk version keys to brew package names
declare -A zulu_versions
zulu_versions[jdk11]=zulu-jdk11
zulu_versions[jdk17]=zulu-jdk17

versions_to_install=()
for jdk_version in "$@"
do
    versions_to_install+=${zulu_versions[$jdk_version]}
done

brew install --cask ${versions_to_install[@]}

# add to jenv if present
if [ -d "$HOME/.jenv/bin" ]; then
  eval "$(jenv init -)"

  for zulu_version in "${versions_to_install[@]}"; do
    # Use pattern matching on the zulu_version to get just the number
    # https://stackoverflow.com/a/16623897
    jdk_path="/Library/Java/JavaVirtualMachines/zulu-${zulu_version#'zulu-jdk'}.jdk/Contents/Home"
    jenv add $jdk_path
  done
fi